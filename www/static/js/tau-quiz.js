function loadPl(session, location) {
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
         const parsed = session.consult(this.responseText);
         if (parsed !== true) { console.log(pl.format_answer(parsed)) }
        // Run query, can only load one file this way
         const query = session.query("init.")
         if (query !== true) { console.log(pl.format_answer(query)) }
         session.answer((a) => {}) //console.log(pl.format_answer(a)))
    }
  };
  xhttp.open("GET", location, true);
  xhttp.send();
}

document.addEventListener('DOMContentLoaded', function(){
    const session = pl.create(1000)
    const parsed = session.consult("questions.pl")
    if (parsed !== true) { console.log(pl.format_answer(parsed)) }
    loadPl(session, "/static/pl/quiz.pl")
}, false);


