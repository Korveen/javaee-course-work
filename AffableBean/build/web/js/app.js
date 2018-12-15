document.onkeyup = function (e) {
    //ESC pressed => to Admin
    if (e.keyCode == 27) {
        window.location.replace('admin');
    }
}