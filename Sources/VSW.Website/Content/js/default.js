$(document).ready(function () {
    // move head sub to main
//    var headMain = $(".headerMain");
//    alert(headMain.html());
//    $(".headsub").each(function () {
//        debugger;
//        var that = $(this);
//        alert(that.html());
//        headMain.html("awrtqwr");
//        that.remove();
//    });

    // Menu
    $(".dropdown img.flag").addClass("flagvisibility");

    $(".dropdown dt a").click(function () {
        $(".dropdown dd ul").toggle();
    });

    $(".dropdown dd ul li a").click(function () {
        var text = $(this).html();
        $(".dropdown dt a span").html(text);
        $(".dropdown dd ul").hide();
        $("#result").html("Selected value is: " + getSelectedValue("sample"));
    });

    function getSelectedValue(id) {
        return $("#" + id).find("dt a span.value").html();
    }

    $(document).bind('click', function (e) {
        var $clicked = $(e.target);
        if (!$clicked.parents().hasClass("dropdown"))
            $(".dropdown dd ul").hide();
    });


    $("#flagSwitcher").click(function () {
        $(".dropdown img.flag").toggleClass("flagvisibility");
    });

    // menu register
    $(".megamenu").megamenu();

    // -- End menu

    // Icon ontop    
    $(".scroll").click(function (event) {
        event.preventDefault();
        $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1200);
    });



    $(document).on("click", ".news-service .sub-title", function () {
        var that = $(this);
        // Hide all
        var listItemOther = $(".news-service .sub-title[data-id !='" + that.data("id") + "']");
        listItemOther.each(function () {
            var content_menu = $(this).parents("li").find(".content-menu");
            if (content_menu.length > 0) {
                content_menu.addClass("hidden");
            }
        });

        // Hide/ show
        var parent = that.parents("li");
        var subMenu = parent.find(".content-menu");
        if (subMenu.length > 0) {
            subMenu.toggleClass("hidden");
        }
    });
});