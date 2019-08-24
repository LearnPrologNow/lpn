# Learn Prolog Now! source text

## New Interactive Version

The intention is to provide this as part of PrologHub, which will be
changing so that the blog is only one part of it. PrologHub is aiming to
be a "goto" place for people learning Prolog, so it will provide this
service as well as cheat-sheets, reading recommendations, topic specific
tutorials and learning projects.

By tracking what is being learnt it is our hope that *Learn Prolog Now!*
can be integrated with the other services such that if we notice someone
taking a project doesn't know something taught in the book we can point
them towards the relevant section.

### Running

The web-server is in `www/server.pl`. In the `www` directory I tend to
run `swipl -g serve -s server.pl`

### Directories

- ont    ontology containing all the information about the parts of the
  book
- www    contains source and server for website

### Prototype concerns

Far too much use of `ensure_loaded/1`, will need to turn into modules.

### Ontology Concerns

Ontology is written in frames and compiled to triples for efficiency.
`query.pl` provides `query/1` and `query/3` predicates for ontology
access. Currently there's nothing smart about the ontology reasoning,
which is sufficient for serving content.

The learning objectives part of the ontology is for a future endeavour
that will permit users to track their learning, perhaps earning badges.
We will be able to tell a user what they've been taught and what we have
assessed them to know. The data structures of the actual objectives are
strict, the verb predicates are taken from Bloom's revised taxonomy and
are not yet described in the documentation, but are in the book: "A Taxonomy for
Learning, Teaching and Assessing". I'll write up a "how-to" guide for
tagging these, but it's not urgent.

### Web Concerns

#### HTML

We're using termarized HTML, currently copy-pasted and then transformed.
The current websites don't include all the formatting present in the
Latex/Printed Book, so we're adding this back in. It's probably possible
to write a parser that'll take the Latex and spit out termarized HTML,
but it might prove to take longer.

Termarized HTML is being used to create components, such as a code query
or navigation page. Where possible this should be improved upon.

#### CSS

We're strictly using Bootstrap for a professional style and to integrate
into PrologHub. For these reason we're using the same colour scheme.

#### JavaScript

We're using JQuery, as per Bootstraps requirements. We've got `prism.js`
providing client-side syntax highlighting too. Finally there's some
homespun JavaScript to interact with Tau-Prolog. To avoid writing quiz
logic in JavaScript, these are also handed off to Tau-Prolog.

`localStorage is being used` to store the nav-sidebar state between page
loads. This can be cleared with `localStorage.clear()` should it need to
be refreshed.

#### Client-Side Prolog

Tau-Prolog is providing all the Prolog interactivity. Changing the
code-block structure for `\code_query` will likely break the JavaScript
due to how it navigates the DOM.

### Quizzes

So far only an MCQ framework has been implemented.

The other types of quizzes required in chapter 1 will be an auto-compare
based on a text input. Eg:

---

* What's the functor/arity of...*

- `boxer(Butch)`  [ boxer/2 ]

---

Where 'boxer/2' is typed by the user into a text input box and we check
it against a known answer.

There's also a need for a manually checked one, we'll opt for
self-assessed. This will need a place to type, and a button that will
reveal the marking scheme and checkboxes for users to mark their work
correct.

### Practice Sessions

It would be nice to provide an in-browser editor for the user. Thought
is required as to whether Tau-Prolog is sufficient for this or if we
should integrate SWISH.

### User Accounts

Besides logging in, we need to integrate user data into the
ontology. When a user requests a resource this will add a triple, when
they successfully complete an assessment this will also add a triple.
Thus we can track what they've been taught and learnt.
`library(persistency)` will be good for this. It also means we can allow
a user to download all their own data (and static ontology) in Prolog
for their own amusement. User account data can be stored in "FOAF"
inspired triples.


----

# Old Version

Not yet deleted as it contains data not yet transferred.


## Directories

	archive		contains old stuff (just for the record)
	web_site	contains sources of OLD website
	prolog		example prolog databases
	text		contains latex sources and produced ps and pdf files
	scripts		contains shell/perl scripts for conversion and pdf production
	www		contains sources of current website

## Scripts

	scripts/_generate_html	converts html from latex sources
	scripts/_run		produces lpn.ps and lpn.pdf

## Character set

The sources are ISO-Latin-1 files. They do not compile after conversion
to UTF-8.  The scripts must be executed under non-UTF-8 locale.
