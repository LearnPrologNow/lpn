section('1.4') -->
    html(
        [ \section_heading1('1.4')
        , p("Don’t be fooled by the fact that the description of the practical sessions is shorter than the text you have just read; the practical part is definitely the most important. Yes, you need to read the text and do the exercises, but that’s not enough to become a Prolog programmer. To really master the language you need to sit down in front of a computer and play with Prolog — a lot!")
        , p("The goal of the first practical session is for you to become familiar with the basics of how to create and run simple Prolog programs. Now, because there are many different implementations of Prolog, and different operating systems you can run them under, we can’t be too specific here. Rather, what we’ll do is describe in very general terms what is involved in running Prolog, list the practical skills you need to master, and suggest some things for you to do.")
        , p(["The simplest way to run a Prolog program is as follows. You have a file with your Prolog program in it (for example, you may have a file ", \inline_code("kb2.pl"), " which contains the knowledge base KB2). You then start Prolog. Prolog will display its prompt, something like"])
        , \static_code_block("?-")
        , p("which indicates that it is ready to accept a query.")
        , p("Now, at this stage, Prolog knows absolutely nothing about KB2 (or indeed anything else). To see this, type in the command listing , followed by a full stop, and hit return. That is, type")
        , \static_code_block("?-  listing.")
        , p("and press the return key.")
        , p("Now, the listing command is a special built-in Prolog predicate that instructs Prolog to display the contents of the current knowledge base. But we haven’t yet told Prolog about any knowledge bases, so it will just say")
        , \static_code_block("yes")
        , p("This is a correct answer: as yet Prolog knows nothing — so it correctly displays all this nothing and says yes . Actually, with more sophisticated Prolog implementations you may get a little more (for example, the names of libraries that have been loaded; libraries are discussed in Chapter  12 ) but, one way or another, you will receive what is essentially an “I know nothing about any knowledge bases!” answer.")
        , p(["So let’s tell Prolog about KB2. Assuming that you’ve stored KB2 in the file ", \inline_code("kb2.pl"), " , and that this file is in the directory where you’re running Prolog, all you have to type is"])
        , \static_code_block("?-  [kb2].")
        , p(["This tells Prolog to consult the file ", \inline_code("kb2.pl"), " , and load the contents as its new knowledge base. Assuming that ", \inline_code("kb2.pl"), " contains no typos, Prolog will read it in, maybe print out a message saying that it is consulting this file, and then answer:"])
        , \static_code_block("yes")
        , p(["Incidentally, it is common to store Prolog code in files with a ", \inline_code(".pl"), " suffix. It’s an indication of what the file contains (namely Prolog code) and with some Prolog implementations you don’t actually have to type in the ", \inline_code(".pl"), " suffix when you consult a file. Nice — but there is a drawback. Files containing Perl scripts usually have a ", \inline_code(".pl"), " suffix too, and nowadays there are a lot of Perl scripts in use, so this can cause confusion. C’est la vie."])
        , p("If the above doesn’t work, that is, if typing")
        , \static_code_block("?-  [kb2].")
        , p(["produces an error message saying that the file ", \inline_code("kb2"), " does not exist, then you probably haven’t started Prolog from the directory where ", \inline_code("kb2.pl"), " is stored. In that case, you can either stop Prolog (by typing ", \inline_code("halt."), " after the prompt), change to the directory where ", \inline_code("kb2.pl"), " is stored, and start Prolog again. Or you can tell Prolog exactly where to look for ", \inline_code("kb2.pl"), " . To do this, instead of writing only ", \inline_code("kb2"), " between the square brackets, you give Prolog the whole path enclosed in single quotes. For example, you type something like"])
        , \static_code_block("?-  [’home/kris/Prolog/kb2.pl’].")
        , p("or")
        , \static_code_block("?-  [’c:/Documents  and  Settings/Kris/Prolog/kb2.pl’].")
        , p("Ok, so Prolog should now know about all the KB2 predicates. And we can check whether it does by using the listing command again:")
        , \static_code_block("?-  listing.")
        , p("If you do this, Prolog will list (something like) the following on the screen:")
        , \static_code_block(
'listens2Music(mia).
happy(yolanda).
playsAirGuitar(mia):-
     listens2Music(mia).
playsAirGuitar(yolanda):-
     listens2Music(yolanda).
listens2Music(yolanda):-
     happy(yolanda).

yes')
        , p("That is, it will list the facts and rules that make up KB2, and then say yes . Once again, you may get a little more than this, such as the locations of various libraries that have been loaded.")
        , p("Incidentally, listing can be used in other ways. For example, typing")
        , \static_code_block("?-  listing(playsAirGuitar).")
        , p(["simply lists all the information in the knowledge base about the ", \inline_code("playsAirGuitar"), " predicate. So in this case Prolog will display"])
        , \static_code_block(
'playsAirGuitar(mia):-
     listens2Music(mia).
playsAirGuitar(yolanda):-
     listens2Music(yolanda).

yes')
        , p("Well — now you’re ready to go. KB2 is loaded and Prolog is running, so you can (and should!) start making exactly the sort of inquiries we discussed in the text.")
        , p("But let’s back up a little, and summarise a few of the practical skills you will need to master to get this far:")
        , ul([ li("You will need to know some basic facts about the operating system you are using, such as the directory structure it uses. After all, you will need to know how to save the files containing programs where you want them.")
             , li("You will need to know how to use some sort of text editor, in order to write and modify programs. Some Prolog implementations come with built-in text editors, but if you already know a text editor (such as Emacs) you can use this to write your Prolog code. Just make sure that you save your files as simple text files (for example, if you are working under Windows, don’t save them as Word documents).")
             , li("You may want to take example Prolog programs from the internet. So make sure you know how to use a browser to find what you want, and to store the code where you want it.")
             , li("You need to know how to start your version of Prolog, and how to consult files with it.")
             ])
        , p("The sooner you pick up these skills, the better. With them out of the way (which shouldn’t take long) you can start concentrating on mastering Prolog (which will take longer).")
        , p(["But assuming you have mastered these skills, what next? Quite simply, ", em("play with Prolog!"), " Consult the various knowledge bases discussed in the text, and check that the queries discussed really do work the way we said they did. In particular, take a look at KB5 and make sure you understand why you get those peculiar jealousy relations. Try posing new queries. Experiment with the ", \inline_code("listing"), " predicate (it’s a useful tool). Type in the knowledge base used in Exercise  1.5 , and check whether your answers are correct. Best of all, think of some simple situation that interests you, and create a brand-new knowledge base from scratch. "])
        ]
    ).


