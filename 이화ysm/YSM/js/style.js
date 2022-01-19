$(document).ready(function () {

    $('.menu_btn>a').on('click', function () {
        $('.menu_bg').show();
        $('.sidebar_menu').show().animate({
            right: '-1px'
        });
    });
    $('.close_btn>a').on('click', function () {
        $('.menu_bg').hide();
        $('.sidebar_menu').animate({
            right: '-' + 80 + '%'
        }, function () {
            $('.sidebar_menu').hide();
        });
    });
    $(".sidebar_menu ul.sub_menu").hide();
    $(".sidebar_menu ul.menu_wrap li a").click(function () {
        var submenu = $(this).next("ul");
        if (submenu.is(":visible")) {
            submenu.slideUp();
            $child = $(this).children('span');
            $child.toggleClass("plus").toggleClass("minus");
        } else {
            submenu.slideDown();
            $child = $(this).children('span');
            $child.toggleClass("minus").toggleClass("plus");
        }
    });
});
