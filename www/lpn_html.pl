:- use_module(library(http/html_write)).

:- consult(front_matter).
:- consult(chapters).

reply_lpn_page(Page, Request) :-
	reply_html_page(
	    lpn_base,   % define the base of the page
        [ meta([name("viewport"), content("width=device-width, initial-scale=1, shrink-to-fit=no")])
        , meta([name("description"), content("Learn Prolog Now! - ~w"-[Page])])
        , meta([name("author"), content("Paul Brown")])
        , title("~w | LPN!"-[Page])
        , link([href("/static/css/bootstrap.min.css"), rel(stylesheet)])
        , link([href("/static/css/lpn.css"), rel(stylesheet)])
        ],
	    [\page_content(Page, Request)]).

page_content("Preface", _R) --> preface.
page_content("Introduction", _R) --> introduction.
page_content("Ch1", _R) --> chapter_header(1).
page_content("Section 1.1", _R) --> section(1.1).

page_content(_Page, _Request) -->
	html(
	   [
	    h2('Page Specific Header'),
	    p('with styling')
	   ]).


% Body will be included
body(lpn_base, Body) -->
        html(body([ \navbar,
                    main([role(main), class(container)], Body),
                    \scripts
                  ])).

navbar -->
    html(nav(class([navbar, 'navbar-expand-md', 'navbar-dark', 'bg-dark', 'fixed-top']),
    [ a([class('navbar-brand'), href('/')], "Learn Prolog Now!")
    , button([class('navbar-toggler'), type(button), 'data-toggle'=collapse, 'data-target'="#navbarMain", 'aria-controls'="navbarMain", 'aria-expanded'=false, 'aria-label'="Toggle navigation"], span([class('navbar-toggler-icon')],[]))
    , div(class([collapse, 'navbar-collapse']), id(navbarMain),
          [ ul(class(['navbar-nav', 'mr-auto']),
               [ li(class('nav-item'), [a([class('nav-link'), href("/")], "Home")])
               ])
          ])
    ])
).

scripts -->
    html(
        [ script([src('/static/js/jquery-3.3.1.slim.min.js')],[])
        , script([src('/static/js/bootstrap.bundle.min.js')], [])
        ]
    ).
