:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

:- prolog_load_context(directory, Dir),
   asserta(user:file_search_path(www, Dir)).

:- ensure_loaded(www(handlers)).

go :-
    use_module(library(http/http_unix_daemon)),
    initialization(http_daemon).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

serve :-
    server(8000).
