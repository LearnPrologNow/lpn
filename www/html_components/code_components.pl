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
code_query(ID, Query) --> {random_id(UID)}, 
    html(
        div(class('form align-items-center'), [
            div(class('input-group mb-2'), [
                div(class('input-group-prepend'), pre(class('query_prompt input-group-text'), "?-")),
                input([class([query, 'form-control', 'text-monospace']), value(Query), placeholder(Query), type(text), id(UID)]),
                div(class('input-group-append'), [
                    input([class('btn btn-primary'), type(button), id("query-~q"-[UID]), value("Run Query"), onclick("query(~w, ~q, this)"-[ID, UID]), onkeypress("button_key(event.charCode, ~w, ~q, this)"-[ID, UID])]),
                    input([class('btn btn-primary'), style='display:none', type(button), id("next-~q"-[UID]), value("Next Answer"), onclick("query(~w, ~q, this)"-[ID, UID]), onkeypress("button_key(event.charCode, ~w, ~q, this)"-[ID, UID])]),
                    input([class('btn btn-warning'), style='display:none', type(button), id("clear-~q"-[UID]), value("Clear Answers"), onclick("clear_button(~q)"-[UID])])
                ])
            ]),
            ul([class('list-group mb-2'), style='display:none', id("results-~q"-[UID])], [
                li(class('list-group-item list-group-item-success template success d-none'), []),
                li(class('list-group-item list-group-item-warning template warning d-none'), [])
            ])
        ]
       )
    ).

random_id(ID) :-
    length(Codes, 12),
    maplist(random_between(97, 122), Codes),
    maplist(char_code, Chars, Codes),
    atomic_list_concat(Chars, ID).
