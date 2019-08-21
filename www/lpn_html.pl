:- use_module(library(http/html_write)).

:- ensure_loaded(html_blocks).
:- ensure_loaded(book/book).

reply_lpn_section(N, _Request) :-
    info(N, title, Page),
    reply_html_page(
	    lpn_base(N),   % define the base of the page
        [ meta([name("viewport"), content("width=device-width, initial-scale=1, shrink-to-fit=no")])
        , meta([name("description"), content("Learn Prolog Now! - ~w"-[Page])])
        , meta([name("author"), content("Paul Brown")])
        , title("~w | LPN!"-[Page])
        , link([href("/static/css/bootstrap.min.css"), rel(stylesheet)])
        , link([href("/static/css/lpn.css"), rel(stylesheet)])
        , link([href("/static/css/prism.css"), rel(stylesheet)])
        ],
	    [\section(N)]).

reply_lpn_page(Page, Request) :-
	reply_html_page(
	    lpn_base,   % define the base of the page
        [ meta([name("viewport"), content("width=device-width, initial-scale=1, shrink-to-fit=no")])
        , meta([name("description"), content("Learn Prolog Now! - ~w"-[Page])])
        , meta([name("author"), content("Paul Brown")])
        , title("~w | LPN!"-[Page])
        , link([href("/static/css/bootstrap.min.css"), rel(stylesheet)])
        , link([href("/static/css/lpn.css"), rel(stylesheet)])
        , link([href("/static/css/prism.css"), rel(stylesheet)])
        ],
	    [\page_content(Page, Request)]).

page_content("Preface", _R) --> preface.
page_content("Introduction", _R) --> introduction.

page_content(_Page, _Request) -->
	html(
	   [
	    h2('Page Specific Header'),
	    p('with styling')
	   ]).


% Body will be included
body(lpn_base(N), Body) -->
        html(body([ \navbar(N),
                    main([role(main), class(container)], Body),
                    \scripts(N)
                  ])).

navbar(N) -->
    html(nav(class([navbar, 'navbar-expand-md', 'navbar-dark', 'bg-dark', 'fixed-top']),
    [ a([class('navbar-brand'), href('/')], "Learn Prolog Now!")
    , button([class('navbar-toggler'), type(button), 'data-toggle'=collapse, 'data-target'="#navbarMain", 'aria-controls'="navbarMain", 'aria-expanded'=false, 'aria-label'="Toggle navigation"], span([class('navbar-toggler-icon')],[]))
    , div([class([collapse, 'navbar-collapse']), id(navbarMain)],
          [ ul(class(['navbar-nav', 'mr-auto']),
               [ li(['aria-label'=breadcrumb], ol(class('breadcrumb mb-0'), \breadcrumbs(N, N)))
               , \child_or_sibling(N)
               ])
          ])
    ])
).

breadcrumbs(N, O) -->
    { dif(N, O), \+ has_parent(N, _), info(N, title, T) },
    html(li([class('breadcrumb-item'), aria-current=page], a([href("/section/~w"-[N])], "~w: ~w"-[N, T]))).
breadcrumbs(N, N) -->
    { \+ has_parent(N, _), info(N, title, T) },
    html(li([class('breadcrumb-item active'), aria-current=page], "~w: ~w"-[N, T])).
breadcrumbs(N, O) -->
    { dif(N, O), has_parent(N, P), info(N, title, T) },
    breadcrumbs(P, O),
    html(li([class('breadcrumb-item'), aria-current=page], a([href("/section/~w"-[N])], "~w: ~w"-[N, T]))).
breadcrumbs(N, N) -->
    { has_parent(N, P), info(N, title, T) },
    breadcrumbs(P, N),
    html(li([class('breadcrumb-item active'), aria-current=page], "~w: ~w"-[N, T])).

child_or_sibling(N) -->
    { has_parent(C, N), info(C, title, T) },
    cs_btn(C, T).
child_or_sibling(N) -->
    { info(_, children, Cs), sibling(N, S, Cs), info(S, title, T) },
    cs_btn(S, T).
child_or_sibling(N) -->
    { has_parent(N, P), has_ancestor(P, GP), has_parent(C, GP), C @> P, info(C, title, T) },
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
    info(P, children, Cs),
    member(C, Cs).

scripts(N) -->
    { info(N, questions, _) },
    html(
        [ script([src('/static/js/jquery-3.4.1.min.js')],[])
        , script([src('/static/js/bootstrap.bundle.min.js')], [])
        , script([src('/static/js/prism.js')], [])
        , script([src('/static/js/tau-prolog.js')], [])
        , script([src('/static/js/tau-quiz.js')], [])
        ]
    ).

scripts(N) -->
    { \+ info(N, questions, _) },
    html(
        [ script([src('/static/js/jquery-3.4.1.min.js')],[])
        , script([src('/static/js/bootstrap.bundle.min.js')], [])
        , script([src('/static/js/prism.js')], [])
        , script([src('/static/js/tau-prolog.js')], [])
        , script([src('/static/js/interactive_pl.js')], [])
        ]
    ).


