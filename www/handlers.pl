:- use_module(library(http/http_files)).
:- ensure_loaded(lpn_html).

http:location(static, '/static', []).

:- http_handler(/, say_hi,  []).

:- http_handler(root(preface), reply_lpn_page("Preface"), []).
:- http_handler(root(introduction), reply_lpn_page("Introduction"), []).
:- http_handler(root(chapter1), reply_lpn_page("Chapter 1"), []).
:- http_handler(root('section1.1'), reply_lpn_page("Section 1.1"), []).
:- http_handler(root('section1.1.1'), reply_lpn_page("Section 1.1.1"), []).
:- http_handler(root('section1.1.2'), reply_lpn_page("Section 1.1.2"), []).
:- http_handler(root('section1.1.3'), reply_lpn_page("Section 1.1.3"), []).
:- http_handler(root('section1.1.4'), reply_lpn_page("Section 1.1.4"), []).
:- http_handler(root('section1.1.5'), reply_lpn_page("Section 1.1.5"), []).

:- http_handler(static(.), http_reply_from_files(static, []), [prefix]).

say_hi(_R) :-
    format('Content-type: text/plain~n~n'),
    format('Hello, world!~n').
