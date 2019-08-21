chapter_header(Number, Title) -->
    html(
    [ div(class(chapter_header),
        [ h2(class('chapter_num text-right mb-5'), "Chapter ~w"-[Number])
        , h1(class('chapter_title text-right border-bottom border-dark mb-3'), Title)
        ])
    , div(class(row),
        [ div(class('chapter_children col-3'),
            [ h5("Sections:")
            , \chapter_children(Number)
            ])
        , div(class('col-9 chapter_goals card bg-light'),
            [ div(class('card-body'),
                [ h5(class('card-title'), "Main goals:")
                , \chapter_goals(Number)
                ])
            ])
        ])
    ]
 ).

chapter_goals(N) -->
    { info(N, goals, Goals) },
    html(ol(class([goal_list, 'list-group', 'list-group-flush']),
            \to_li(Goals)
            )
        ).

chapter_children(N) -->
    { info(N, children, Children) },
    html(ul(class([nav, 'flex-column']), \nav_item(Children))).

section_heading1(N) -->
    { info(N, title, Title) },
    html(h1("~w ~w"-[N, Title])).

section_heading2(N) -->
    { info(N, title, Title) },
    html(h2("~w ~w"-[N, Title])).

nav_item([]) --> [].
nav_item([H|T]) -->
    {info(H, title, Title)},
    html(li(class('nav-item'), [small(H), a([class('pl-3'), href("/section/~w"-[H])], Title)])),
    nav_item(T).


to_li([]) --> [].
to_li([H|T]) --> html(li(class('list-group-item'), H)), to_li(T).

ol_num(N) --> html(span(class([badge, 'badge-secondary', 'p-1', 'mr-3']), N)).

prolog_code(Code) -->
    html(code(class('lang-prolog'), Code)).

static_code(Code) -->
    html(pre(code(class('lang-prolog'), Code))).

code_block(ID, Block) -->
    { atomics_to_string(Block, "\n", Code), length(Block, Rows) },
    html(textarea([class([code, 'form-control', 'mb-2']), id(ID), rows(Rows)], Code)).

code_query(ID, Query) --> {random_id(UUID)}, html(
    div(class('form align-items-center'),
    div(class('input-group mb-2'),
          [ div(class('input-group-prepend'), pre(class('query_prompt input-group-text'), "?-"))
          , input([class([query, 'form-control']), value(Query), placeholder(Query), type(text), id(UUID)])
          , div(class('input-group-append'), input([class([btn, 'btn-primary']), type(button), value("Run Query"), onclick("query(~w, ~q, this)"-[ID, UUID]), onkeypress("button_key(event.charCode, ~w, ~q, this)"-[ID, UUID])]))
          ])
       )
    ).

random_id(ID) :-
    length(Codes, 12),
    maplist(random_between(97, 122), Codes),
    maplist(char_code, Chars, Codes),
    atomic_list_concat(Chars, ID).
