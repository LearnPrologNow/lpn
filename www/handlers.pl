:- use_module(library(http/http_files)).
:- ensure_loaded(lpn_html).

http:location(static, '/static', []).
http:location(section, '/section', []).

% Tmp home page
:- http_handler(/, say_hi,  []).

% Book content, X identifies the page
:- http_handler(section(X), reply_lpn_section(X), []).

% Static files
:- http_handler(static(.), http_reply_from_files(static, []), [prefix]).
