section('1.3.1') -->
    html(
    [ \section_heading2('1.3.1')
    , p("Which of the following sequences of characters are atoms, which are variables, and which are neither?")
    , div(class(row), \quiz('1.3.1'))
    ]
).

section('1.3.2') -->
    html(
    [ \section_heading2('1.3.2')
    , p("Which of the following sequences of characters are atoms, which are variables, which are complex terms, and which are not terms at all?")
    , div(class(row), \quiz('1.3.2'))
    ]
).

quiz(N) -->
    { query(N, questions, Qs), query(N, question_opts, Opts) },
    html(
    [ div(class('col-sm-9'), form(
        [ \questions(Opts, Qs)
            , input( [ id(submitbtn), type(button), value("Submit"), class([btn, 'btn-primary', disabled, 'mr-3'])], [])
        , label( [ for(submitbtn), class('text-muted') ], small("You must be logged in to track your learning"))
        ]))
    , div(class('col-sm-3'), ul([class('list-group'), id(feedback)], []))
    , script([type('text/prolog'), id('questions.pl')], \pl_questions(Qs) )
    ]
).

pl_questions([]) --> [].
pl_questions([H|T]) -->
    { term_to_atom(H, A) },
    html([A, '.']), pl_questions(T).

questions(_, []) --> [].
questions(Opts, [question(Name, _, _)|T]) -->
    html(div(class('form-row mb-2'),
    [ div(class('col-4 bg-light rounded-left text-center p-1'), span(class('align-middle'), Name))
        , div(class('col-8 form-row'), \question(Opts, Name))
        ])
    ),
    questions(Opts, T).

question([], _) --> [].
question([Opt|T], Name) -->
    html(div(class('col form-check form-check-inline border-left border-bottom border-light rounded-left pl-2'),
        [ input([class('form-check-input'), type(radio), name(Name), id("~w~w"-[Name, Opt]), value(Opt)], [])
        , label([class('form-check-label'), for("~w~w"-[Name, Opt])], Opt)
        ])
    ),
    question(T, Name).
