:- multifile chapter/1.
:- multifile info/3.
:- multifile section/3.
:- ensure_loaded(front_matter).
:- ensure_loaded(chapter1/chapter1).

%! section(N) if N is a chapter number creates a chapter page
section(N) --> { chapter(N)
               , info(N, title, Title)
               }, chapter_header(N, Title).
