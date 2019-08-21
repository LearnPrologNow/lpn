const sessions = {}

function parse_query(code, qid, elem, answer_list) {
    const dom_answer = pl_answer(answer_list, elem)

    sessions[qid.id] = pl.create(1000)

    // Parse code
    const parsed = sessions[qid.id].consult(code)
    if (parsed !== true) { dom_answer(parsed) }

    // Parse query
    const query_parsed = sessions[qid.id].query(qid.value)
    if (query_parsed !== true) { dom_answer(query_parsed) }
}

function button_key(char, code, qid, elem) {
    if (char == 59) {
        query(code, qid, elem)
    }
    if (char == 46) {
        const query_form = elem.offsetParent.parentElement
        answer_list = query_form.lastChild
        if (elem.value === "Clear Answers") {
            query(code, qid, elem)
        }
        else {
            $('<li class="list-group-item list-group-item-warning"></li>').appendTo(answer_list)
            elem.value = "Clear Answers"
            if ($(elem.parentElement.lastChild).hasClass('btn-warning')) {
                elem.parentElement.lastChild.remove()
            }
        }
    }
}

function query(code, qid, elem) {
    // Get DOM element for answers setup

    const query_form = elem.offsetParent.parentElement
    let answer_list = $('<ul class="list-group mb-2"></ul>')

    // Answer list already exists
    if ($(query_form.lastChild).prop("tagName") === "UL") {
        // Still successful answers
        if ($(query_form.lastChild.lastChild).hasClass("list-group-item-success")) {
            answer_list = query_form.lastChild
        }
        // No more answers or error
        else {
            query_form.lastChild.remove() // ul
            $(qid).prop("disabled", false)
            elem.value = "Run Query"
            return
        }
    }
    // No Answer list yet
    else {
        answer_list.appendTo(query_form)
        parse_query(code.value, qid, elem, answer_list)
    }

    const dom_answer = pl_answer(answer_list, qid, elem)
    // Answer
    sessions[qid.id].answer(dom_answer)
}

function clear_button(elem, qid) {
    elem.offsetParent.parentElement.lastChild.remove() // ul
    $(elem).prev()[0].value = "Run Query"
    $(qid).prop("disabled", false)
    elem.remove()
}

function pl_answer(answers, qid, elem) {
    return function (answer) {
        let msg = pl.format_answer(answer)
        if(answer) {
            if (answer.links && $.isEmptyObject(answer.links)) { msg = "yes." }
            $(`<li class="list-group-item list-group-item-success">${msg}</li>`).appendTo(answers)
            elem.value = "Next Answer"
            $(qid).prop("disabled", true)
            if (!$(elem.parentElement.lastChild).hasClass('btn-warning')) {
                $(`<input type="button" class="btn btn-warning" value="Clear Answers" onclick="clear_button(this, ${qid.id})"></input>`).appendTo(elem.parentElement)
            }
        } else {
            if (answer == false) { msg = "no." }
            $(`<li class="list-group-item list-group-item-warning">${msg}</li>`).appendTo(answers)
            elem.value = "Clear Answers"
            if ($(elem.parentElement.lastChild).hasClass('btn-warning')) {
                elem.parentElement.lastChild.remove()
            }
        }
    }
}
