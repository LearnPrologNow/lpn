section('1.3.1') -->
    html(
    [ \section_heading2('1.3.1')
    , p("Which of the following sequences of characters are atoms, which are variables, and which are neither?")
    , div(class(row), \mcq_quiz('1.3.1'))
    ]
).

section('1.3.2') -->
    html(
    [ \section_heading2('1.3.2')
    , p("Which of the following sequences of characters are atoms, which are variables, which are complex terms, and which are not terms at all?")
    , div(class(row), \mcq_quiz('1.3.2'))
    ]
).

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
        , script([type('text/prolog'), id('questions.pl')], \pl_mcq_questions(Qs) )
        ]
    ).

th_opt([]) --> [].
th_opt([Opt|Tail]) --> html(th([class('text-center'), scope(col)], Opt)), th_opt(Tail).

pl_mcq_questions([]) --> [].
pl_mcq_questions([H|T]) -->
    { term_to_atom(H, A) },
    html([A, '.']), pl_mcq_questions(T).

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
