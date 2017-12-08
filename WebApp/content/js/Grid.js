Benner.Grid = function () {

}

$(document).keyup(function (e) {
    if (e.keyCode == 13) { // enter
        var $currentFocus = $('input[type=text]:focus,input[type=checkbox]:focus,span:focus,input[type=search]:focus');
        if ($currentFocus.length) {
            var $filterForm = $currentFocus.closest('.filter-search-form, .filter-search-simple');
            if ($filterForm.length) {
                var $comboDropDown = $('.comboDropDown');
                if ($comboDropDown.length == 0 || ($comboDropDown.length && !$comboDropDown.is(':visible'))) {
                    var $button = $filterForm.find($('.filter-button'));
                    if ($button.length) {
                        Benner.FormWidget.removeMask();
                        // o onclick do botão filtrar é responsável por armazenar o foco no próximo campo
                        var click = $button.attr('onclick');
                        if(click && click.length)
                            eval(click);
                        // enquanto o href é responsável pelo postback
                        window.location.href = $button.attr('href');
                        return false;
                    }
                }
            }
        }
    }
});

Benner.Grid.showRecordCommands = function (listItem) {
    var dropMenu = listItem.getElementsByTagName("div");

    if (dropMenu == null || dropMenu.length == 0)
        return;


    dropMenu[0].style.left = "0px"; // Define posicionamento dos comandos logo abaixo do botão 
    dropMenu[0].style.visibility = "visible";

}

Benner.Grid.selectAllRows = function (gridClientId) {

    var value = false;
    if ($("#" + gridClientId).find("th.multi-select-column input:checked").length > 0)
        value = true;

    var checkboxlist = $("#" + gridClientId).find("td.multi-select-column label > input");
    for (var i = 0; i < checkboxlist.length; i++) {
        if ($(checkboxlist[i]).prop("checked") !== value)
            $(checkboxlist[i]).click();
    }   
}

Benner.Grid.stopPropagation = function (evt) {
    var event = evt || window.event;

    if (event.stopPropagation)
        event.stopPropagation();
    else
        event.cancelBubble = true;
}
