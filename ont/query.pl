:- module(query,
    [ query/1
    , query/3
    ]
).

:- ensure_loaded(book).

% eg query(['1'-title-T, '1'-children-C]).
query(Where) :-
    maplist(query_, Where).

query_(S-P-O) :-
    frame(S, P, O).

query(S, P, O) :-
    frame(S, P, O).
