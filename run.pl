:- prolog_load_context(directory, Dir),
   asserta(user:file_search_path(app, Dir)).

:- ensure_loaded(app(www/server)).

:- go.
