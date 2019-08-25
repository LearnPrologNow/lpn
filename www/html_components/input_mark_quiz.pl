input_mark_quiz(N) -->
    { query(N, questions, Qs) },
    html([ form(id("quiz"), \mark_questions(Qs))
         , script([type('text/prolog'), id('questions.pl')], \pl_questions(Qs) )
         ]).

mark_questions([]) --> [].
mark_questions([question(Q, A)|T]) --> {random_id(ID)},
    html([ div(class('input-group'),
            [ div(class('input-group-prepend'), span([class('input-group-text')], Q))
            , input([type(text), class('form-control answer text-monospace text-right'), 'aria-describedby'=Q, id(ID), 'data-answer'=A], [])
            , div(class('input-group-append markscheme collapse'), div(class('input-group-text'), input([type(checkbox), 'aria-label'='Mark prior answer as correct', onclick('validate(~q, this.checked)'-[ID])], [])))
            ])
            , p(class(['form-text', 'text-right', 'markscheme', collapse]), \inline_code(A))
        ]
    ),
    mark_questions(T).
