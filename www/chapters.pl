chapter_header(Number) -->
    { chapter_info(Number, Title, Goals, Children) },
    html([ div(class(chapter_header),
               [ h2(class(chapter_num), "Chapter ~d"-[Number])
               , h1(class(chapter_title), Title)
               ])
         , div(class([chapter_goals,card]),
               [ div(class('card-body'),
                     [ h5(class('card-title'), "Main goals:")
                     , ol(class([goal_list, 'list-group', 'list-group-flush'])
                     , \to_li(Goals))
                     ])
                ])
         , div(class(chapter_children),
               \chapter_children(Children)
           )
         ]
     ).

chapter_children(Children) -->
    html(nav(class([nav, 'flex-column']), \nav_item(Children))).

nav_item([]) --> [].
nav_item([H|T]) -->
    {section_info(H, Title)},
    html(a([class('nav-link'), href("/section~w/"-[H])], Title)),
    nav_item(T).


to_li([]) --> [].
to_li([H|T]) --> html(li(class('list-group-item'), H)), to_li(T).


chapter_info(1,
    "Facts, Rules, and Queries",
    [ "To give some simple examples of Prolog programs. This will introduce us to the three basic constructs in Prolog: facts, rules, and queries. It will also introduce us to a number of other themes, like the role of logic in Prolog, and the idea of performing unification with the aid of variables."
    , "To begin the systematic study of Prolog by defining terms, atoms, variables and other syntactic concepts."
    ],
    [ 1.1, 1.2, 1.3, 1.4 ]
).

section_info(1.1, "Some Simple Examples").
section_info(1.2, "Prolog Syntax").
section_info(1.3, "Exercises").
section_info(1.4, "Practical Session").

