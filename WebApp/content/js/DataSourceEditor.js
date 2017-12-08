var Lookup = 6;
var textoPadraoSelecao = "Selecione...";
var tables = [];
var fields = [];
var temporarySelectedFields = [];
var lookupFieldLevel = 0;
var aceEditor;

var success = "success";
var error = "danger";

var dataSource = {
    'Handle': 0,
    'Identifier': '',
    'Name': '',
    'Descritpion': '',
	'FromTable': {
		'Alias': 'A',
		'Name': ''
	},
	'FromSql': {
	    'Alias': 'A',
        'SelectCommand': ''
	},
	'Fields': [

	],
    'Filter': ''
};

var repository = new Repository();

function loadTables(targetSelect){
	var tables = repository.getTables();

	let tablesResult = [];

	tablesResult.push({
	    id: 0,
	    text: textoPadraoSelecao
	});

	for (var i = 0; i < tables.length; i++) {
	    var table = tables[i];
	    tablesResult.push({
	        id: table.Handle,
	        text: table.Name
	    });
	}

	$(targetSelect).select2({
        data: tablesResult
	});
}

function loadFieldsFromTable(table, targetSelect){
	var fields = repository.getFieldsFromTable(table);

	let fieldsResult = [];

	fieldsResult.push({
	    id: 0,
	    text: textoPadraoSelecao
	});

	if (fields != undefined) {
	    for (var i = 0; i < fields.length; i++) {
	        var field = fields[i];
	        fieldsResult.push({
	            id: field.Handle,
	            table: field.SearchTable,
	            tableName: field.TableName,
	            fieldClass: field.FieldClass,
	            text: field.Name
	        });
	    }
	}

	$(targetSelect).select2().empty();
	$(targetSelect).select2({
	    data: fieldsResult
	});
}

function loadLookupFields(sourceField, lookupTable){
	var newFieldId = new Date().getTime()+'c';
	var newSelectId = new Date().getTime()+'s';

	var newFieldHtml = '<div class="col-md-3 campo" id="' + newFieldId + '"><div class="form-group"><label class="control-label">&nbsp;</label>';
	newFieldHtml += '<select class="form-control select2me" data-lookuplevel='+(lookupFieldLevel + 1)+' data-placeholder="Selecione..." id="' + newSelectId + '"></select>';
	newFieldHtml += '</div/></div>';

    $(sourceField).attr('class', 'col-md-3 campo').after(newFieldHtml);
    $('.select2me', sourceField).attr('data-lookuplevel', lookupFieldLevel);

	loadFieldsFromTable(lookupTable, $('#'+newSelectId));

    // O select2 não está atualizando a largura do container ao trocar classe de divs externas a ele
	$('.select2-container', $('#fieldsDiv')).css('width', '100%');
	$('#' + newSelectId).on('change', function () {
		selectedFieldFromSelect($(this));
	});
    
	lookupFieldLevel = $('.select2me', sourceField).data('lookuplevel') + 1;

	$('#' + newSelectId).select2('open');
}

function addTemporaryField(sourceSelect){
	var temporaryField = {
	    'table': getPropertyFromOption('tableName', sourceSelect),
		'name' : getTextFromSelect(sourceSelect),
		'fieldClass' : getPropertyFromOption('fieldClass', sourceSelect),
		'isTableField': true,
		'lookuplevel': sourceSelect.data('lookuplevel')
	};

	let filteredFields = _.filter(temporarySelectedFields, function (f) { return f.lookuplevel < temporaryField.lookuplevel; });
	temporarySelectedFields = filteredFields;

	temporarySelectedFields.push(temporaryField);
}
function selectedFieldFromSelect(sourceSelect){
    if (sourceSelect.select2('data')[0].text != textoPadraoSelecao) {
        addTemporaryField(sourceSelect);

        var field = getFieldFromTemporaryFields();
        if (field.FieldClass != Lookup) {
            addSelectedField(field, true);
            dataSource.Fields.push(field);
            if (lookupFieldLevel > 0) {
                let lookupLevelSourceSelect = sourceSelect.data('lookuplevel');
                if (lookupLevelSourceSelect < lookupFieldLevel) {
                    for (var i = lookupLevelSourceSelect; i < lookupFieldLevel; i++) {
                        $('[data-lookuplevel=' + (i + 1) + ']').parent().parent().remove();
                    }
                }
                lookupFieldLevel = lookupLevelSourceSelect;
                if (lookupFieldLevel == 0) {
                    $('#fieldsDiv').attr('class', 'col-md-12 campo');
                }
            }
        } else if (field.FieldClass == Lookup) {
            var sourceField = $(sourceSelect).closest('div.campo');
            loadLookupFields(sourceField, getPropertyFromOption('table', sourceSelect));
        }
    }
}

