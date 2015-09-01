$(document).ready(function () {
    $('.homemenu a').hover(function () {
        $(this).stop().animate({
            opacity: 1
        }, 200);
    }, function () {
        $(this).stop().animate({
            opacity: 0.7
        }, 200);
    });
});

$(document).ready(function () {
    $('.homemenu2 a').hover(function () {
        $(this).stop().animate({
            opacity: 1
        }, 200);
    }, function () {
        $(this).stop().animate({
            opacity: 0.7
        }, 200);
    });
});