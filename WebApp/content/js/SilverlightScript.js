function Silverlight_OnPluginErrorHandler(sender, errorArgs) {
    var errorMsg = "Silverlight Plugin Error: \n\n";
    Silverlight_GeneralErrorHandler(sender, errorArgs, errorMsg);
}

function Silverlight_GeneralErrorHandler(sender, errorArgs, errorMsg) {
    errorMsg += "Error Type:    " + errorArgs.get_error().errorType + "\n";
    errorMsg += "Error Message: " + errorArgs.get_error().errorMessage + "\n";
    errorMsg += "Error Code:    " + errorArgs.get_error().errorCode + "\n";
    alert(errorMsg);
}

function Silverlight_OnPluginSourceDownloadProgressChangedHandler(sender, args) {
    var root = sender.get_element().content;
    var progress = Math.round((args.get_progress() * 100))
    root.findName("ProgressText").Text = progress + "%";
}

function ForceSubmit(controlId, args) {
    __doPostBack(controlId, args);
}