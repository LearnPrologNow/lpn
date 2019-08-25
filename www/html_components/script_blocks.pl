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
