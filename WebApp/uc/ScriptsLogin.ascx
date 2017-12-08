<%@ Control Language="C#" AutoEventWireup="true" Inherits="Benner.Tecnologia.Wes.Components.WebApp.ScriptsLogin" %>

<script src="<%= ResolveVersionUrl("~/content/assets/global/plugins/jquery.min.js")%>" type="text/javascript"></script>
<script src="<%= ResolveVersionUrl("~/content/assets/global/plugins/bootstrap/js/bootstrap.min.js")%>" type="text/javascript"></script>
<script src="<%= ResolveVersionUrl("~/content/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js")%>" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%= ResolveVersionUrl("~/content/assets/global/plugins/jquery-validation/js/jquery.validate.min.js")%>" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%= ResolveVersionUrl("~/content/assets/global/scripts/app.js")%>" type="text/javascript"></script>
<script src="<%= ResolveVersionUrl("~/content/assets/layouts/layout/scripts/layout.js")%>" type="text/javascript"></script>
<script src="<%= ResolveVersionUrl("~/content/js/Login.js")%>" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    
    jQuery(document).ready(function () {
        App.init();// Inicializa o metronic para ajustar seus componentes
        Layout.init();// Inicializa o layout
        Login.init();// Inicializa validações da tela de login

        var userName = $("#UserName");
        if ($(userName).length > 0)
            $(userName).focus();
    });
</script>
