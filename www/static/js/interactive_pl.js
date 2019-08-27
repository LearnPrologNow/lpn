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

function onActionBtnKeyDown(self, event, code, input) {
    if (event.key === ';' && $(self).data('role') === 'query') {
        query(code, input)
    } else if (event.key === '.') {
        clear_button(input)
    }
}

function onActionBtnClick(self, code, input) {
    const role = $(self).data('role') 
    if (role === 'clear') {
        clear_button(input);
    } else if (role === 'query') {
        query(code, input);
    }
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
    $(`#action-${qid.id}`).data('role', 'query').val("Run Query").show()
    $(`#clear-${qid.id}`).hide()
    $(`#results-${qid.id}`).hide().children(':not(.d-none)').remove()
    $(qid).prop("disabled", false)
}

function pl_answer($answers, qid) {
    return function (answer) {
        let msg = pl.format_answer(answer)
        const $clear = $(`#clear-${qid.id}`)
        const $action = $(`#action-${qid.id}`)
        if(answer) {
            if (answer.links && $.isEmptyObject(answer.links)) { msg = "yes." }
            $answers.find('.template.success').clone().text(msg).removeClass('template d-none').appendTo($answers)
            $clear.show()
            $action.data('role', 'query').val('Next Answer')
            // Do not allow user change the query in the middle of the session
            $(qid).prop("disabled", true)
        } else {
            if (answer == false) { msg = "no." }
            $answers.find('.template.warning').clone().text(msg).removeClass('template d-none').appendTo($answers)
            //  No more answers, next time query is clicked answers will be cleared
            $action.data('role', 'clear').val('Clear Answers')
            $clear.hide()
        }
        $answers.show()
    }
}