function getFieldPathFromTemporaryFields(){
	var path = '';

	for (var i = 0; i < temporarySelectedFields.length; i++) {
		var temporaryField = temporarySelectedFields[i];

		if(temporaryField.table == getTextFromSelect($('#tabelas')))
			path += temporaryField.name;
		else
			path += temporaryField.table + '.' + temporaryField.name;

		if(i != temporarySelectedFields.length - 1)
		    path += '>';
	}	

	return path;
}

function getFieldAliasFromTemporaryFields(){
	if (temporarySelectedFields.length == 1)
		return temporarySelectedFields[0].name;

	return temporarySelectedFields[temporarySelectedFields.length - 1].name + temporarySelectedFields[temporarySelectedFields.length - 2].name;
}

function getFieldClassFromTemporaryFields(){
	if(temporarySelectedFields.length == 1)
		return temporarySelectedFields[0].fieldClass;

	return temporarySelectedFields[temporarySelectedFields.length - 1].fieldClass;
}

function getFieldFromTemporaryFields(){
	var field = {
		'Handle': new Date().getTime(), 
		'Alias': getFieldAliasFromTemporaryFields(), 
		'Path': getFieldPathFromTemporaryFields(), 
		'Description':'', 
		'FieldClass':getFieldClassFromTemporaryFields(),
		'IsTableField' : true
	};

	return field;
}

function addSelectedField(field, canHandleNDelete){
	var fieldId = new Date().getTime();
	if (field.Handle == 0) {
	    field.Handle = fieldId;
	}

	var fieldHtml = '<li class="dd-item dd3-item" data-id="' + field.Handle + '">';
	if (canHandleNDelete) {
	    fieldHtml += '<div class="dd-handle dd3-handle"></div>';
	}
	fieldHtml += '<div class="dd3-content">';
	if (canHandleNDelete) {
	    fieldHtml += '<a class="delete-field btn btn-xs btn-circle red pull-right"><i class="fa fa-minus" style="width: 10px;"></i></a>';
	}
    //fieldHtml += '<div class="fieldPath">' + field.Path + '</div><div class="fieldAlias">' + field.Alias + '</div>';
	fieldHtml += '<div class="fieldPath">' + field.Path + '</div>';
	fieldHtml += '</li>';

	$('#lista-campos-selecionados').append(fieldHtml);
	temporarySelectedFields = [];
}

function setNewDataSourcePageBehavior() {
    $('#lblDataSourceType_table').remove();
    initAceEditor();
}

function getDataSource(dataSourceIdentifier){
    dataSource = repository.getDataSource(dataSourceIdentifier);

    $('#Identificacao').val(dataSource.Identifier);
    $('#Nome').val(dataSource.Name);

    if (dataSource.FromSql != null) {
        $('#lblDataSourceType_table').remove();

        initAceEditor();

        $('#alias').attr('readonly', true);

        for (var i = 0; i < dataSource.Fields.length; i++) {
            var field = dataSource.Fields[i];
            field.Handle = new Date().getTime() + i;
            addSelectedField(field, false);
        }
    } else if (dataSource.FromTable != null) {
        $('#lblDataSourceType_query').remove();
        $('#dataSourceType_table').click();

        toggleActiveRadio('table');

        $('#lblDataSourceType_query').remove();

        var tableHandle = _.findWhere(tables, { Name: dataSource.FromTable.Name }).Handle;
        loadFieldsFromTable(tableHandle, $('#campos'));

        $('#tabelas').val(tableHandle).change();

        for (var i = 0; i < dataSource.Fields.length; i++) {
            var field = dataSource.Fields[i];
            field.Handle = new Date().getTime() + i;
            addSelectedField(field, true);
        }

        $('#campos-selecionados').nestable({
            group: 1,
            dropCallback: function (details) {
                var selectedField = _.findWhere(dataSource.Fields, { Handle: details.sourceId });
                $('#path').val(selectedField.Path);
                $('#alias').val(selectedField.Alias);
            }
        }).on('change', function () {
            var selectedFields = $('#campos-selecionados').nestable('serialize');
            var tempFields = dataSource.Fields;
            for (var i = 0; i < selectedFields.length; i++) {
                var index = _.findIndex(tempFields, { Handle: selectedFields[i].id });

                if (i == index)
                    continue;

                moveArrayElement(tempFields, index, i);
            }
            dataSource.Fields = tempFields;
        });

        $('.fieldPathTitle').css('margin-left', '35px');
        $('.fieldPath').css('margin-left', '30px');

        $('#filter').val(dataSource.Filter);
    }
    if (dataSource.Handle != 0) {
	    $('input[type=radio][name=dataSourceType]').attr('disabled', 'disabled');
	}
}

