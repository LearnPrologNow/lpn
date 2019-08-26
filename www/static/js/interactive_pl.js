const sessions = {}

function parse_query(code, qid, answer_list) {
    const dom_answer = pl_answer(answer_list, qid)

    sessions[qid.id] = pl.create(1000)

    // Parse code
    const parsed = sessions[qid.id].consult(code)
    if (parsed !== true) { dom_answer(parsed) }

    // Parse query
    const query_parsed = sessions[qid.id].query(qid.value)
    if (query_parsed !== true) { dom_answer(query_parsed) }
}

function button_key(char, code, qid, elem) {
    // TODO make it work again
    // if (char == 59) {
    //     query(code, qid)
    // }
    // if (char == 46) {
    //     const query_form = elem.offsetParent.parentElement
    //     answer_list = query_form.lastChild
    //     if (elem.value === "Clear Answers") {
    //         query(code, qid, elem)
    //     }
    //     else {
    //         $('<li class="list-group-item list-group-item-warning"></li>').appendTo(answer_list)
    //         elem.value = "Clear Answers"
    //         if ($(elem.parentElement.lastChild).hasClass('btn-warning')) {
    //             elem.parentElement.lastChild.remove()
    //         }
    //     }
    // }
}

function query(code, qid) {
    const answer_list = $(`#results-${qid.id}`)
    
    // invoked on the first query to create the session
    // TODO change it to not tie UI with initiation logic
    if (!answer_list.children(':visible').length) {
        parse_query(code.value, qid, answer_list)
    }

    const dom_answer = pl_answer(answer_list, qid)
    // Answer
    sessions[qid.id].answer(dom_answer)
}

function clear_button(qid) {
    $(`#query-${qid.id}`).show()
    $(`#next-${qid.id}`).hide()
    $(`#clear-${qid.id}`).hide()
    $(`#results-${qid.id}`).hide().children(':not(.d-none)').remove()
}

function pl_answer($answers, qid) {
    return function (answer) {
        let msg = pl.format_answer(answer)
        const $next = $(`#next-${qid.id}`)
        const $clear = $(`#clear-${qid.id}`)
        $(`#query-${qid.id}`).hide()
        if(answer) {
            if (answer.links && $.isEmptyObject(answer.links)) { msg = "yes." }
            $answers.find('.template.success').clone().text(msg).removeClass('d-none').appendTo($answers)
            $next.show()
            $clear.removeClass('btn-primary').addClass('btn-warning').show()
            // Do not allow user change the query in the middle of the session
            $(qid).prop("disabled", true)
        } else {
            if (answer == false) { msg = "no." }
            $answers.find('.template.warning').clone().text(msg).removeClass('d-none').appendTo($answers)
            //  No more answers, hide next and make clear primary
            $next.hide()
            $clear.removeClass('btn-warning').addClass('btn-primary').show()
        }
        $answers.show()
    }
}
