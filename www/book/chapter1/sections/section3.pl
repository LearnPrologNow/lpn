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

section('1.3.4') -->
    html(
        [ \section_heading2('1.3.4')
        , p("How many facts, rules, clauses and predicates are there in the following knowledge base?")
        , \static_code_block(
'woman(vincent).
woman(mia).
man(jules).
person(X) :- man(X) ; woman(X).
loves(X, Y) :- father(X, Y).
father(Y, Z) :- man(Y) , son(Z, Y).
father(Y, Z) :- man(Y), daughter(Z, Y).')
        , div(class(row), \input_compare_quiz('1.3.4'))
        ]
    ).

section('1.3.5') -->
    html(
        [ \section_heading2('1.3.5')
        , p("Identify the heads, bodies and goals in the following knowledge base.")
        , \static_code_block(
'woman(vincent).
woman(mia).
man(jules).
person(X) :- man(X) ; woman(X).
loves(X, Y) :- father(X, Y).
father(Y, Z) :- man(Y) , son(Z, Y).
father(Y, Z) :- man(Y), daughter(Z, Y).')
        , div(class(row), \mcq_quiz('1.3.5'))
        ]
    ).

section('1.3.6') -->
    html(
        [ \section_heading2('1.3.6')
        , p("Represent the following in Prolog:")
        , div(class(row),
            [ \input_mark_quiz('1.3.6')
            , div([id(markscheme), class(['col'])],
                [ input([type(button), class([btn, 'btn-primary']), value('Check Answers'), onclick('markscheme()')], [])
                , p(class([collapse, markscheme]), ["Here is an example of what your answers could look like.  They, of course, don't have to look ", em("exactly"), " like that. For example, the first fact could also be ", \inline_code("killer('Butch')"), " or ", \inline_code("killer(b)"), " or even ", \inline_code("k(50)"), ", if you decide to represent Butch by the number 50 and the property of being a killer by the predicate ", \inline_code("k/1"), "."])
                ])
            ])
        ]
    ).

section('1.3.7') -->
    html(
        [ \section_heading2('1.3.7')
        , p("Suppose we are working with the following knowledge base:")
        , \static_code_block(
'wizard(ron).
hasWand(harry).
quidditchPlayer(harry).
wizard(X) :- hasBroom(X), hasWand(X).
hasBroom(X) :- quidditchPlayer(X).
')
        , p("How does Prolog respond to the following queries?")
        , div(class(row), \mcq_quiz('1.3.7'))
        ]
    ).

section('1.3.8') -->
    html(
        [ \section_heading2('1.3.8')
        , p("Suppose we are working with the following knowledge base:")
        , \static_code_block(
'wizard(ron).
hasWand(harry).
quidditchPlayer(harry).
wizard(X) :- hasBroom(X), hasWand(X).
hasBroom(X) :- quidditchPlayer(X).
')
        , p(["Does Prolog give the following response to the query ", \inline_code("?- wizard(Y)."), " ?"])
        , div(class(row), \mcq_quiz('1.3.8'))
        ]
    ).