section(1.1) --> html(
    [ h1("1.1 Some Simple Examples")
    , p(["There are only three basic constructs in Prolog: facts, rules, and queries. A collection of facts and rules is called a knowledge base (or a database) and Prolog programming is all about writing knowledge bases. That is, Prolog programs simply ", em("are"), " knowledge bases, collections of facts and rules which describe some collection of relationships that we find interesting."])
    , p(["So how do we ", em("use"), " a Prolog program? By posing queries. That is, by asking questions about the information stored in the knowledge base."])
    , p("Now this probably sounds rather strange. It’s certainly not obvious that it has much to do with programming at all. After all, isn’t programming all about telling a computer what to do? But as we shall see, the Prolog way of programming makes a lot of sense, at least for certain tasks; for example, it is useful in computational linguistics and Artificial Intelligence (AI). But instead of saying more about Prolog in general terms, let’s jump right in and start writing some simple knowledge bases; this is not just the best way of learning Prolog, it’s the only way.")
    , h2(id("KnowledgeBase1"), "Knowledge Base 1")
    , p(["Knowledge Base 1 (KB1) is simply a collection of facts. Facts are used to state things that are ", em("unconditionally"), " true of some situation of interest. For example, we can state that Mia, Jody, and Yolanda are women, that Jody plays air guitar, and that a party is taking place, using the following five facts:"])
    , \code_block("kb1",
        [ "woman(mia)."
        , "woman(jody)."
        , "woman(yolanda)."
        , "playsAirGuitar(jody)."
        , "party."
        ])
    , p(["This collection of facts is KB1. It is our first example of a Prolog program. Note that the names ", code("mia"), ", ", code("jody"), ", and ", code("yolanda"), ", the properties ", code("woman"), " and ", code("playsAirGuitar"), ", and the proposition party have been written so that the first letter is in lower-case. This is important; we will see why a little later on."])
    , p("How can we use KB1? By posing queries. That is, by asking questions about the information KB1 contains. Here are some examples. We can ask Prolog whether Mia is a woman by posing the query:")
    , \code_query("kb1", "woman(mia).")
    , p("Prolog will answer")
    , pre(yes)
    , p(["for the obvious reason that this is one of the facts explicitly recorded in KB1. Incidentally, ", em("we"), " don’t type in the ", code("?-"), ". This symbol (or something like it, depending on the implementation of Prolog you are using) is the prompt symbol that the Prolog interpreter displays when it is waiting to evaluate a query. We just type in the actual query (for example ", code("woman(mia)"), " ) followed by ", code("."), " (a full stop). The full stop is important. If you don’t type it, Prolog won’t start working on the query."])
    , p("Similarly, we can ask whether Jody plays air guitar by posing the following query:")
    , \code_query("kb1", "playsAirGuitar(jody).")
    , p("Prolog will again answer yes, because this is one of the facts in KB1. However, suppose we ask whether Mia plays air guitar:")
    , \code_query("kb1", "playsAirGuitar(mia).")
    , p("We will get the answer")
    , pre(no)
    , p(["Why? Well, first of all, this is not a fact in KB1. Moreover, KB1 is extremely simple, and contains no other information (such as the ", em("rules"), " we will learn about shortly) which might help Prolog try to infer (that is, deduce) whether Mia plays air guitar. So Prolog correctly concludes that ", code("playsAirGuitar(mia)"), " does ", em("not"), " follow from KB1."])
    , p("Here are two important examples. First, suppose we pose the query:")
    , \code_query("kb1", "playsAirGuitar(vincent).")
    , p(["Again Prolog answers ", code("no."), " Why? Well, this query is about a person (Vincent) that it has no information about, so it (correctly) concludes that ", code("playsAirGuitar(vincent)"), " cannot be deduced from the information in KB1."])
    , p("Similarly, suppose we pose the query:")
    , \code_query("kb1", "tatooed(jody).")
    , p(["Again Prolog will answer ", code("no."), " Why? Well, this query is about a property (being tatooed) that it has no information about, so once again it (correctly) concludes that the query cannot be deduced from the information in KB1. (Actually, some Prolog implementations will respond to this query with an error message, telling you that the predicate or procedure ", code("tatooed"), " is not defined; we will soon introduce the notion of predicates.)"])
    , p("Needless to say, we can also make queries concerning propositions. For example, if we pose the query")
    , \code_query("kb1", "party.")
    , p("then Prolog will respond")
    , pre(yes)
    , p("and if we pose the query")
    , \code_query("kb1", "rockConcert.")
    , p("then Prolog will respond")
    , pre(no)
    , p("exactly as we would expect.")
    , h2(id("KnowledgeBase2"), "Knowledge Base 2")
    , p("Here is KB2, our second knowledge base:")
    , \code_block("kb2",
        [ "happy(yolanda)."
        , "listens2Music(mia)."
        , "listens2Music(yolanda):-  happy(yolanda)."
        , "playsAirGuitar(mia):-  listens2Music(mia)."
        , "playsAirGuitar(yolanda):-  listens2Music(yolanda)."
        ])
    , p("There are two facts in KB2, listens2Music(mia) and happy(yolanda) . The last three items it contains are rules.")
    , p("Rules state information that is conditionally true of the situation of interest. For example, the first rule says that Yolanda listens to music if she is happy, and the last rule says that Yolanda plays air guitar if she listens to music. More generally, the :- should be read as “if”, or “is implied by”. The part on the left hand side of the :- is called the head of the rule, the part on the right hand side is called the body. So in general rules say: if the body of the rule is true, then the head of the rule is true too. And now for the key point:")
    , p("If a knowledge base contains a rule head  :-  body, and Prolog knows that body follows from the information in the knowledge base, then Prolog can infer head.")
    , p("This fundamental deduction step is called modus ponens.")
    , p("Let’s consider an example. Suppose we ask whether Mia plays air guitar:")
    , \code_query("kb2", "playsAirGuitar(mia).")
    , p("Prolog will respond yes. Why? Well, although it can’t find playsAirGuitar(mia) as a fact explicitly recorded in KB2, it can find the rule")
    , pre("playsAirGuitar(mia):-  listens2Music(mia).")
    , p("Moreover, KB2 also contains the fact listens2Music(mia) . Hence Prolog can use the rule of modus ponens to deduce that playsAirGuitar(mia) .")
    , p("Our next example shows that Prolog can chain together uses of modus ponens. Suppose we ask:")
    , \code_query("kb2", "playsAirGuitar(yolanda).")
    , p("Prolog would respond yes. Why? Well, first of all, by using the fact happy(yolanda) and the rule")
    , pre("listens2Music(yolanda):-  happy(yolanda).")
    , p("Prolog can deduce the new fact listens2Music(yolanda) . This new fact is not explicitly recorded in the knowledge base — it is only implicitly present (it is inferred knowledge). Nonetheless, Prolog can then use it just like an explicitly recorded fact. In particular, from this inferred fact and the rule")
    , pre("playsAirGuitar(yolanda):-  listens2Music(yolanda).")
    , p("it can deduce playsAirGuitar(yolanda) , which is what we asked it. Summing up: any fact produced by an application of modus ponens can be used as input to further rules. By chaining together applications of modus ponens in this way, Prolog is able to retrieve information that logically follows from the rules and facts recorded in the knowledge base.")
    , p("The facts and rules contained in a knowledge base are called clauses. Thus KB2 contains five clauses, namely three rules and two facts. Another way of looking at KB2 is to say that it consists of three predicates (or procedures). The three predicates are:")
    , pre("listens2Music~nhappy~nplaysAirGuitar~n"-[])
    , p("The happy predicate is defined using a single clause (a fact). The listens2Music and playsAirGuitar predicates are each defined using two clauses (in one case, two rules, and in the other case, one rule and one fact). It is a good idea to think about Prolog programs in terms of the predicates they contain. In essence, the predicates are the concepts we find important, and the various clauses we write down concerning them are our attempts to pin down what they mean and how they are inter-related.")
    , p("One final remark. We can view a fact as a rule with an empty body. That is, we can think of facts as conditionals that do not have any antecedent conditions, or degenerate rules.")
    , h2(id("KnowledgeBase3"), "Knowledge Base 3")
    , p("KB3, our third knowledge base, consists of five clauses:")
    , \code_block("kb3",
        [ "happy(vincent)."
        , "listens2Music(butch)."
        , "playsAirGuitar(vincent):-"
        , "    listens2Music(vincent),"
        , "    happy(vincent)."
        , "playsAirGuitar(butch):-"
        , "    happy(butch)."
        , "playsAirGuitar(butch):-"
        , "    listens2Music(butch)."
        ])
    , p("There are two facts, happy(vincent) and listens2Music(butch) , and three rules.")
    , p("KB3 defines the same three predicates as KB2 (namely happy , listens2Music , and playsAirGuitar ) but it defines them differently. In particular, the three rules that define the playsAirGuitar predicate introduce some new ideas. First, note that the rule")
    , pre("playsAirGuitar(vincent):-~n    listens2Music(vincent),~n    happy(vincent).~n"-[])
    , p("has two items in its body, or (to use the standard terminology) two goals. So, what exactly does this rule mean? The most important thing to note is the comma , that separates the goal listens2Music(vincent) and the goal happy(vincent) in the rule’s body. This is the way logical conjunction is expressed in Prolog (that is, the comma means and ). So this rule says: “Vincent plays air guitar if he listens to music and he is happy”.")
    , p("Thus, if we posed the query")
    , \code_query("kb3", "playsAirGuitar(vincent).")
    , p("Prolog would answer no. This is because while KB3 contains happy(vincent) , it does not explicitly contain the information listens2Music(vincent) , and this fact cannot be deduced either. So KB3 only fulfils one of the two preconditions needed to establish playsAirGuitar(vincent) , and our query fails.")
    , p("Incidentally, the spacing used in this rule is irrelevant. For example, we could have written it as")
    , pre("playsAirGuitar(vincent):-  happy(vincent),~n                               listens2Music(vincent).~n"-[])
    , p("and it would have meant exactly the same thing. Prolog offers us a lot of freedom in the way we set out knowledge bases, and we can take advantage of this to keep our code readable.")
    , p("Next, note that KB3 contains two rules with exactly the same head, namely:")
    , pre("playsAirGuitar(butch):-~n    happy(butch).~nplaysAirGuitar(butch):-~n    listens2Music(butch).~n"-[])
    , p("This is a way of stating that Butch plays air guitar either if he listens to music, or if he is happy. That is, listing multiple rules with the same head is a way of expressing logical disjunction (that is, it is a way of saying or ). So if we posed the query")
    , \code_query("kb3", "playsAirGuitar(butch).")
    , p("Prolog would answer yes. For although the first of these rules will not help (KB3 does not allow Prolog to conclude that happy(butch) ), KB3 does contain listens2Music(butch) and this means Prolog can apply modus ponens using the rule")
    , pre("playsAirGuitar(butch):-~n    listens2Music(butch).~n"-[])
    , p("to conclude that playsAirGuitar(butch) .")
    , p("There is another way of expressing disjunction in Prolog. We could replace the pair of rules given above by the single rule")
    , pre("playsAirGuitar(butch):-~n    happy(butch);~n    listens2Music(butch).~n"-[])
    , p("That is, the semicolon ; is the Prolog symbol for or , so this single rule means exactly the same thing as the previous pair of rules. Is it better to use multiple rules or the semicolon? That depends. On the one hand, extensive use of semicolon can make Prolog code hard to read. On the other hand, the semicolon is more efficient as Prolog only has to deal with one rule.")
    , p("It should now be clear that Prolog has something to do with logic: after all, the :- means implication, the , means conjunction, and the ; means disjunction. (What about negation? That is a whole other story. We’ll be discussing it in Chapter  10 .) Moreover, we have seen that a standard logical proof rule (modus ponens) plays an important role in Prolog programming. So we are already beginning to understand why “Prolog” is short for “Programming with logic”.")
    , h2(id("KnowledgeBase4"), "Knowledge Base 4")
    , p("Here is KB4, our fourth knowledge base:")
    , \code_block("kb4",
        [ "woman(mia)."
        , "woman(jody)."
        , "woman(yolanda)."
        , ""
        , "loves(vincent,mia)."
        , "loves(marsellus,mia)."
        , "loves(pumpkin,honey_bunny)."
        , "loves(honey_bunny,pumpkin)."
        ])
    , p("Now, this is a pretty boring knowledge base. There are no rules, only a collection of facts. Ok, we are seeing a relation that has two names as arguments for the first time (namely the loves relation), but, let’s face it, that’s a rather predictable idea.")
    , p("No, the novelty this time lies not in the knowledge base, it lies in the queries we are going to pose. In particular, for the first time we’re going to make use of variables . Here’s an example:")
    , \code_query("kb4", "woman(X).")
    , p("The X is a variable (in fact, any word beginning with an upper-case letter is a Prolog variable, which is why we had to be careful to use lower-case initial letters in our earlier examples). Now a variable isn’t a name, rather it’s a placeholder for information. That is, this query asks Prolog: tell me which of the individuals you know about is a woman.")
    , p("Prolog answers this query by working its way through KB4, from top to bottom, trying to unify (or match) the expression woman(X) with the information KB4 contains. Now the first item in the knowledge base is woman(mia) . So, Prolog unifies X with mia , thus making the query agree perfectly with this first item. (Incidentally, there’s a lot of different terminology for this process: we can also say that Prolog instantiates X to mia , or that it binds X to mia .) Prolog then reports back to us as follows:")
    , pre("X  =  mia")
    , p("That is, it not only says that there is information about at least one woman in KB4, it actually tells us who she is. It didn’t just say yes, it actually gave us the variable binding (or variable instantiation) that led to success.")
    , p("But that’s not the end of the story. The whole point of variables is that they can stand for, or unify with, different things. And there is information about other women in the knowledge base. We can access this information by typing a semicolon:")
    , pre("X  =  mia  ;")
    , p("Remember that ; means or , so this query means: are there any alternatives ? So Prolog begins working through the knowledge base again (it remembers where it got up to last time and starts from there) and sees that if it unifies X with jody , then the query agrees perfectly with the second entry in the knowledge base. So it responds:")
    , pre("X  =  mia  ;~nX  =  jody~n"-[])
    , p("It’s telling us that there is information about a second woman in KB4, and (once again) it actually gives us the value that led to success. And of course, if we press ; a second time, Prolog returns the answer")
    , pre("X  =  mia  ;~nX  =  jody  ;~nX  =  yolanda~n"-[])
    , p("But what happens if we press ; a third time? Prolog responds no. No other unifications are possible. There are no other facts starting with the symbol woman . The last four entries in the knowledge base concern the love relation, and there is no way that such entries can be unified with a query of the form woman(X) .")
    , p("Let’s try a more complicated query, namely")
    , \code_query("kb4", "loves(marsellus,X),  woman(X).")
    , p("Now, remember that , means and , so this query says: is there any individual X such that Marsellus loves X and X is a woman ? If you look at the knowledge base you’ll see that there is: Mia is a woman (fact 1) and Marsellus loves Mia (fact 5). And in fact, Prolog is capable of working this out. That is, it can search through the knowledge base and work out that if it unifies X with Mia, then both conjuncts of the query are satisfied (we’ll learn in the following chapter how Prolog does this). So Prolog returns the answer")
    , pre("X  =  mia")
    , p("The business of unifying variables with information in the knowledge base is the heart of Prolog. As we’ll learn, there are many interesting ideas in Prolog — but when you get right down to it, it’s Prolog’s ability to perform unification and return the values of the variable bindings to us that is crucial.")
    , h2(id("KnowledgeBase5"), "Knowledge Base 5")
    , p("Well, we’ve introduced variables, but so far we’ve only used them in queries. But variables not only can be used in knowledge bases, it’s only when we start to do so that we can write truly interesting programs. Here’s a simple example, the knowledge base KB5:")
    , \code_block("kb5",
        [ "loves(vincent,mia)."
        , "loves(marsellus,mia)."
        , "loves(pumpkin,honey_bunny)."
        , "loves(honey_bunny,pumpkin)."
        , ""
        , "jealous(X,Y):-  loves(X,Z),  loves(Y,Z)."
        ])
    , p("KB5 contains four facts about the loves relation and one rule. (Incidentally, the blank line between the facts and the rule has no meaning: it’s simply there to increase the readability. As we said earlier, Prolog gives us a great deal of freedom in the way we format knowledge bases.) But this rule is by far the most interesting one we have seen so far: it contains three variables (note that X , Y , and Z are all upper-case letters). What does it say?")
    , p("In effect, it is defining a concept of jealousy. It says that an individual X will be jealous of an individual Y if there is some individual Z that X loves, and Y loves that same individual Z too. (Ok, so jealousy isn’t as straightforward as this in the real world.) The key thing to note is that this is a general statement: it is not stated in terms of mia , or pumpkin , or anyone in particular — it’s a conditional statement about everybody in our little world.")
    , p("Suppose we pose the query:")
    , \code_query("kb5", "jealous(marsellus,W).")
    , p("This query asks: can you find an individual W such that Marsellus is jealous of W ? Vincent is such an individual. If you check the definition of jealousy, you’ll see that Marsellus must be jealous of Vincent, because they both love the same woman, namely Mia. So Prolog will return the value")
    , pre("W  =  vincent")
    , p("Now some questions for you . First, are there any other jealous people in KB5? Furthermore, suppose we wanted Prolog to tell us about all the jealous people: what query would we pose? Do any of the answers surprise you? Do any seem silly? ")
    ]).

code_block(ID, Block) --> { atomics_to_string(Block, "\n", Code) },
                          html(textarea([class(code), id(ID)], Code)).
code_query(ID, Query) --> html(
    [ div(class('col-sm-9'),
        [ pre(class(query_prompt), "?-")
        , input([class(query), value(Query), placeholder(Query), type(text)])
        ])
    , div(class('col-sm-3'),
        input([class([btn, 'btn-primary']), type(button), value("Run Query")])
        )
    ]).
