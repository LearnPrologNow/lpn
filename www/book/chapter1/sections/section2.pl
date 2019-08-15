section('1.2') -->
    html(
    [ \section_heading1('1.2')
    , p(["Now that we’ve got some idea of what Prolog does, it’s time to go back to the beginning and work through the details more carefully. Let’s start by asking a very basic question: we’ve seen all kinds of expressions (for example ", \prolog_code("jody"), ", ", \prolog_code("playsAirGuitar(mia)"), ", and ", \prolog_code("X"), ") in our Prolog programs, but these have just been examples. It’s time for precision: exactly what are facts, rules, and queries built out of?"])
    , p("The answer is terms, and there are four kinds of term in Prolog: atoms, numbers, variables, and complex terms (or structures). Atoms and numbers are lumped together under the heading constants, and constants and variables together make up the simple terms of Prolog.")
    , p(["Let’s take a closer look. To make things crystal clear, let’s first be precise about the basic characters (that is, symbols) at our disposal. The ", em("upper-case letters"), " are ", \prolog_code("A, B ,…, Z;"), " the ", em("lower-case letters"), " are ", \prolog_code("a, b ,…, z;"), " the ", em("digits"), " are ", \prolog_code("0, 1 , 2 ,…, 9"), ". In addition we have the ", \prolog_code("_"), " symbol, which is called underscore, and some ", em("special characters"), " , which include characters such as ", \prolog_code("+, - , * , / , < , > , = , : , . , & , ~"), ". The blank ", em("space"), " is also a character, but a rather unusual one, being invisible. A string is an unbroken sequence of characters."])
    , div(class(section_pages), \chapter_children('1.2'))
    ]
).

section('1.2.1') -->
    html(
    [ \section_heading2('1.2.1')
    , p("An atom is either:")
    , ol(class('list-group'),
        [ li(class('list-group-item'), [\ol_num(1), "A string of characters made up of upper-case letters, lower-case letters, digits, and the underscore character, that begins with a lower-case letter. Here are some examples: ", \prolog_code("butch"), ", ", \prolog_code("big_kahuna_burger"), ", ", \prolog_code("listens2Music"), " and ", \prolog_code("playsAirGuitar"), "."])
        , li(class('list-group-item'), [\ol_num(2), "An arbitrary sequence of characters enclosed in single quotes. For example ", \prolog_code("'Vincent'"), ", ", \prolog_code("'The Gimp'"), ", ", \prolog_code("'Five_Dollar_Shake'"), ",  ", \prolog_code("'&^%&#@$ &*'"), ", and ", \prolog_code("' '"), ". The sequence of characters between the single quotes is called the atom name. Note that we are allowed to use spaces in such atoms; in fact, a common reason for using single quotes is so we can do precisely that."])
        , li(class('list-group-item'), [\ol_num(3), "A string of special characters. Here are some examples: ", \prolog_code("@="), " and ", \prolog_code("====>"), " and ", \prolog_code(";"), " and ", \prolog_code(":-"), " are all atoms. As we have seen, some of these atoms, such as ", \prolog_code(";"), " and ", \prolog_code(":-"), " have a pre-defined meaning."])
        ])
    ]
).

section('1.2.2') -->
    html(
    [ \section_heading2('1.2.2')
    , p("Real numbers aren’t particularly important in typical Prolog applications. So although most Prolog implementations do support floating point numbers or floats (that is, representations of real numbers such as 1657.3087 or π ) we say little about them in this book.")
    , p(["But integers (that is: …,-2, -1, 0, 1, 2, 3,…) are useful for such tasks as counting the elements of a list, and we’ll discuss how to manipulate them in ", a(href('/section/5'), "Chapter 5"), ". Their Prolog syntax is the obvious one: ", \prolog_code("23"), ", ", \prolog_code("1001"), ", ", \prolog_code("0"), ", ", \prolog_code("-365"), ", and so on."])
    ]
).

