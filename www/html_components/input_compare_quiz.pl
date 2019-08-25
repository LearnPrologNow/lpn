frame('1.3.3',
    [ ako-'AssessmentArtifact'
    , title-"Functor and Arity"
    , type-'auto-compare'
    , questions-[ question('loves(Vincent, mia)', 'loves/2', 'the functor precedes the brackets, the arity is the count of arguments')
                , question('butch(Boxer)', 'butch/1', 'the functor precedes the brackets, the arity is the count of arguments')
                , question('and(big(burger), kahuna(burger))', 'and/2', 'whether arguments are complex terms or not, they still count as 1 each')
                , question('and(big(X), kahuna(X))', 'and/2', 'whether arguments are complex terms or not, they still count as 1 each')
                , question('kills(Butch, Vincent)', 'kills/2', 'the functor precedes the brackets, the arity is the count of arguments')
                ]
    , assesses-[ recognize('complex term comprised of a functor and arguments')
               , remember('definition of arity')
               , infer('arity of a complex term')
               , remember('functor/arity syntax')
               , remember('syntax of a complex term')
               ]
    ]
).

input_compare_quiz(N) -->
    { query(N, questions, Qs) },
    html(
        [ div(class('col-sm-9'),
            [ form(\compare_questions(Qs))
            ])
        , div(class('col-sm-3'), ul([class('list-group'), id(feedback)], []))
        , script([type('text/prolog'), id('questions.pl')], \pl_questions(Qs) )
        ]
    ).

compare_questions([]) --> [].
compare_questions([question(Q, _, _)|T]) -->
    html( div(class('input-group'),
        [ div(class('input-group-prepend'), span([class('input-group-text'), id(Q)], Q))
        , input([type(text), class('form-control'), 'aria-describedby'=Q], [])
        ])
    ),
    compare_questions(T).
