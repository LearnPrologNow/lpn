mcq_quiz(N) -->
    { query(N, questions, Qs), query(N, question_opts, Opts) },
    html(
        [ div(class('col-sm-9'),
            [ div(class('table-responsive'),
                table(class([table, 'table-striped', 'sticky-header']),
                [ thead(class('bg-white'), tr([th([]), \th_opt(Opts)]))
                    , tbody(\mcq_questions(Opts, Qs))
                    ]))
            , input( [ id(submitbtn), type(button), value("Submit"), class([btn, 'btn-primary', disabled, 'mr-3'])], [])
            , label( [ for(submitbtn), class('text-muted') ], small("You must be logged in to track your learning"))
            ])
        , div(class('col-sm-3'), ul([class('list-group'), id(feedback)], []))
        , script([type('text/prolog'), id('questions.pl')], \pl_questions(Qs) )
        ]
    ).

th_opt([]) --> [].
th_opt([Opt|Tail]) --> html(th([class('text-center'), scope(col)], Opt)), th_opt(Tail).

mcq_questions(_, []) --> [].
mcq_questions(Opts, [question(Name, _, _)|T]) -->
    html(tr(
        [ th([class(['text-right']), scope(row)], Name)
        , \mcq_question(Opts, Name)
        ])
    ),
    mcq_questions(Opts, T).

mcq_question([], _) --> [].
mcq_question([Opt|T], Name) -->
    html(td(class('text-center'), label(class(['btn btn-secondary']), input([type(radio), name(Name), id("~w~w"-[Name, Opt]), value(Opt)], [])))),
    mcq_question(T, Name).
