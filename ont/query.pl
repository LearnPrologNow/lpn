:- module(query,
    [ query/1
    , query/2
    , query/3
    ]
).

:- ensure_loaded(book).

query(S-P-O) :-
    frame(S, P, O).

query(S, P, O) :-
    frame(S, P, O).

query(_Vars, Where) :-
    maplist(query, Where).
