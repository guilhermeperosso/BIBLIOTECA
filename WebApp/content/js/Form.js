Benner.Form = function() {
    this.name;
    this.formViewMode;
    this.providerWidget;
};

// Armazena os formulários que a página contem
Benner.Form.items = new Array();

Benner.Form.add = function(controlId, formViewMode, providerWidgetId) {

    if (Benner.Form.existForm(controlId))
        return;

    var objForm = new Benner.Form();
    objForm.name = controlId;
    objForm.formViewMode = formViewMode;
    objForm.providerWidget = providerWidgetId;

    Benner.Form.items[Benner.Form.items.length] = objForm;
};


Benner.Form.updateViewMode = function(controlId, formViewMode) {
    for (var i = 0; i < Benner.Form.items.length; i++) {
        var objForm = Benner.Form.items[i];
        if (controlId == objForm.name)
            objForm.formViewMode = formViewMode;
    }
};

Benner.Form.getViewMode = function(controlId) {
    for (var i = 0; i < Benner.Form.items.length; i++) {
        var objForm = Benner.Form.items[i];
        if (objForm.name.indexOf(controlId) > -1)
            return objForm.formViewMode;
    }

    return 'Formulário não encontrado';
};

Benner.Form.existForm = function(name) {
    for (var i = 0; i < Benner.Form.items.length; i++) {
        var objForm = Benner.Form.items[i];
        if (objForm.name == name) {
            return true;
        }
    }
    return false;
};