:- ensure_loaded(sections).

chapter('1').
info('1', title, "Facts, Rules, and Queries").
info('1', goals,
    [ "To give some simple examples of Prolog programs. This will introduce us to the three basic constructs in Prolog: facts, rules, and queries. It will also introduce us to a number of other themes, like the role of logic in Prolog, and the idea of performing unification with the aid of variables."
    , "To begin the systematic study of Prolog by defining terms, atoms, variables and other syntactic concepts."
    ]).
info('1', children, ['1.1', '1.2', '1.3', '1.4']).

info('1.1', title, "Some Simple Examples").
info('1.1', children, ['1.1.1', '1.1.2', '1.1.3', '1.1.4', '1.1.5']).

info('1.1.1', title, "Knowledge Base 1").
info('1.1.2', title, "Knowledge Base 2").
info('1.1.3', title, "Knowledge Base 3").
info('1.1.4', title, "Knowledge Base 4").
info('1.1.5', title, "Knowledge Base 5").

info('1.2', title, "Prolog Syntax").
info('1.2', children, ['1.2.1', '1.2.2', '1.2.3', '1.2.4']).

info('1.2.1', title, "Atoms").
info('1.2.2', title, "Numbers").
info('1.2.3', title, "Variables").
info('1.2.4', title, "Complex Terms").

info('1.3', title, "Exercises").
info('1.3', children, ['1.3.1', '1.3.2']).

info('1.3.1', title, "Atoms and Variables").
info('1.3.1', question_opts, [atom, variable, neither]).
info('1.3.1', questions,
    [ question('vINCENT', atom, 'atoms begin with a lowercase letter')
    , question('Footmassage', variable, 'variables begin with an uppercase letter')
    , question('variable23', atom, 'atoms begin with a lowercase letter')
    , question('Variable2000', variable, 'variables begin with an uppercase letter')
    , question('big_kahuna_burger', atom, 'atoms begin with a lowercase letter')
    , question('\'big_kahuna_burger\'', atom, 'atoms can be surrounded by single quotes')
    , question('big kahuna burger', neither, 'neither atoms nor variables can contain spaces, unless they start and end with a single quote')
    , question('\'Jules\'', atom, 'atoms can be surrounded by single quotes')
    , question('_Jules', variable, 'variables can begin with an underscore \'_\'')
    , question('\'_Jules\'', atom, 'atoms can be surrounded by single quotes')
    ]
).

info('1.3.2', title, "Atoms, Variables, and Complex Terms").
info('1.3.2', question_opts, [atom, variable, 'complex term', neither]).
info('1.3.2', questions,
    [ question('loves(Vincent, mia)', 'complex term', 'complex terms have a functor and an arity')
    , question('\'loves(Vincent, mia)\'', atom, 'atoms can be surrounded by single quotes')
    , question('Butch(boxer)', neither, 'a functor cannot begin with an uppercase letter')
    , question('butch(Boxer)', 'complex term', 'complex terms have a functor and an arity')
    , question('and(big(burger), kahuna(burger))', 'complex term', 'complex terms can contain other complex terms')
    , question('and(big(X), kahuna(X))', 'complex term', 'complex terms can contain other complex terms')
    , question('_and(big(X), kahuna(X))', neither, 'functors, like atoms, cannot be prefixed with the underscore')
    , question('(Butch kills Vincent)', neither, 'spaces in parenthesis is invalid syntax')
    , question('kills(Butch Vincent)', neither, 'arguments in a complex term must be comma seperated')
    , question('kills(Butch, Vincent', neither, 'an opening parenthesis must be closed after the arguments')
    ]
).
info('1.4', title, "Practical Session").
