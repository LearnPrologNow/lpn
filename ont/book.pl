frame('1.1.1', ako, 'TeachingArtifact').
frame('1.1.1', keyTerms, [facts,queries,infer,deduce]).
frame('1.1.1', learningObjectives, [remember('definition of a fact'),remember('syntax of a fact'),remember('how to query a fact'),remember('syntax of a fact query'),exemplify('syntax of a fact'),interpret('syntax of a ground query'),infer('answer to a fact query')]).
frame('1.1.1', title, "Knowledge Base 1").
frame('1.1.2', ako, 'TeachingArtifact').
frame('1.1.2', keyTerms, [rules,head,body,'modus ponens',clauses,predicates,procedures]).
frame('1.1.2', learningObjectives, [remember('definition of a rule'),remember('definition of head'),remember('definition of body'),remember('syntax of a rule'),classify('facts and rules are clauses'),remember('definition of predicate'),exemplify('syntax of a rule'),explain('how rules work via modus ponens'),infer('the answer to a rule query'),recognize('Prolog programs are composed of predicates')]).
frame('1.1.2', title, "Knowledge Base 2").
frame('1.1.3', ako, 'TeachingArtifact').
frame('1.1.3', keyTerms, [goals,conjunction,disjunction,logic]).
frame('1.1.3', learningObjectives, [remember('syntax for conjuntion'),remember('syntax for disjuntion'),recognize('a goal is a clause in the body'),exemplify('syntax for conjuntion'),exemplify('syntax for disjuntion'),infer('Prolog reasoning over conjunction'),infer('Prolog reasoning over disjunction'),explain('query answer with conjunction'),explain('query answer with disjunction'),recognize('Prolog uses logic')]).
frame('1.1.3', title, "Knowledge Base 3").
frame('1.1.4', ako, 'TeachingArtifact').
frame('1.1.4', keyTerms, [variables,unify,match,instantiates,binds,'variable binding','variable instantiation']).
frame('1.1.4', learningObjectives, [remember('syntax of a variable'),remember('syntax of an unground query'),recognize('use of disjunction in a query'),exemplify('variable unification in a query'),exemplify('a query with a variable'),infer('answer to a query with a variable')]).
frame('1.1.4', title, "Knowledge Base 4").
frame('1.1.5', ako, 'TeachingArtifact').
frame('1.1.5', learningObjectives, [recognize('variables use in clauses'),exemplify('variables in rules'),summarize('meaning of rule containing variables')]).
frame('1.1.5', title, "Knowledge Base 5").
frame('1.1', ako, 'TeachingArtifact').
frame('1.1', children, ['1.1.1','1.1.2','1.1.3','1.1.4','1.1.5']).
frame('1.1', keyTerms, ['knowledge base',database]).
frame('1.1', learningObjectives, [remember('definition of a knowledge base'),remember('definition of a Prolog program'),compare('equivalence of a knowledge base and Prolog program'),remember('facts are part of Prolog'),remember('rules are part of Prolog'),remember('queries are part of Prolog'),remember('queries are how Prolog is used')]).
frame('1.1', title, "Some Simple Examples").
frame('1.2.1', ako, 'TeachingArtifact').
frame('1.2.1', keyTerms, [atom,'atom name']).
frame('1.2.1', learningObjectives, [remember('syntax of an atom'),exemplify(atom)]).
frame('1.2.1', title, "Atoms").
frame('1.2.2', ako, 'TeachingArtifact').
frame('1.2.2', keyTerms, [numbers,'floating point',floats,integers]).
frame('1.2.2', learningObjectives, [remember('syntax of numbers'),exemplify(number)]).
frame('1.2.2', title, "Numbers").
frame('1.2.3', ako, 'TeachingArtifact').
frame('1.2.3', keyTerms, [variable]).
frame('1.2.3', learningObjectives, [remember('syntax of a variable'),exemplify(variable)]).
frame('1.2.3', title, "Variables").
frame('1.2.4', ako, 'TeachingArtifact').
frame('1.2.4', keyTerms, ['complex terms',structures,functor,arguments,'recursive structure',arity]).
frame('1.2.4', learningObjectives, [remember('syntax of a complex term'),recognize('complex term comprised of a functor and arguments'),exemplify('complex term'),remember('definition of arity'),infer('arity of a complex term'),remember('functor/arity syntax')]).
frame('1.2.4', title, "Complex Terms").
frame('1.2', ako, 'TeachingArtifact').
frame('1.2', children, ['1.2.1','1.2.2','1.2.3','1.2.4']).
frame('1.2', keyTerms, [terms,constants,'simple terms',characters,underscore,string]).
frame('1.2', learningObjectives, [recognize('Prolog programs are comprised of terms'),classify('atom is a term'),classify('number is a term'),classify('variable is a term'),classify('complex term is a term'),classify('atoms and numbers are constants'),remember('characters used in Prolog')]).
frame('1.2', title, "Prolog Syntax").
frame('1.3.1', ako, 'AssessmentArtifact').
frame('1.3.1', assesses, [remember('syntax of an atom'),remember('syntax of a variable'),classify('atom is a term'),classify('variable is a term')]).
frame('1.3.1', question_opts, [atom,variable,neither]).
frame('1.3.1', questions, [question(vINCENT,atom,'atoms begin with a lowercase letter'),question('Footmassage',variable,'variables begin with an uppercase letter'),question(variable23,atom,'atoms begin with a lowercase letter'),question('Variable2000',variable,'variables begin with an uppercase letter'),question(big_kahuna_burger,atom,'atoms begin with a lowercase letter'),question('\'big_kahuna_burger\'',atom,'atoms can be surrounded by single quotes'),question('big kahuna burger',neither,'neither atoms nor variables can contain spaces, unless they start and end with a single quote'),question('\'Jules\'',atom,'atoms can be surrounded by single quotes'),question('_Jules',variable,'variables can begin with an underscore \'_\''),question('\'_Jules\'',atom,'atoms can be surrounded by single quotes')]).
frame('1.3.1', title, "Atoms and Variables").
frame('1.3.1', type, 'MCQ').
frame('1.3.2', ako, 'AssessmentArtifact').
frame('1.3.2', assesses, [remember('syntax of a complex term'),remember('syntax of an atom'),recognize('complex term comprised of a functor and arguments'),classify('atom is a term'),classify('complex term is a term')]).
frame('1.3.2', question_opts, [atom,variable,'complex term',neither]).
frame('1.3.2', questions, [question('loves(Vincent, mia)','complex term','complex terms have a functor and an arity'),question('\'loves(Vincent, mia)\'',atom,'atoms can be surrounded by single quotes'),question('Butch(boxer)',neither,'a functor cannot begin with an uppercase letter'),question('butch(Boxer)','complex term','complex terms have a functor and an arity'),question('and(big(burger), kahuna(burger))','complex term','complex terms can contain other complex terms'),question('and(big(X), kahuna(X))','complex term','complex terms can contain other complex terms'),question('_and(big(X), kahuna(X))',neither,'functors, like atoms, cannot be prefixed with the underscore'),question('(Butch kills Vincent)',neither,'spaces in parenthesis is invalid syntax'),question('kills(Butch Vincent)',neither,'arguments in a complex term must be comma seperated'),question('kills(Butch, Vincent',neither,'an opening parenthesis must be closed after the arguments')]).
frame('1.3.2', title, "Atoms, Variables, and Complex Terms").
frame('1.3.2', type, 'MCQ').
frame('1.3.3', ako, 'AssessmentArtifact').
frame('1.3.3', assesses, [recognize('complex term comprised of a functor and arguments'),remember('definition of arity'),infer('arity of a complex term'),remember('functor/arity syntax'),remember('syntax of a complex term')]).
frame('1.3.3', questions, [question('loves(Vincent, mia)','loves/2','the functor precedes the brackets, the arity is the count of arguments'),question('butch(Boxer)','butch/1','the functor precedes the brackets, the arity is the count of arguments'),question('and(big(burger), kahuna(burger))','and/2','whether arguments are complex terms or not, they still count as 1 each'),question('and(big(X), kahuna(X))','and/2','whether arguments are complex terms or not, they still count as 1 each'),question('kills(Butch, Vincent)','kills/2','the functor precedes the brackets, the arity is the count of arguments')]).
frame('1.3.3', title, "Functor and Arity").
frame('1.3.3', type, 'auto-compare').
frame('1.3.4', ako, 'AssessmentArtifact').
frame('1.3.4', assesses, [remember('definition of a fact'),remember('syntax of a fact'),remember('definition of a rule'),remember('definition of head'),remember('definition of body'),remember('syntax of a rule'),classify('facts and rules are clauses'),remember('definition of predicate')]).
frame('1.3.4', questions, [question('How many facts are there?',3,'a fact is unconditionally true, so it does not contain ":-" in its definition'),question('How many rules are there?',4,'a rule is conditionally true, so it contains ":-" in its definition'),question('How many clauses are there?',7,'all facts and rules are clauses'),question('How many predicates are defined?',5,'a defined predicate is a fact or the head of a rule, we have defined: woman/1, man/1, person/1, loves/2, and father/2')]).
frame('1.3.4', title, "Facts, rules, clauses and predicates").
frame('1.3.4', type, 'auto-compare').
frame('1.3.5', ako, 'AssessmentArtifact').
frame('1.3.5', ako, 'AssessmentArtifact').
frame('1.3.5', assesses, [execute('syntax of a fact'),execute('syntax of a rule'),execute('syntax for conjunction'),execute('syntax for disjunction'),execute('variables in rules')]).
frame('1.3.5', assesses, [remember('definition of head'),remember('definition of body'),recognize('a goal is a clause in the body')]).
frame('1.3.5', question_opts, [head,goal,neither]).
frame('1.3.5', questions, [question('woman(vincent)',neither,'a fact does not have a head or body'),question('woman(X)',goal,'a goal part of the body of a rule'),question('man(jules)',neither,'a fact does not have a head or body'),question('man(X)',goal,'a goal part of the body of a rule'),question('person(X)',head,'the head precedes ":-" in a rule'),question('loves(X, Y)',head,'the head precedes ":-" in a rule'),question('man(X) ; woman(X)',body,'the body is everything following the ":-" in a rule'),question('man(Y), son(Z, Y)',body,'the body is everything following the ":-" in a rule'),question('knows(X, Y)',neither,'knows(X, Y) is not part of the knowledge base')]).
frame('1.3.5', title, "Heads, Bodies and Goals").
frame('1.3.5', title, "Represention").
frame('1.3.5', type, 'MCQ').
frame('1.3.5', type, 'multi-markscheme').
frame('1.3.6', ako, 'AssessmentArtifact').
frame('1.3.6', assesses, [interpret('syntax of a ground query'),infer('answer to a fact query'),infer('the answer to a rule query'),explain('query answer with conjunction')]).
frame('1.3.6', question_opts, [yes,no,'ERROR']).
frame('1.3.6', questions, [question('wizard(ron).',yes,'queries unify with facts'),question('witch(ron).','ERROR','witch/1 is undefined'),question('wizard(hermione).',no,'hermione is not in the knowledge base'),question('witch(hermione)','ERROR','witch/1 is undefined'),question('wizard(harry)',yes,'the goal clauses of the rule wizard/1 succeed for harry')]).
frame('1.3.6', title, "Answering Queries").
frame('1.3.6', type, 'MCQ').
frame('1.3.7', ako, 'AssessmentArtifact').
frame('1.3.7', assesses, [remember('syntax of an unground query'),infer('answer to a query with a variable')]).
frame('1.3.7', question_opts, [yes,no]).
frame('1.3.7', questions, [question('Y = ron',yes,'Y unifies with ron in the fact wizard(ron)'),question('Y = hermione',no,'hermione is not in the knowledge base'),question('Y = harry',yes,'Y unifies with harry via the rule wizard/1'),question(no,yes,'once all possible unifications are exhausted, Prolog will return no')]).
frame('1.3.7', title, "Unifying Queries").
frame('1.3.7', type, 'MCQ').
frame('1.3', ako, 'NavigationArtifact').
frame('1.3', children, ['1.3.1','1.3.2','1.3.3','1.3.4','1.3.5','1.3.6','1.3.7']).
frame('1.3', title, "Exercises").
frame('1.4', ako, 'PracticeArtifact').
frame('1.4', keyTerms, [listing,consult]).
frame('1.4', learningObjectives, [execute('listing/0'),execute('running Prolog'),execute('consult/1')]).
frame('1.4', title, "Practical Session").
frame('1', ako, 'NavigationArtifact').
frame('1', children, ['1.1','1.2','1.3','1.4']).
frame('1', goals, ["To give some simple examples of Prolog programs. This will introduce us to the three basic constructs in Prolog: facts, rules, and queries. It will also introduce us to a number of other themes, like the role of logic in Prolog, and the idea of performing unification with the aid of variables.","To begin the systematic study of Prolog by defining terms, atoms, variables and other syntactic concepts."]).
frame('1', title, 'Facts, Rules, and Queries').