function initAceEditor() {
    aceEditor = ace.edit("selectCommand");
    aceEditor.setTheme("ace/theme/chrome");
    aceEditor.getSession().setMode("ace/mode/sql");
    aceEditor.setOptions({
        enableBasicAutocompletion: true,
        enableSnippets: true,
        enableLiveAutocompletion: true
    });

    if (dataSource.FromSql != null && dataSource.FromSql.SelectCommand != undefined && dataSource.FromSql.SelectCommand != '') {
        aceEditor.setValue(dataSource.FromSql.SelectCommand);
    }

    $('#selectCommand').keyup(function (e) {
        if (e.keyCode == 27) // esc
            e.stopPropagation();
    });
}

function clearFields(all) {
    $('#datasources-content .custom-alerts').remove();
    $('#lista-campos-selecionados').html('');
    dataSource.Fields = [];
    if (all) {
        if (dataSource.FromTable != null && dataSource.FromTable.Name != '') {
            $('#tabelas').val(0).change();
        }
        // O select2 estava atribuindo 100px de largura para o container ao voltar de estar escondido
        $('.select2-container').css('width', '100%');
        
        if (aceEditor != undefined) {
            aceEditor.setValue('');
        }
    }
}

function toggleActiveRadio(option) {
    $('.dataSourceType_fields').addClass('hidden');
    $('#' + option + 'Fields').toggleClass('hidden');
    $('#getColumnsDiv').toggleClass('hidden');
    $('#fieldsDiv').toggleClass('hidden');
    $('.select2-container').css('width', '100%');
}

function changeSelectedTable(selectedTable) {
    dataSource.FromTable.Name = selectedTable.text();
    clearFields();
    loadFieldsFromTable($(selectedTable).val(), $('#campos'));
}

function keepPreviousTableSelected() {
    let tableHandle = _.findWhere(tables, { Name: dataSource.FromTable.Name }).Handle;
    $('#tabelas').val(tableHandle).change();
    $('.select2-container').css('width', '100%');
}

function updateDataSourceDefinition(data) {
    dataSource.Handle = data.Handle;
    dataSource.Identifier = data.Identifier;
    $('#Identificacao').val(dataSource.Identifier);
    dataSource.Name = data.Name;
    $('#Nome').val(dataSource.Name);
    //updateBreadCrumb();
    dataSource.Fields = data.Fields;
    $('#lista-campos-selecionados').html('');
    $.each(data.Fields, function (i) {
        addSelectedField(this, data.FromTable != null && data.FromTable.Name != null);
    });
}

function updateBreadCrumb() {
    $('li:last', $('.page-breadcrumb'))[0].childNodes[0].text = dataSource.Name;
}

function showMessage(type, message) {
    App.alert({
        type: type,
        message: message,
        container: $('#datasources-content'),
        place: 'prepend'
    });
    Benner.Control.restoreFocus();
}

