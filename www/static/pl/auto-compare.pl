:- use_module(library(dom)).
:- use_module(library(js)).
:- use_module(library(lists)).
init.

question_input(ID, Input) :-
    get_by_id(ID, Label), parent_of(Label, Div), sibling(Div, Input).

check_answer(Q, Ans) :-
    question(A, Ans, Reason),
    !,
    question_input(Q, Input),
    swap_class(Input, 'is-invalid', 'is-valid'),
    feedback(correct, Reason).

check_answer(Q, Ans) :-
    question(Q, Correct, Reason),
    Ans \= Correct, Ans \= '',
    !,
    question_input(Q, Input),
    swap_class(Input, 'is-valid', 'is-invalid'),
    feedback(wrong, Reason).

feedback(correct, Reason) :-
    findall(Q, question(Q, _, Reason), Questions),
    include(is_correct, Questions, Questions),
    atom_concat('Correct: ', Reason, InnerHTML),
    add_feedback_li(Reason, 'list-group-item-success', InnerHTML).

feedback(wrong, Reason) :-
    atom_concat('Remember: ', Reason, InnerHTML),
    add_feedback_li(Reason, 'list-group-item-warning', InnerHTML).

add_feedback_li(ID, _, _) :-
    get_by_id(ID, _), !. % Already exists, don't add.
add_feedback_li(ID, Class, InnerHTML) :-
    create(li, FB),
    add_class(FB, 'list-group-item'),
    add_class(FB, Class),
    attr(FB, id, ID),
    html(FB, InnerHTML),
    get_by_id(feedback, FBL),
    append_child(FBL, FB).

is_correct(ID) :-
    question_input(ID, Input),
    attr(Input, value, Value),
    question(ID, Value, _).

swap_class(H, From, To) :-
    remove_class(H, From),
    add_class(H, To).
