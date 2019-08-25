:- prolog_load_context(directory, Dir),
   asserta(user:file_search_path(book_html, Dir)).



:- multifile chapter/1.
:- multifile info/3.
:- multifile section/3.
:- ensure_loaded(book_html(front_matter)).
:- ensure_loaded(book_html(chapter1/chapter1)).

%! section(N) if N is a chapter number creates a chapter page
section(N) --> { query([N-ako-'NavigationArtifact', N-title-Title])
               }, navigation_artifact(N, Title).
