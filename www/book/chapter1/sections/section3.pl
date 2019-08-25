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

section('1.3.3') -->
    html(
    [ \section_heading2('1.3.3')
    , p("What is the functor and arity of each of these complex terms?")
    , p([em("Remember: functor and arity is written as "), \inline_code("functor/arity")])
    , div(class(row), \input_compare_quiz('1.3.3'))
    ]
).
