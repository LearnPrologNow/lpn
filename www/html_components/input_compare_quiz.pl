input_compare_quiz(N) -->
    { query(N, questions, Qs) },
    html(
        [ div(class('col-sm-9'),
            [ form(id("quiz"), \compare_questions(Qs))
            ])
        , div(class('col-sm-3'), ul([class('list-group'), id(feedback)], []))
        , script([type('text/prolog'), id('questions.pl')], \pl_questions(Qs) )
        ]
    ).

compare_questions([]) --> [].
compare_questions([question(Q, _, _)|T]) -->
    html( div(class('input-group'),
        [ div(class('input-group-prepend'), span([class('input-group-text'), id(Q)], Q))
        , input([type(text), class('form-control text-monospace'), 'aria-describedby'=Q], [])
        ])
    ),
    compare_questions(T).
