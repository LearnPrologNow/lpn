:- module(query,
    [ query/1
    , query/3
    ]
).

:- prolog_load_context(directory, Dir),
   asserta(user:file_search_path(ont, Dir)).

:- ensure_loaded(ont(book)).

% eg query(['1'-title-T, '1'-children-C]).
query(Where) :-
    maplist(query_, Where).

query_(S-P-O) :-
    frame(S, P, O).

query(S, P, O) :-
    frame(S, P, O).
