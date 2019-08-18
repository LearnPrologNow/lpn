compile_frames :-
    findall(C-S, frame(C, S), Concepts),
    setup_call_cleanup(open('data.pl', write, Stream, [alias(frames), type(binary)]),
                       maplist(compile_frame, Concepts),
                       close(Stream)
                   ).


compile_frame(ID-Slots) :-
    maplist(compile_triple(ID), Slots).

compile_triple(S, P-O) :-
    format(frames, "frame(~q, ~q, ~q).~n", [S, P, O]).
