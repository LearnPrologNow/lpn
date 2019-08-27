const sessions = {}

function onActionBtnKeyDown(self, event, code, input) {
    const role = $(self).data('role');
    if (event.key === ';') {
        if (role === 'query') {
            query(code, input)
        } else if (role === 'next') {
            next(input)
        }
    } else if (event.key === '.') {
        clear_answers(input)
    }
}

function onActionBtnClick(self, code, input) {
    const role = $(self).data('role') 
    if (role === 'clear') {
        clear_answers(input);
    } else if (role === 'next') {
        next(input);
    } else if (role === 'query') {
        query(code, input);
    }
}

function query(code, qid) {
    
    sessions[qid.id] = pl.create(1000)

    // Parse code
    const parsed = sessions[qid.id].consult(code.value)
    if (parsed !== true) { pl_answer(qid)(parsed) }

    // Parse query
    const query_parsed = sessions[qid.id].query(qid.value)
    if (query_parsed !== true) { pl_answer(qid)(query_parsed) }
    
    next(qid)
}

function next(qid) {
    sessions[qid.id].answer(pl_answer(qid))
}

function clear_answers(qid) {
    $(`#action-${qid.id}`).data('role', 'query').val("Run Query").show()
    $(`#clear-${qid.id}`).hide()
    $(`#results-${qid.id}`).hide().children(':not(.d-none)').remove()
    $(qid).prop("disabled", false)
}

function pl_answer(qid) {
    const $answers = $(`#results-${qid.id}`)
    return function (answer) {
        let msg = pl.format_answer(answer)
        const $clear = $(`#clear-${qid.id}`)
        const $action = $(`#action-${qid.id}`)
        if(answer) {
            if (answer.links && $.isEmptyObject(answer.links)) { msg = "yes." }
            $answers.find('.template.success').clone().text(msg).removeClass('template d-none').appendTo($answers)
            $clear.show()
            $action.data('role', 'next').val('Next Answer')
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
