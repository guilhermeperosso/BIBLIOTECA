function moveArrayElement(array, oldIndex, newIndex) {
    if (newIndex >= array.length) {
        var i = newIndex - this.length;
        while ((i--) + 1) {
            array.push(undefinied);
        }
    }

    array.splice(newIndex, 0, array.splice(oldIndex, 1)[0]);
}

function getTextFromSelect(targetSelect){
	return $('option:selected', targetSelect).text();
}

function getAttributeFromOption(attributeName, targetOption){
	return $('option:selected', targetOption).attr(attributeName);
}

function getPropertyFromOption(propertyName, targetOption) {
    return $(targetOption).select2('data')[0][propertyName];
}

function isRunningOnElectron(){
	return window.location.href.indexOf('host=electron') > 0;
}

function getQueryStringParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}