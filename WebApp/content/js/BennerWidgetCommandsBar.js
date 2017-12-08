﻿/// <reference path="Form.js" />
Benner.WidgetCommandsBar = function () {

    var adjustCommandsBarForAllWidgets = function (fadeIn) {

        // descobrir todos CommandBars da página
        var commandsBarList = $('.form-actions');

        // disparar o ajuste para cada um
        for (var i = 0; i < commandsBarList.length; i++) {
            var commandsBar = $(commandsBarList[i]);

            // disparar apenas se a diferença com tela anterior for maior que 15px
            var lastWidth = commandsBar.data("lastWidth");
            if (!lastWidth)
                lastWidth = 0;
            var delta = lastWidth - commandsBar.width();

            if (delta < -15 || delta > 15 || lastWidth == 0) {
                adjustCommandsBar(commandsBar, fadeIn);

                commandsBar.data("lastWidth", commandsBar.width());
            }
        }
    };

    var adjustCommandsBar = function (commandsBar, fadeIn) {
        // descobrir a area útil
        var usefulWidth = calulateUsefulWidth(commandsBar);
        var commandButtonList = commandsBar.find('.custom-action');
        var hideNestedMenu = true;

        // para cada comando, da visão
        for (var i = 0; i < commandButtonList.length; i++) {

            // descobrir a largura
            commandButton = $(commandButtonList[i]);
            commandWidth = commandButton.outerWidth(true);


            // se área útil for maior ou igual que o comando
            if (usefulWidth >= commandWidth || commandWidth == 0) {
                var topMenuId = commandButton.attr('id');
                var nestedMenuId = topMenuId.replace('top-', 'nested-');

                commandsBar.find('#' + nestedMenuId).hide();
                if (fadeIn)
                    commandsBar.find('#' + topMenuId).fadeIn("slow");
                else
                    commandsBar.find('#' + topMenuId).show();
            }

                // se área útil for menor que o comando
            else if (usefulWidth < commandWidth) {
                var topMenuId = commandButton.attr('id');
                var nestedMenuId = topMenuId.replace('top-', 'nested-');

                commandsBar.find('#' + topMenuId).hide();

                var $commandsGroup = commandsBar.find('#' + nestedMenuId);
                Benner.WidgetCommandsBar.adjustCommandsGroup($commandsGroup);
                $commandsGroup.show();

                hideNestedMenu = false;
            }
            usefulWidth -= commandWidth;
        }

        // esconder o botão sanduíche
        if (hideNestedMenu)
            commandsBar.find('.nested-menu').hide();
        else {
            if (fadeIn)
                commandsBar.find('.nested-menu').fadeIn("slow");
            else
                commandsBar.find('.nested-menu').show();
        }

    };

    var calulateUsefulWidth = function (commandsBar) {

        var predefinedButtons = commandsBar.find('.predef-action');

        // iniciando com uma margem de 3px por botão
        var predefWidth = predefinedButtons.length * 4;

        // somando ainda a area de cada um dos predefinidos
        for (var i = 0; i < predefinedButtons.length; i++) {
            predefWidth += $(predefinedButtons[i]).outerWidth(true);
        }

        // descobrir a área útil
        var usefulWidth = commandsBar.width() - 30; /*margem de segurança*/
        usefulWidth -= predefWidth;
        usefulWidth -= commandsBar.find('.nested-menu').outerWidth(true) + 4;

        return usefulWidth;
    };

    var adjustGroupCommandsFooter = function () {
        var groupCommands = $(".btn-group.command-action");
        for (var i = 0; i < groupCommands.length; i++) {
            var $groupCommand = $(groupCommands[i]);

            var heightComponent = $groupCommand.children("ul").height() + ($groupCommand.offset().top + 34 + 10);
            if (heightComponent >= $(document).height()) {
                $groupCommand.addClass("dropup");
            } else {
                $groupCommand.removeClass("dropup");
            }
        }
    }

    var adjustGroupCommandFooter = function ($groupCommand, $commandsBar) {
        var heightComponent = $groupCommand.children("ul").height() + ($commandsBar.offset().top + 34 + 10);
        if (Math.round(heightComponent) >= $(document).height()) {
            $groupCommand.addClass("dropup");
        } else {
            $groupCommand.removeClass("dropup");
        }
    }

    var Widget = function(id, rootDocument) {

        var _id = id;
        var _rootDocument = rootDocument;

        var _addCommandsBarOn = function() {

            var commandsBar = $(_rootDocument).find('#' + _id ).find('.form-actions.bottom.nobg.no-border.commands-bar.fluid.footer-commands-bar');

            $(_rootDocument).find('#' + _id).find('.command-action').each(function (j, action) {
                var $newCommand = $(action).clone(true);
                $(commandsBar).append($newCommand).append(' ');

                if ($newCommand.hasClass("btn-group")) {
                    adjustGroupCommandFooter($newCommand, commandsBar);
                    //Após copiar o comando agrupador e necessario iniciar o componente
                    $newCommand.children('a').dropdownHover();
                }
            });
        };

        var _isGrid = function() {
            return $(_rootDocument).find('#' + _id).find('.grid-footer-row').length > 0;
        };
        
        this.getId = function() {
            return _id;
        };

        this.isShorterThenWindow = function () {
            var currentWindow = window.self === window.top ? window : window.top;
            var windowHeight = 0;

            if (window.self === window.top)
                windowHeight = $(currentWindow).height() - 46;
            else
                windowHeight = ($(currentWindow).height() * 0.9);// - 120;

            return $(_rootDocument).find('#' + _id).find('.portlet-body').height() < windowHeight;
        };

        this.hasFooterCommandsBar = function() {
            return $(_rootDocument).find('#' + _id).find('.footer-commands-bar').length > 0 && $(_rootDocument).find('#' + _id).find('.footer-commands-bar').children().length > 0;
        };

        this.hideFooterCommandsBar = function () {
            if (!$(_rootDocument).find('#' + _id).find('.footer-commands-bar').is('.footer-commands-bar.commands-bar-hide'))
                $(_rootDocument).find('#' + _id).find('.footer-commands-bar').addClass('hide');
        };

        this.createFooterCommandsBar = function() {
            return _addCommandsBarOn();
        };

        this.footerCommandsBarIsHidden = function() {
            return $(_rootDocument).find('#' + _id).find('.footer-commands-bar').hasClass('hide');
        };

        this.displayFooterCommandsBar = function () {
            $(_rootDocument).find('#' + _id).find('.footer-commands-bar').removeClass('hide');
        };
    };

    var getWidgets = function(rootDocument) {
        var widgets = [];

        $(rootDocument).find('.widget').each(function (i, obj) {
            widgets.push(new Widget($(obj).attr('id'), rootDocument));
        });

        return widgets;
    };

    var createFooterCommandsBar = function(rootDocument) {

        var widgets = getWidgets(rootDocument);

        for (var i = 0; i < widgets.length; i++) {

            var widget = widgets[i];
            
            if (widget.isShorterThenWindow()) {
                widget.hideFooterCommandsBar();
                continue;
            }
            else if (widget.hasFooterCommandsBar()) {
                widget.displayFooterCommandsBar();
                continue;
            }

            widget.createFooterCommandsBar();
        }
    };

    return {
        init: function () {
            // atualização inicial
            adjustCommandsBarForAllWidgets(false);
            adjustGroupCommandsFooter();

            // assinando o resize para atualizar qdo a tela mudar de tamanho
            $(window).resize(function () {
                adjustCommandsBarForAllWidgets(false);
            });

            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                createFooterCommandsBar(self.document);
                adjustCommandsBarForAllWidgets(false);
            });

            createFooterCommandsBar(self.document);
        },

        displayFooterCommandsBar: function (rootDocument) {
            createFooterCommandsBar(rootDocument);
        }
    };

}();

