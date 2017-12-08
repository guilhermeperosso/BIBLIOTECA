<%@ Page Title="Editar atributos do widget" Language="C#" AutoEventWireup="true" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WidgetAttributesPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <wesWidget:AjaxForm runat="server" ID="PageWidgetForm" Title="Widget" CanInsert="false" HideDeveloperCommands="true" EntityViewName="W_PAGINAWIDGETS.SIMPLE.FORM" />
        <wesWidget:AjaxForm runat="server" ShowTitle="false" UserDefinedCommandsVisible="false" HideDeveloperCommands="true" Title="Atributos" ID="AttributesForm" />
    </div>
    <script src="../content/js/ace/ace.js"></script>
    <script src="../content/js/ace/mode-xml.js"></script>
    <script src="../content/js/ace/mode-json.js"></script>
    <script src="../content/js/ace/ext-language_tools.js"></script>
    <script src="../content/js/SourceEditor.js"></script>
</asp:Content>

