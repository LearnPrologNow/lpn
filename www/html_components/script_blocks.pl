% Scripts for quiz pages
scripts(N) -->
    { query([N-ako-'AssessmentArtifact', N-type-Type]) },
    html(
        [ script([src('/static/js/jquery-3.4.1.min.js')],[])
        , script([src('/static/js/jquery.floatThead.min.js')],[])
        , script([src('/static/js/bootstrap.bundle.min.js')], [])
        , script([src('/static/js/prism.js')], [])
        , script([src('/static/js/tau-prolog.js')], [])
        , script([src('/static/js/lpn.js')], [])
        , \quiz_script(Type)
        ]
    ).

% Scripts for non-quiz pages
scripts(N) -->
    { \+ query(N, ako, 'AssessmentArtifact') },
    html(
        [ script([src('/static/js/jquery-3.4.1.min.js')],[])
        , script([src('/static/js/bootstrap.bundle.min.js')], [])
        , script([src('/static/js/prism.js')], [])
        , script([src('/static/js/tau-prolog.js')], [])
        , script([src('/static/js/lpn.js')], [])
        , script([src('/static/js/interactive_pl.js')], [])
        ]
    ).

quiz_script('MCQ') --> html(script(
'document.addEventListener("DOMContentLoaded", start_quiz("/static/pl/mcq.pl"), false);

$(document).ready(function(){
    $(".sticky-header").floatThead({top:60});
});'
)).

quiz_script('auto-compare') --> html(script(
'document.addEventListener("DOMContentLoaded", start_quiz("/static/pl/auto-compare.pl"), false);

$("#quiz").find("input").blur(check_answer);

function check_answer(e) {
    const answer = e.target.value
    const question = $(e.target).prev().text()
    const query = `check_answer(\'${question}\', \'${answer}\').`
    session.query(query)
    session.answer((a) => {})
}

')).

quiz_script('multi-markscheme') --> html(script(
'
function markscheme() {
    $(".markscheme").addClass("show")
    for (const ans of $(".answer")) {
        const answer = $(ans)
        if (answer.attr("data-answer") == answer.val()) {
            answer.addClass("is-valid")
            answer.next().find("input").prop("checked", true)
        }
    }
}

function validate(ID, value) {
    const elem = $(ID)
    if (value) {
        elem.removeClass("is-invalid")
        elem.addClass("is-valid")
    }
    else {
        elem.removeClass("is-valid")
        elem.addClass("is-invalid")
    }
}
'
)).
