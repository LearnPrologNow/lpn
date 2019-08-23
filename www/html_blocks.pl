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


% A lazy <h1>
section_heading1(N) -->
    { query(N, title, Title) },
    html(h1("~w ~w"-[N, Title])).

% A lazy <h2>
section_heading2(N) -->
    { query(N, title, Title) },
    html(h2("~w ~w"-[N, Title])).


% Bootstrap doesn't number ordered lists, this block uses a badge to add a number
ol_num(N) --> html(span(class([badge, 'badge-secondary', 'p-1', 'mr-3']), N)).

% Inline prolog code, syntax highlighting client-side with Prism.js
inline_code(Code) -->
    html(code(class('lang-prolog'), Code)).

% Prolog code block, non-interactive, syntax highlighting client-side with Prism.js
static_code_block(Code) -->
    html(pre(code(class('lang-prolog'), Code))).

% Interactive code block
code_block(ID, Block) -->
    { atomics_to_string(Block, "\n", Code), length(Block, Rows) },
    html(textarea([class([code, 'form-control', 'mb-2', 'text-monospace']), id(ID), rows(Rows)], Code)).

% A Query for a code block
code_query(ID, Query) --> {random_id(UID)}, html(
    div(class('form align-items-center'),
    div(class('input-group mb-2'),
          [ div(class('input-group-prepend'), pre(class('query_prompt input-group-text'), "?-"))
          , input([class([query, 'form-control', 'text-monospace']), value(Query), placeholder(Query), type(text), id(UID)])
          , div(class('input-group-append'), input([class([btn, 'btn-primary']), type(button), value("Run Query"), onclick("query(~w, ~q, this)"-[ID, UID]), onkeypress("button_key(event.charCode, ~w, ~q, this)"-[ID, UID])]))
          ])
       )
    ).

random_id(ID) :-
    length(Codes, 12),
    maplist(random_between(97, 122), Codes),
    maplist(char_code, Chars, Codes),
    atomic_list_concat(Chars, ID).
