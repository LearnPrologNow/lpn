reload_booknav() // call before doc rendered to replace loading html

function expand_book_nav(caret) {
    $(caret).toggleClass('caret-down')
    $($(caret).parent().next("ul")).toggleClass('show')
    localStorage.setItem('booknav', $('#booknav').html())
}

function reload_booknav() {
    const bn = localStorage.getItem('booknav')
    if (bn) {
        $('#booknav').html(bn)
    }
    if (localStorage.getItem('bn_showing') == 'true') {
        $('#sidenav').addClass('show')
    }
    else {
        $('#sidenav').removeClass('show')
    }
    clear_current_active()
    open_to_location()
}

function toggleshowingbooknav() {
    if ($('#sidenav').hasClass('show')) { // is being closed
        localStorage.setItem('bn_showing', false)
    }
    else {
        localStorage.setItem('bn_showing', true)
    }
}

function clear_current_active() {
    cca($('#sidenav').children())
}

function cca(children) {
        for (child of children) {
            const c = $(child)
            c.removeClass('disabled')
            c.removeClass('bg-light')
            cca(c.children())
        }
}

function open_to_location() {
    const path = window.location.pathname
    const id = `#n${path.slice(path.lastIndexOf("/")+1).replace(/\./g, "\\.")}`
    const link = $(id)
    link.addClass("disabled")
    link.addClass("show")
    link.parent().addClass("bg-light")
    open_parents(id)
}

function open_parents(id) {
    if (id.length > 3) {
        const parentid = id.slice(0, id.lastIndexOf(".") - 1)
        const parent = $(parentid).parent()
        parent.addClass("caret-down")
        parent.next().addClass("show")
        open_parents(parentid)
    }
}

// loadPl used in quizes to consult prolog
function loadPl(session, location) {
    $.get(location, function(data) {
        const parsed = session.consult(data);
         if (parsed !== true) { console.log(pl.format_answer(parsed)) }
        // Run query, can only load one file this way
         const query = session.query("init.")
         if (query !== true) { console.log(pl.format_answer(query)) }
         session.answer((a) => {}) //console.log(pl.format_answer(a)))
    });
}

let session = null

function start_quiz(quiz) {
    session = pl.create(1000)
    const parsed = session.consult("questions.pl")
    if (parsed !== true) { console.log(pl.format_answer(parsed)) }
    loadPl(session, quiz)
}
