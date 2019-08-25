pl_questions([]) --> [].
pl_questions([H|T]) -->
    { term_to_atom(H, A) },
    html([A, '.']), pl_questions(T).
