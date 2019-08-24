:- use_module(library(dom)).
:- use_module(library(js)).
:- use_module(library(lists)).


init :-
    findall(I, get_by_type(radio, I), Inputs),
    maplist(bind_click, Inputs).

bind_click(Input) :-
    attr(Input, name, Name),
    bind(Input, click, _, radiocasecheck(Name)).
bind_click(Input) :-
    attr(Input, type, Type),
    \+ Type = radio.

get_by_type(Type, HTML) :-
    get_by_tag(input, HTML),
    get_attr(HTML, type, Type).

radiocasecheck(Name) :-
    get_by_name(Name, HTML),
    prop(HTML, checked, true),
    attr(HTML, value, Value),
    check_answer(Name, Value, Result),
    feedback(Name, Result).

check_answer(Name, Value, correct) :-
    question(Name, Value, Reason),
    findall(H, get_by_name(Name, H), Answers),
    mark_correct(Answers).

check_answer(Name, Value, wrong) :-
    \+ question(Name, Value, Reason),
    findall(H, get_by_name(Name, H), Answers),
    mark_incorrect(Answers).

feedback(Name, Result) :-
    question(Name, _, Reason),
    \+ get_by_id(Reason, _),
    feedback_(Result, Reason).

feedback_(correct, Reason) :-
    findall(N, question(N, _, Reason), Names),
    include(is_correct, Names, Correct),
    length(Names, NL), length(Correct, CL),
    NL =:= CL,
    atom_concat('Correct: ', Reason, InnerHTML),
    add_feedback_li(Reason, 'list-group-item-success', InnerHTML).

feedback_(wrong, Reason) :-
    atom_concat('Remember: ', Reason, InnerHTML),
    add_feedback_li(Reason, 'list-group-item-warning', InnerHTML).

add_feedback_li(ID, Class, InnerHTML) :-
    create(li, FB),
    add_class(FB, 'list-group-item'),
    add_class(FB, Class),
    attr(FB, id, ID),
    html(FB, InnerHTML),
    get_by_id(feedback, FBL),
    append_child(FBL, FB).

is_correct(Name) :-
    get_by_name(Name, HTML),
    prop(HTML, checked, true),
    attr(HTML, value, Value),
    question(Name, Value, _).

is_correct_or_unanswered(Name) :-
    get_by_name(Name, HTML),
    ( prop(HTML, checked, false)
    ; prop(HTML, checked, true),
      attr(HTML, value, Value),
      question(Name, Value, _)
    ).

console_log(Text) :-
    prop(console, C),
    prop(C, log, CL),
    apply(CL, [Text], _).

mark_correct([H|_]) :-
    parent_of(H, Btn),
    parent_of(Btn, TD),
    parent_of(TD, TR),
    swap_class(TR, 'table-warning', 'table-success').

mark_incorrect([H|_]) :-
    parent_of(H, Btn),
    parent_of(Btn, TD),
    parent_of(TD, TR),
    swap_class(H, 'table-success', 'table-warning').

swap_class(H, From, To) :-
    ( remove_class(H, From)
    ; \+ has_class(H, From)
    ),
    add_class(H, To).

is_list([]).
is_list([H|T]).


