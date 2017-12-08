Benner.AmChartsWidget = function () {
    var charts = [];

    function verifyDataLoaderLength(url, chartVariable, id) {
        $.getJSON({
            'dataType': 'json',
            'url': url
        })
        .done(function (JSON) {
            if (JSON == null || Object.keys(JSON).length == 0)
                setEmptyDataOrFailMessage(chartVariable, id, 'O gráfico não contém dados a serem exibidos');
            else if(JSON.error != undefined)
                setEmptyDataOrFailMessage(chartVariable, id, JSON.error);
            else
                setData(chartVariable, JSON);

            chartVariable.path = Benner.Page.getApplicationPath() + 'content/assets/amcharts';

        })
        .fail(function (jqxhr, textStatus, error) {
            setEmptyDataOrFailMessage(chartVariable, id, jqxhr.responseJSON);
        });
        // redraw it
        chartVariable.validateNow();
    }

    function setEmptyDataOrFailMessage(chart, chartDiv, message) {
        chart.addLabel(0, '50%', message, 'center', 12);
        chart.chartDiv.style.opacity = 0.7;
        chart.legend.enabled = false
    }

    function setData(chart, data) {
        chart.dataProvider = data;
        chart.validateData();
    }

    return {
        init: function (id, objDefinition, url, uniqueId) {
            if (_.find(charts, function (chart) { return chart.id == id }) == undefined) {
                var widgetId = $('#' + id).closest('.widget').attr('id');
                charts.push({ 'id': widgetId, 'definition': JSON.stringify(objDefinition, null, '\t') });
            }

            var backgroundColor = '#FFF'
            if (objDefinition.theme) {
                if (objDefinition.theme == 'chalk' || objDefinition.theme == 'dark') {
                    backgroundColor = '#282828';
                } else if (objDefinition.theme == 'black') {
                    backgroundColor = '#222222';
                }
            }

            $('#' + id).css('background-color', backgroundColor);

            objDefinition.startDuration = 0.2;

            var chartVariable = AmCharts.makeChart(id, objDefinition);
            verifyDataLoaderLength(url, chartVariable, id);

            var handleClick = function (data) {
                var entity = null;
                if (data.item)
                    entity = data.item.dataContext;
                else
                    entity = data.dataItem.dataContext;

                var alpha = entity["fill_alpha_field"]

                _.forEach(data.chart.dataProvider, function (item) {
                    delete item["fill_alpha_field"];
                });

                if (!alpha || alpha == 1)
                    entity["fill_alpha_field"] = 0.5;
                else {
                    entity["fill_alpha_field"] = 1;
                    entity = null
                }

                if (data.chart.type != "pie")
                    data.chart.validateData();

                __doPostBack(uniqueId, JSON.stringify(entity));
            };

            chartVariable.addListener("clickGraphItem", handleClick);
            chartVariable.addListener("clickSlice", handleClick);
        },

        getChart: function (id) {
            var chart = _.find(charts, function (chart) { return chart.id == id })
            if (chart != null)
                return JSON.parse(chart.definition);
            else
                return null;
        }
    }
}();