Benner.WidgetCommandsBar.openModal = function () {
    $("iframe").contents().keydown(function (e) {
        if (e.keyCode == 27) { // esc

            //ignorar esc em campo lookup e busca modal de lookup
            if ($(e.target).hasClass("select2-search__field")) {
                e.stopPropagation();
                return;
            }

            Benner.ModalPage.hide();
        }
    });
}

Benner.WidgetCommandsBar.prepareModal = function (modalUrl, lazyPostId, sizeModal) {
    $('body').data('lazy-post-id', lazyPostId);

    //Antes de abrir o modal valida se tem alterações não salvas
    if ($('#float-action-buttons').length > 0) {
        if (!confirm("Você possui alterações visuais que ainda não foram persistidas. Deseja sair da página e perder essas alterações?")) {
            return false;
        }
    }
    
    if (sizeModal == undefined || sizeModal == '')
        sizeModal = "large";

    Benner.ModalPage.show(
        {
            id: 'ModalCommand',
            url: modalUrl,
            size: sizeModal.toLowerCase(),
            displayFooter: false,
            displayTitle: false,
            // ocupar 90% da altura, menos a altura do footer do modal
            height: parseInt($(window).height() * 0.9) - 70
        }, Benner.WidgetCommandsBar.openModal, Benner.WidgetCommandsBar.disposeModal);
    //Limpa variavel para não realizar ser apresentada a confirmação de alterações não salvas.
    window.onbeforeunload = null
};

Benner.WidgetCommandsBar.disposeModal = function () {

    Benner.ModalPage.hide();

    var controlId = $('body').data('lazy-post-id');
    $('body').data('lazy-post-id', '');

    //Faz um refresh no widget que disparou o modal
    if (controlId != undefined && controlId != '')
        __doPostBack(controlId, 'refresh');
    else //quando não tem widget para atualizar faz uma verifica se foi disparado algum processo async
        Benner.AsyncProcesses.initAjax();

    return false;
};

Benner.WidgetCommandsBar.adjustCommandsGroup = function ($commandsGroup) {

    if ($commandsGroup.hasClass("dropdown-submenu")) {
        let $commands = $commandsGroup.children("ul").children();
        $commands.each(function () {

            this.id = this.firstChild.id.replace('top-', 'nested-');
            Benner.WidgetCommandsBar.adjustCommandsGroup($(this));
        });
    }
}