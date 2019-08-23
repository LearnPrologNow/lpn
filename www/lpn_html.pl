:- use_module(library(http/html_write), [reply_html_page]).
:- use_module(library(http/http_dispatch), [http_404]).

:- ensure_loaded(html_blocks).
:- ensure_loaded(book/book).
:- ensure_loaded('../ont/query').

% tmp home page
say_hi(_R) :-
    reply_html_page(
        lpn_base,
        [ meta([name("viewport"), content("width=device-width, initial-scale=1, shrink-to-fit=no")])
        , meta([name("description"), content("Learn Prolog Now!")])
        , meta([name("author"), content("Paul Brown")])
        , title("~w | LPN!"-['Home'])
        , link([href("/static/css/bootstrap.min.css"), rel(stylesheet)])
        , link([href("/static/css/lpn.css"), rel(stylesheet)])
        , link([href("/static/css/prism.css"), rel(stylesheet)])
        ],
        [ div(class(container), [h1("Under Development"), a(href('/section/1'), "Jump to Book, Chapter 1") ])
        ]
    ).

% All book content served via /section/N where N is a unique identifying number
reply_lpn_section(N, _Request) :-
    query(N, title, Page),
    reply_html_page(
	    lpn_base(N),   % the base layout of the page, into which content is inserted
        % Head
        [ meta([name("viewport"), content("width=device-width, initial-scale=1, shrink-to-fit=no")])
        , meta([name("description"), content("Learn Prolog Now! - ~w"-[Page])])
        , meta([name("author"), content("Paul Brown")])
        , title("~w | LPN!"-[Page])
        , link([href("/static/css/bootstrap.min.css"), rel(stylesheet)])
        , link([href("/static/css/lpn.css"), rel(stylesheet)])
        , link([href("/static/css/prism.css"), rel(stylesheet)])
        ],
        % Body
	    [\section(N)]).

% Can't find page with identifier N, so 404
reply_lpn_section(N, R) :-
    \+ query(N, title, _), % Page is not known
    http_404([], R).


% Body will be included
body(lpn_base(N), Body) -->
        html(body([ \navbar(N),
        main([role(main), class([container, row])], [div([class([collapse, nav, 'flex-column']), id(sidenav)], \sidenav(N)), div(class('col'), Body)]),
                    \scripts(N)
                  ])).

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

sidenav(N) --> html(
    ul([id(booknav), class(['list-group', 'sticky-top'])],
        [ li(class(['pl-2', 'list-group-item', 'nav-item']), a(href('/'), "Learn Prolog Now!"))
        , \sidenav_items(3, N, ['0.1', '0.2', '1'])
        ])
     ).
sidenav_items(_, _, []) --> [].
sidenav_items(M, N, [H|T]) --> sidenav_item(M, N, H), sidenav_items(M, N, T).
sidenav_item(M, A, N) --> { query([N-children-C, N-title-Title]), succ(M, NM) },
    html(
        [ li([class(["pl-~w"-[M], 'list-group-item', 'nav-item', caret]), onclick="expand_book_nav(this)"], a(href('/section/~w'-[N]), "~w: ~w"-[N, Title]))
        , ul(class([nested, collapse, 'list-group']), \sidenav_items(NM, A, C))
        ]
    ).
sidenav_item(M, A, N) --> { \+ query(N, children, []), query(N, title, Title) }, html(li(class(["pl-~w"-[M], 'list-group-item', 'nav-item']), a(href('/section/~w'-[N]), "~w: ~w"-[N, Title]))).

% Scripts for quiz pages
scripts(N) -->
    { query(N, ako, 'AssessmentArtifact') },
    html(
        [ script([src('/static/js/jquery-3.4.1.min.js')],[])
        , script([src('/static/js/bootstrap.bundle.min.js')], [])
        , script([src('/static/js/prism.js')], [])
        , script([src('/static/js/tau-prolog.js')], [])
        , script([src('/static/js/tau-quiz.js')], [])
        , script([src('/static/js/lpn.js')], [])
        ]
    ).

% Scripts for non-quiz pages
scripts(N) -->
    { \+ query(N, ako, 'AssessmentArtifact') },
    html(
        [ script([src('/static/js/jquery-3.4.1.min.js')],[])
        , script([src('/static/js/bootstrap.bundle.min.js')], [])
        , script([src('/static/js/prism.js')], [])
        , script([src('/static/js/tau-prolog.js')], [])
        , script([src('/static/js/interactive_pl.js')], [])
        , script([src('/static/js/lpn.js')], [])
        ]
    ).