section('1.2.3') -->
    html(
    [ \section_heading2('1.2.3')
    , p(["A variable is a string of upper-case letters, lower-case letters, digits and underscore characters that starts ", em("either"), " with an upper-case letter or with an underscore. For example, ", \prolog_code("X"), ", ", \prolog_code("Y"), ", ", \prolog_code("Variable"), ", ", \prolog_code("_tag"), ", ", \prolog_code("X_526"), ", ", \prolog_code("List"), ", ", \prolog_code("List24"), ", ", \prolog_code("_head"), ", ", \prolog_code("Tail"), ", ", \prolog_code("_input"), " and ", \prolog_code("Output"), "are all Prolog variables."])
    , p(["The variable ", \prolog_code("_"), " (that is, a single underscore character) is rather special. It’s called the ", em("anonymous variable"), ", and we discuss it in ", a(href('/section/4'), "Chapter 4"), "."])
    ]
).

section('1.2.4') -->
    html(
    [ \section_heading2('1.2.4')
    , p("Constants, numbers, and variables are the building blocks: now we need to know how to fit them together to make complex terms. Recall that complex terms are often called structures.")
    , p(["Complex terms are build out of a functor followed by a sequence of arguments. The arguments are put in ordinary parentheses, separated by commas, and placed after the functor. Note that the functor has to be directly followed by the parenthesis; you can’t have a space between the functor and the parenthesis enclosing the arguments. The functor must be an atom. That is, variables ", em("cannot"), " be used as functors. On the other hand, arguments can be any kind of term."])
    , p(["Now, we’ve already seen lots of examples of complex terms when we looked at the knowledge bases KB1 to KB5. For example, ", \prolog_code("playsAirGuitar(jody)"), " is a complex term: its functor is ", \prolog_code("playsAirGuitar"), " and its argument is ", \prolog_code("jody"), ". Other examples are ", \prolog_code("loves(vincent,mia)"), " and, to give an example containing a variable, ", \prolog_code("jealous(marsellus,W)"), "."])
    , p("But the definition allows for more complex terms than this. In fact, it allows us to keep nesting complex terms inside complex terms indefinitely (that is, it is allows recursive structure). For example")
    , \static_code("hide(X,father(father(father(butch))))")
    , p(["is a perfectly acceptable complex term. Its functor is hide , and it has two arguments: the variable ", \prolog_code("X"), ", and the complex term ", \prolog_code("father(father(father(butch)))"), ". This complex term has father as its functor, and another complex term, namely ", \prolog_code("father(father(butch))"), ", as its sole argument. And the argument of this complex term, namely ", \prolog_code("father(butch)"), ", is also complex. But then the nesting bottoms out, for the argument here is the constant ", \prolog_code("butch"), "."])
    , p("As we shall see, such nested (or recursively structured) terms enable us to represent many problems naturally. In fact the interplay between recursive term structure and variable unification is the source of much of Prolog’s power.")
    , p(["The number of arguments that a complex term has is called its arity. For example, ", \prolog_code("woman(mia)"), "is a complex term of arity 1, and ", \prolog_code("loves(vincent,mia)"), "is a complex term of arity 2."])
    , p(["Arity is important to Prolog. Prolog would be quite happy for us to define two predicates with the same functor but with a different number of arguments. For example, we are free to define a knowledge base that defines a two-place predicate love (this might contain such facts as ", \prolog_code("love(vincent,mia)"), "), and also a three-place love predicate (which might contain such facts as ", \prolog_code("love(vincent,marsellus,mia)"), "). However, if we did this, Prolog would treat the two-place ", \prolog_code("love"), " and the three-place ", \prolog_code("love"), " as different predicates. Later in the book (for example, when we introduce accumulators in ", a(href('/section/5'), "Chapter 5"), ") we shall see that it can be useful to define two predicates with the same functor but different arity."])
    , p("When we need to talk about predicates and how we intend to use them (for example, in documentation) it is usual to use a suffix / followed by a number to indicate the predicate’s arity. To return to KB2, instead of saying that it defines predicates")
    , \static_code("listens2Music~nhappy~nplaysAirGuitar~n"-[])
    , p("we should really say that it defines predicates")
    , \static_code("listens2Music/1~nhappy/1~nplaysAirGuitar/1~n"-[])
    , p(["And Prolog can’t get confused about a knowledge base containing the two different love predicates, for it regards the ", \prolog_code("love/2"), " predicate and the ", \prolog_code("love/3"), " predicate as distinct."])
    ]
).
