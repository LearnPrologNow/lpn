:- use_module(library(http/html_write), [reply_html_page//1, html//1]).
:- use_module(library(http/http_dispatch), [http_404/2]).

:- ensure_loaded(www(html_components/html_components)).
:- ensure_loaded(www(book/book)).
:- ensure_loaded(www(ont/query)).

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
        [ div(class([container, 'bg-dark', 'text-white', 'p-5']),
            [ h1("Under Development")
            , p(class(lead), [ "Welcome to the demo for this interactive version of "
                             , em("Learn Prolog Now!")
                             ])
            , h2(class(['text-center', 'bg-light', 'p-3']), a([href('/section/1'), class('text-primary')], "Jump to demo: Chapter 1"))
            , p("Many thanks to the authors:")
            , ul(class('list-group'),
                [ li(class('list-group-item bg-secondary'), a([href('http://www.patrickblackburn.org/'), target('_blank')], "Patrick Blackburn"))
                , li(class('list-group-item bg-secondary'), a([href('http://www.let.rug.nl/bos/'), target('_blank')], "Johan Bos"))
                , li(class('list-group-item bg-secondary'), a([href('http://cs.union.edu/~striegnk/'), target('_blank')], "Kristina Striegnitz"))
                ])
            , p(class('mt-2'), [ "This project is licensed under "
                , a([href('https://creativecommons.org/licenses/by-sa/4.0/'), target('_blank')], "Creative Commons License Attribution-ShareAlike 4.0 International")
                ])
            , p([" Source Code, Development and License available at "
                , a([href('https://github.com/PaulBrownMagic/lpn/tree/master/www/html_components'), target('_blank')], "this fork of lpn on GitHub")
                ])
            ])
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



