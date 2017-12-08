var Repository = function () {

    this.getDataSource = function (dataSourceIdentifier) {
        var dataSource;
        var url = Benner.Page.getApplicationPath() + 'api/datasource/' + dataSourceIdentifier;

        $.ajax({
            async: false,
            url: url
        }).done(function (data) {
            dataSource = data;
        });

        return dataSource;
    }

    this.getTables = function () {
        var url = Benner.Page.getApplicationPath() + 'api/datasource/tables';

        $.ajax({
            async: false,
            url: url
        }).done(function (data) {
            tables = data;
        });

        return tables;
    };

    this.getFieldsFromTable = function (table) {
        var fields;
        var url = Benner.Page.getApplicationPath() + 'api/datasource/tables/' + table + '/fields';

		$.ajax({
			async: false,
			url: url
		}).done(function(data){
			fields = data;
		});

        return fields;
    };

    this.create = function (request) {
        let url = Benner.Page.getApplicationPath() + 'api/datasource';
        let result;
        $.ajax({
            async: false,
            url: url,
            type: 'POST',
            dataType: 'json',
            data: request,
            success: function (data) {
                result = data;
            },
            error: function (error) {
                result = error;
            }
        });
        return result;
    }

    this.save = function (request) {
        let url = Benner.Page.getApplicationPath() + 'api/datasource';
        let result = {
            DataSource: null,
            ReturnUrl: '',
            Error: ''
        };
        $.ajax({
            async: false,
            url: url,
            type: 'PUT',
            dataType: 'json',
            data: request,
            success: function (data) {
                result.ReturnUrl = data.ReturnUrl;
            },
            error: function (error) {
                result.Error = error.responseJSON;
            }
        });
        if(result.ReturnUrl !== '')
            result.DataSource = this.getDataSource(request.DataSource.Identifier);
        return result;
    };

    this.preview = function (dataSource) {
        var preview;

        $.ajax({
            async: false,
            url: Benner.Page.getApplicationPath() + 'api/datasource/preview',
            type: 'PUT',
            dataType: 'json',
            data: dataSource,
            success: function (data) {
                preview = data;
            }
        });

        return preview;
    };

    this.getFieldsFromQuery = function (selectCommand) {
        var url = Benner.Page.getApplicationPath() + 'api/datasource/fields/query/';

        $.ajax({
            async: false,
            url: url,
            dataType: 'json',
            type: 'POST',
            data: { 'selectCommand': selectCommand },
            success: function (data) {
                fields = data;
            },
            error: function (error) {
                fields = error;
            }
        });

        return fields;
    };

};