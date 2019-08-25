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