compile_frames :-
    findall(C-S, concept(C, S), Concepts),
    setup_call_cleanup(open('data.pl', write, Stream, [alias(frames), type(binary)]),
                       maplist(compile_frame, Concepts),
                       close(Stream)
                   ).


compile_frame(ID-Slots) :-
    maplist(compile_triple(ID), Slots).

compile_triple(S, P-O) :-
    sub_to_file(S, P, O),
    pred_to_file(P, S, O).

sub_to_file(P, S, O) :-
    string(O), !,
    format(frames, "'~w'(~w, \"~w\").~n", [P, S, O]).

sub_to_file(P, S, O) :-
    \+ string(O), !,
    format(frames, "'~w'(~w, '~w').~n", [P, S, O]).

pred_to_file(P, S, O) :-
    string(O), !,
    format(frames, "~w('~w', \"~w\").~n", [P, S, O]).

pred_to_file(P, S, O) :-
    \+ string(O), !,
    format(frames, "~w('~w', '~w').~n", [P, S, O]).
