<%@ Page Title="Conteúdo serializado em formato XML" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.ShowXmlPage" %>

<%@ Register Src="~/uc/SourceEditor.ascx" TagName="SourceEditor" TagPrefix="wesUserControl" %>
<%@ Register Src="~/uc/EntityViewHeader.ascx" TagName="EntityViewHeader" TagPrefix="wesUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script src="../Content/js/AceEditor.js"></script>

    <wesUserControl:EntityViewHeader ID="entityViewHeader" runat="server" />
    <h4 class="fixedWebPartTitle">Conteúdo serializado em formato XML</h4>
    <wesUserControl:SourceEditor runat="server" ID="sourceEditor" />
</asp:Content>
