:- use_module(library(http/html_write), [reply_html_page//1, html//1]).
:- use_module(library(http/http_dispatch), [http_404/2]).

:- ensure_loaded(html_components/html_components).
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
        html(body([ \navbar(N)
                  , div(class(row),
                  [ div([class([collapse, nav, 'flex-column', 'col-xs-6', 'col-sm-3', 'mb-2', 'ml-2']), id(sidenav)], \sidenav)
                        , div(class(col), main([role(main), class([container])], Body))
                        ])
                  , \scripts(N)
                  ])
              ).

% A Page whose purpose is to point to it's children
navigation_artifact(Number, Title) -->
    html(
    [ div(class(chapter_header),
        [ h2(class('chapter_num text-right mb-5'), "Chapter ~w"-[Number])
        , h1(class('chapter_title text-right border-bottom border-dark mb-3'), Title)
        ])
    , div(class(row),
        [ div(class(col),
            [ h5("Sections:")
            , \navigation_children(Number)
            ])
        , \chapter_goals(Number)
        ])
    ]
 ).



