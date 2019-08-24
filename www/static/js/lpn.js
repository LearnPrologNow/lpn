reload_booknav() // call before doc rendered to replace loading html

function expand_book_nav(caret) {
    $(caret).toggleClass('caret-down')
    $($(caret).next("ul")).toggleClass('show')
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

}

function toggleshowingbooknav() {
    if ($('#sidenav').hasClass('show')) { // is being closed
        localStorage.setItem('bn_showing', false)
    }
    else {
        localStorage.setItem('bn_showing', true)
    }
}