$(function(){
	//loadTables($('#tabelas'));
	
	$('input[type=radio][name=dataSourceType]').on('change', function () {
	    if (dataSource.Handle == 0) {
	        clearFields('all');
	    }
	    //let radio = this;
	    //toggleActiveRadio(radio.value);
	});

	$('#tabelas').on('change', function(){
		let selectedTable = $('option:selected', this);
		if (dataSource.FromTable.Name != selectedTable.text() && dataSource.Fields.length > 0) {
		    dialog = Benner.ModalMessage.confirm("Aten&ccedil;&atilde;o!",
                "Trocar a tabela resulta na exclus&atilde;o dos campos previamente adicionados. Deseja prosseguir?",
                function () { changeSelectedTable(selectedTable); },
                function () { keepPreviousTableSelected(); });
		    dialog.on('shown.bs.modal', function () {
		        dialog.find('.default:first').focus();
		    });
		} else if (dataSource.Handle == 0) {
		    loadFieldsFromTable($(selectedTable).val(), $('#campos'));
		    dataSource.FromTable.Name = selectedTable.text();
        }
	});

	$('#campos').on('change', function(){
	    selectedFieldFromSelect($(this));
	});

	$('#obter-colunas').on('click', function () {
	    clearFields();
	    dataSource.FromSql.SelectCommand = aceEditor.getValue();
	    var result = repository.getFieldsFromQuery(dataSource.FromSql.SelectCommand);
	    if (result.status != null && result.status >= 400 && result.responseJSON.ExceptionMessage)
	    {
	        showMessage('warning', result.responseJSON.ExceptionMessage);
	        return;
	    }
	    $.each(fields, function (i) {
	        dataSource.Fields.push(this);
	        addSelectedField(this, false);
	    });
	});

	$('#Identificacao').on('focusout', function () {
	    dataSource.Identifier = $('#Identificacao').val();
	});

	$('#Nome').on('focusout', function () {
	    dataSource.Name = $('#Nome').val();
	});

	$('#salvar').on('click', function () {
		dataSource.Identifier = $('#Identificacao').val();
	    dataSource.Name = $('#Nome').val();
	    dataSource.Filter = $('#filter').val();
	    if (dataSource.FromSql != null) {
	        dataSource.FromSql.SelectCommand = aceEditor.getValue();
	    }

	    let dataSourceRequest = {
	        DataSource: dataSource,
	        PageWidget: $('#PageWidget').val()
	    };

	    if (dataSource.Handle == 0) {
	        let data = repository.create(dataSourceRequest);
	        if (data.status != null && data.status >= 400 && data.responseJSON) {
	            showMessage('danger', data.responseJSON);
	        }
            else if (data != null && data.DataSource != null) {
                updateDataSourceDefinition(data.DataSource);
                showMessage('success', "Cria&ccedil;&atilde;o da consulta realizada com sucesso!");
                $('#Identificacao').disabled = true;
            } else {
                showMessage('danger', "Erro na cria&ccedil;&atilde;o da consulta.");
            }
	    } else {
	        let data = repository.save(dataSourceRequest);
	        if (data != null && data.DataSource != null) {
	            updateDataSourceDefinition(data.DataSource);
	            showMessage("success", "Atualiza&ccedil;&atilde;o da consulta realizada com sucesso!");
	        } else {
	            showMessage("danger", "Erro na atualiza&ccedil;&atilde;o da consulta: <br>" + data.Error);
	        }
	    }
	});

	$('.dd-item').live('click', function () {
	    let id = this.dataset.id;
	    let field = _.find(dataSource.Fields, function (i) { return i.Handle == id; });
	    $('#path').val(field.Path);
	    $('#alias').val(field.Alias);
	    $('#alias')[0].dataset.fieldid = id;
	});
	$('#alias').on('change', function () {
	    let id = this.dataset.fieldid;
	    let field = _.find(dataSource.Fields, function (i) { return i.Handle == id; });
	    field.Alias = this.value;
	});
	$("#alias").on({
	    keydown: function (e) {
	        if (e.which === 32)
	            return false;
	    },
	    change: function () {
	        this.value = this.value.replace(/\s/g, "");
	    }
	});

    
    $('.delete-field').live('click', function(){
    	
    	var fieldHandle = parseInt($(this).closest('li.dd-item').attr('data-id'));
    	var fieldIndex = _.findIndex(dataSource.Fields, { Handle: fieldHandle });

    	$(this).closest('li.dd-item').remove();
    	dataSource.Fields.splice(fieldIndex, 1);

    	return false;

    });
    
});