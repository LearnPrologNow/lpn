get_triple(S, P, O) :-
    nonvar(S), !,
    call(S, P, O).
get_triple(S, P, O) :-
    nonvar(P), !,
    call(P, S, O).
