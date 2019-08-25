% A Chapter summarizes it's learning goals
chapter_goals(N) -->
    { \+ query(N, goals, _) }, [].
chapter_goals(N) -->
    { query(N, goals, Goals) },
    html(
        div(class('col-9 chapter_goals card bg-light'),
            [ div(class('card-body'),
                [ h5(class('card-title'), "Main goals:")
                , ol(class([goal_list, 'list-group', 'list-group-flush']), \to_li(Goals))
                ])
            ])
        ).

to_li([]) --> [].
to_li([H|T]) --> html(li(class('list-group-item'), H)), to_li(T).

% The nav links to the navigation artifacts children
navigation_children(N) -->
    { query(N, children, Children) },
    html(ul(class([nav, 'flex-column']), \nav_item(Children))).

nav_item([]) --> [].
nav_item([H|T]) -->
    {query(H, title, Title)},
    html(li(class('nav-item'), [small(H), a([class('pl-3'), href("/section/~w"-[H])], Title)])),
    nav_item(T).


% A <h1> from section number
section_heading1(N) -->
    { query(N, title, Title) },
    html(h1("~w ~w"-[N, Title])).

% A <h2> from section number
section_heading2(N) -->
    { query(N, title, Title) },
    html(h2("~w ~w"-[N, Title])).

% Bootstrap doesn't number ordered lists, this block uses a badge to add a number
ol_num(N) --> html(span(class([badge, 'badge-secondary', 'p-1', 'mr-3']), N)).

% Top navbar with breadcrumb nav
navbar(N) -->
    html(nav(class([navbar, 'justify-content-start', 'navbar-dark', 'bg-dark', 'fixed-top']),
    [ button([class('navbar-toggler mr-2'), type(button), 'data-toggle'=collapse, 'data-target'='#sidenav', 'aria-controls'="sidenav", 'aria-expanded'=false, 'aria-label'="Toggle book navigation", onclick("toggleshowingbooknav()")], span([], [&("#128214")]))
    , a([class('navbar-brand'), href('/')], "Learn Prolog Now!")
    , nav(class('navbar-expand-md'),
        [ button([class('navbar-toggler'), type(button), 'data-toggle'=collapse, 'data-target'="#navbarMain", 'aria-controls'="navbarMain", 'aria-expanded'=false, 'aria-label'="Toggle navigation"], span([class('navbar-toggler-icon')],[]))
        , div([class([collapse, 'navbar-collapse']), id(navbarMain)],
              [ ul(class(['navbar-nav', 'mr-auto']),
                   [ li(['aria-label'=breadcrumb], ol(class('breadcrumb mb-0'), \breadcrumbs(N, N)))
                   , \child_or_sibling(N)
                   ])
              ])
        ])
    ])
).


breadcrumbs(N, O) -->
    { dif(N, O), \+ has_parent(N, _), query(N, title, T) },
    html(li([class('breadcrumb-item'), aria-current=page], a([href("/section/~w"-[N])], "~w: ~w"-[N, T]))).
breadcrumbs(N, N) -->
    { \+ has_parent(N, _), query(N, title, T) },
    html(li([class('breadcrumb-item active'), aria-current=page], "~w: ~w"-[N, T])).
breadcrumbs(N, O) -->
    { dif(N, O), has_parent(N, P), query(N, title, T) },
    breadcrumbs(P, O),
    html(li([class('breadcrumb-item'), aria-current=page], a([href("/section/~w"-[N])], "~w: ~w"-[N, T]))).
breadcrumbs(N, N) -->
    { has_parent(N, P), query(N, title, T) },
    breadcrumbs(P, N),
    html(li([class('breadcrumb-item active'), aria-current=page], "~w: ~w"-[N, T])).

child_or_sibling(N) -->
    { has_parent(C, N), query(C, title, T) },
    cs_btn(C, T).
child_or_sibling(N) -->
    { query(_, children, Cs), sibling(N, S, Cs), query(S, title, T) },
    cs_btn(S, T).
child_or_sibling(N) -->
    { has_parent(N, P), has_ancestor(P, GP), has_parent(C, GP), C @> P, query(C, title, T) },
    cs_btn(C, T).
child_or_sibling(_) --> []. % The last item in the tree
cs_btn(N, T) -->
    html(li([class('nav-item btn btn-info btn-sm ml-2'), aria-current=page], a([class('nav-link text-white'), href("/section/~w"-[N])], [&(raquo), ' ', "~w: ~w"-[N, T]]))).


sibling(A, B, [A, B|_]) :- !.
sibling(A, B, [_|T]) :-
    sibling(A, B, T).

has_ancestor(C, A) :-
    has_parent(C, A).
has_ancestor(C, A):-
    has_parent(C, P),
    has_ancestor(P, A).
has_parent(C, P) :-
    query(P, children, Cs),
    member(C, Cs).

sidenav --> html(
    ul([id(booknav), class(['list-group', 'sticky-top'])],
        [ li(class(['pl-2', 'list-group-item', 'nav-item']), a([class(['nav-link']), href('/')], "Learn Prolog Now!"))
        , \sidenav_items(2, ['0.1', '0.2', '1'])
        ])
     ).
sidenav_items(_, []) --> [].
sidenav_items(M, [H|T]) --> sidenav_item(M, H), sidenav_items(M, T).
sidenav_item(M, N) --> { query([N-children-C, N-title-Title]), succ(M, NM) },
    html(
        [ li([class(["pl-~w"-[M], 'list-group-item', 'nav-item', 'p-1'])], [ span([class(caret), onclick("expand_book_nav(this)")], []), \sidenav_a(N, Title)])
        , ul(class([nested, collapse, 'list-group']), \sidenav_items(NM, C))
        ]
    ).
sidenav_item(M, N) --> { \+ query(N, children, []), query(N, title, Title) }, html(li(class(["pl-~w"-[M], 'list-group-item', 'nav-item', 'p-1']), \sidenav_a(N, Title))).
sidenav_a(N, T) --> html(a([class(['nav-link', 'd-inline']), id("n~w"-[N]), href("/section/~w"-[N])], "~w: ~w"-[N, T])).


