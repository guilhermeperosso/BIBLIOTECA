﻿Benner.AutoComplete = function () {

    function GetValueProvider() {
        var valueProvider = "";
        var inputsProvider = document.querySelectorAll(".autocomplete-source-view");

        if (inputProvider !== null) {
            var inputProvider = null;
            if (inputsProvider.length > 1) {
                for (var i = 0; i < inputsProvider.length; i++) {
                    if (inputsProvider[i].className.indexOf("tt-input") !== -1) {
                        inputProvider = inputsProvider[i];
                        break;
                    }
                }
            } else {
                inputProvider = inputsProvider[0]
            }

            if (inputProvider !== null) {
                if (inputProvider.nodeName === "SELECT" && inputProvider.selectedIndex !== -1) {
                    valueProvider = inputProvider.options[0].text;
                } else if (inputProvider.nodeName === "INPUT" && inputProvider.value !== "") {
                    valueProvider = inputProvider.value;
                } else {
                    console.log("Problema ao recuperar valor do provedor");
                }
            }
        }
        
        return valueProvider;
    }

    var datasetViews = function () {
        
        var views = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.whitespace,
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            prefetch: Benner.Page.getApplicationPath() + 'api/views',
            remote: {
                url: Benner.Page.getApplicationPath() + 'api/views?filter%FILTER',
                wildcard: '%FILTER'
            }
        });

        views.initialize();

        function getWithSuggestions(query, sync, async) {
            if (query === '') {
                sync(views.all());
            } else {
                views.search(query, sync, async);
            }
        }

        var datasetView = {
            name: 'views',
            source: getWithSuggestions
        };

        return datasetView;
    };

    var datasetViewsLookup = function () {

        var viewsLookup = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.whitespace,
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            prefetch: Benner.Page.getApplicationPath() + 'api/views/lookup',
            remote: {
                url: Benner.Page.getApplicationPath() + 'api/views/lookup?filter=%FILTER',
                wildcard: '%FILTER'
            }
        });

        viewsLookup.initialize();

        function getWithSuggestions(query, sync, async) {
            if (query === '') {
                sync(viewsLookup.all());
            } else {
                viewsLookup.search(query, sync, async);
            }
        }

        var datasetViewLookup = {
            name: 'viewsLookup',
            source: getWithSuggestions
        };

        return datasetViewLookup;
    };

    var datasetFields = function () {

        var entityView = GetValueProvider();
        if (entityView !== "") {

            var fieldsView = new Bloodhound({
                datumTokenizer: Bloodhound.tokenizers.whitespace,
                queryTokenizer: Bloodhound.tokenizers.whitespace,
                identify: function (obj) { return obj.Name; },
                prefetch: Benner.Page.getApplicationPath() + 'api/views/' + entityView + '/fields',
                remote: {
                    url: Benner.Page.getApplicationPath() + 'api/views/' + entityView + '/fields/%FILTER',
                    wildcard: '%FILTER'
                }
            });

            fieldsView.initialize();

            function getWithSuggestions(query, sync, async) {
                if (query === '') {
                    sync(fieldsView.all());
                } else {
                    fieldsView.search(query, sync, async);
                }
            }

            var datasetField = {
                name: 'fieldsView',
                displayKey: 'Name',
                source: getWithSuggestions,
                templates: {
                    header: '<h5>Campos da visão</h5>'
                }
            };

            return datasetField;
        } else {
            console.log("Não encontrado 'autocomplete-field-origin' no HTML");
            return null;
        }
    };

    var datasetCommands = function () {

        var entityView = GetValueProvider();
        if (entityView !== "") {

            var commandsView = new Bloodhound({
                datumTokenizer: Bloodhound.tokenizers.whitespace,
                queryTokenizer: Bloodhound.tokenizers.whitespace,
                identify: function (obj) { return obj.Name; },
                prefetch: Benner.Page.getApplicationPath() + 'api/views/' + entityView + '/commands',
                remote: {
                    url: Benner.Page.getApplicationPath() + 'api/views/' + entityView + '/commands/%FILTER',
                    wildcard: '%FILTER'
                }
            });

            commandsView.initialize();

            function getWithSuggestions(query, sync, async) {
                if (query === '') {
                    sync(commandsView.all());
                } else {
                    commandsView.search(query, sync, async);
                }
            }

            var datasetCommand = {
                name: 'commandsView',
                displayKey: 'Name',
                source: getWithSuggestions,
                templates: {
                    header: '<h5>Comandos da visão</h5>'
                }
            };

            return datasetCommand;
        } else {
            console.log("Não encontrado 'autocomplete-field-origin' no HTML");
            return null;
        }
    };

    var datasetCustomCommands = function () {

        var entityView = GetValueProvider();
        if (entityView !== "") {

            var commandsView = new Bloodhound({
                datumTokenizer: Bloodhound.tokenizers.whitespace,
                queryTokenizer: Bloodhound.tokenizers.whitespace,
                identify: function (obj) { return obj.Name; },
                prefetch: Benner.Page.getApplicationPath() + 'api/views/' + entityView + '/customcommands',
                remote: {
                    url: Benner.Page.getApplicationPath() + 'api/views/' + entityView + '/customcommands/%FILTER',
                    wildcard: '%FILTER'
                }
            });

            commandsView.initialize();

            function getWithSuggestions(query, sync, async) {
                if (query === '') {
                    sync(commandsView.all());
                } else {
                    commandsView.search(query, sync, async);
                }
            }

            var datasetCustomCommands = {
                name: 'commandsView',
                displayKey: 'Name',
                source: getWithSuggestions,
                templates: {
                    header: '<h5>Comandos da visão</h5>'
                }
            };

            return datasetCustomCommands;
        } else {
            console.log("Não encontrado 'autocomplete-field-origin' no HTML");
            return null;
        }
    };


    var datasetPages = function () {
        var pages = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.whitespace,
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            prefetch: Benner.Page.getApplicationPath() + 'api/pages',
            remote: {
                url: Benner.Page.getApplicationPath() + 'api/pages?filter=%FILTER',
                wildcard: '%FILTER'
            }
        });

        pages.initialize();

        function getWithSuggestions(query, sync, async) {
            if (query === '') {
                sync(pages.all());
            } else {
                pages.search(query, sync, async);
            }
        }

        var datasetPage = {
            name: 'pages',
            source: getWithSuggestions
        };

        return datasetPage;
    };

    var datasetPageSpecializeds = function () {
        var pageSpecialized = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.whitespace,
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            prefetch: Benner.Page.getApplicationPath() + 'api/pages/specialized',
            remote: {
                url: Benner.Page.getApplicationPath() + 'api/pages/specialized?filter=%FILTER',
                wildcard: '%FILTER'
            }
        });

        pageSpecialized.initialize();

        function getWithSuggestions(query, sync, async) {
            if (query === '') {
                sync(pageSpecialized.all());
            } else {
                pageSpecialized.search(query, sync, async);
            }
        }

        var datasetPageSpecialized = {
            name: 'pageSpecialized',
            source: getWithSuggestions
        };

        return datasetPageSpecialized;
    };

    var datasetColors = function () {
        var colorMetronic = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.whitespace,
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            prefetch: Benner.Page.getApplicationPath() + 'api/Color/prefetch',
            remote: {
                url: Benner.Page.getApplicationPath() + 'api/Color?filter=%FILTER',
                wildcard: '%FILTER'
            }
        });

        colorMetronic.initialize();

        function getWithSuggestions(query, sync, async) {
            if (query === '') {
                sync(colorMetronic.all());
            } else {
                colorMetronic.search(query, sync, async);
            }
        }

        var datasetColor = {
            name: 'colors',
            source: getWithSuggestions,
            templates: {
                suggestion: function (item) {
                    return '<div><span class="bg-' + item + ' autocomplete-color">&nbsp;</span><span>' + item + '</span></div>';
                }
            }
        };

        return datasetColor;
    };

    var datasetFontIcons = function () {
        var fontIconMetronic = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.whitespace,
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            prefetch: Benner.Page.getApplicationPath() + 'api/FontIcons/prefetch',
            remote: {
                url: Benner.Page.getApplicationPath() + 'api/FontIcons?filter=%FILTER',
                wildcard: '%FILTER'
            }
        });

        fontIconMetronic.initialize();

        function getWithSuggestions(query, sync, async) {
            if (query === '') {
                sync(fontIconMetronic.all());
            } else {
                fontIconMetronic.search(query, sync, async);
            }
        }

        var datasetFontIcon = {
            name: 'fontIcons',
            source: getWithSuggestions,
            templates: {
                suggestion: function (item) {
                    return "<div><i class='" + item + "' /> " + item + "</div>";
                }
            }
        };

        return datasetFontIcon;
    };

    return {

        init: function () {
            var listTypeahead = document.querySelectorAll(".autocomplete");
            if (listTypeahead.length === 0)
                return;

            for (var i = 0; i < listTypeahead.length; i++) {

                var typeahead = listTypeahead[i];
                var classNames = typeahead.className;
                var arrayDatasets = new Array();

                if (classNames.indexOf("autocomplete-color") !== -1) {
                    var datasetColor = datasetColors();
                    arrayDatasets.push(datasetColor);
                }

                if (classNames.indexOf("autocomplete-fonticon") !== -1) {
                    var datasetFontIcon = datasetFontIcons();
                    arrayDatasets.push(datasetFontIcon);
                }

                if (classNames.indexOf("autocomplete-views") !== -1) {
                    var datasetView = datasetViews();
                    arrayDatasets.push(datasetView);
                }

                if (classNames.indexOf("autocomplete-lookup-views") !== -1) {
                    var datasetViewLookup = datasetViewsLookup();
                    arrayDatasets.push(datasetViewLookup);
                }

                if (classNames.indexOf("autocomplete-fields") !== -1) {
                    var datasetField = datasetFields();
                    if (datasetField !== null) {
                        //Limpa o template de cabeçalho padrão
                        if (arrayDatasets.length === 0)
                            datasetField.templates.header = "";

                        arrayDatasets.push(datasetField);
                    }
                }

                if (classNames.indexOf("autocomplete-commands") !== -1) {
                    var datasetCommand = datasetCommands();
                    if (datasetCommand !== null) {
                        //Limpa o template de cabeçalho padrão
                        if (arrayDatasets.length === 0)
                            datasetCommand.templates.header = "";

                        arrayDatasets.push(datasetCommand);
                    }
                }

                if (classNames.indexOf("autocomplete-customcommands") !== -1) {
                    var datasetCommand = datasetCustomCommands();
                    if (datasetCommand !== null) {
                        //Limpa o template de cabeçalho padrão
                        if (arrayDatasets.length === 0)
                            datasetCommand.templates.header = "";

                        arrayDatasets.push(datasetCommand);
                    }
                }

                if (classNames.indexOf("autocomplete-pages") !== -1) {
                    var datasetPage = datasetPages();
                    arrayDatasets.push(datasetPage);
                }

                if (classNames.indexOf("autocomplete-specialized-pages") !== -1) {
                    var datasetPageSpecialized = datasetPageSpecializeds();
                    arrayDatasets.push(datasetPageSpecialized);
                }

                $(typeahead).typeahead("destroy");
                $(typeahead).typeahead({ hint: false, highlight: true, minLength: 0, }, arrayDatasets)
                    .bind('typeahead:change', function (ev) {
                        if (ev.currentTarget.onchange != null) {
                            $(this).unbind('typeahead:change');
                            ev.currentTarget.onchange();
                        }
                    });
            }
           
        }
    }
}();