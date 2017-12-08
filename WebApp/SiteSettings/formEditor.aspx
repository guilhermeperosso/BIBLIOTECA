<%@ Page Title="Editor de visão de formulário" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.FormEditorPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components.WebControls" TagPrefix="wes" %>
<%@ Register Src="~/uc/FormFieldProperties.ascx" TagName="FormFieldProperties" TagPrefix="wesUserControl" %>
<%@ Register Src="~/uc/FormProperties.ascx" TagName="FormProperties" TagPrefix="wesUserControl" %>
<%@ Register Src="~/uc/EntityFieldList.ascx" TagName="EntityFieldList" TagPrefix="wesUserControl" %>
<%@ Register Src="~/uc/FormLayout.ascx" TagName="FormLayout" TagPrefix="wesUserControl" %>
<%@ Register Src="~/uc/PageProperties.ascx" TagName="PageProperties" TagPrefix="wesUserControl" %>
<%@ Register Src="~/uc/SectionProperties.ascx" TagName="SectionProperties" TagPrefix="wesUserControl" %>
<%@ Register Src="~/uc/EntityViewHeader.ascx" TagName="EntityViewHeader" TagPrefix="wesUserControl" %>
<%@ Register Src="~/uc/LookupResultFieldList.ascx" TagName="LookupResultFieldList" TagPrefix="wesUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="portlet light">
                <div class="portlet-title">
                    <div class="caption">
                        <span class="caption-subject font-green-sharp bold uppercase">Editor de Formulário</span>
                    </div>
                    <div class="actions">
                        <div class="btn-group">
                            <a href="http://wiki.benner.com.br/wiki/index.php?title=Categoria%3AVis%C3%B5es_-_WES" class="no-border btn btn-circle btn-default btn-sm" target="_blank">
                                <i class="fa fa-question-circle"></i>
                            </a>
                        </div>
                        <wes:WidgetActionsMenu ID="developerMenu" runat="server" />
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-actions nobg no-border commands-bar fluid">
                        <asp:LinkButton ID="lnkBtnSave" CssClass="btn blue command-action predef-action" runat="server"><i class="fa fa-check btn-action"></i>Salvar</asp:LinkButton>
                        <asp:LinkButton ID="lnkBtnShowXml" CssClass="btn default command-action predef-action" runat="server"><i class="fa fa-code btn-action"></i>Ver XML</asp:LinkButton>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:UpdatePanel ID="messageUpdatePanel" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <wes:MessagePanel ID="messagePanel" runat="server"></wes:MessagePanel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9">
                            <wesUserControl:FormLayout ID="formLayout1" runat="server" />
                        </div>
                        <div class="col-md-3">
                            <wesUserControl:SectionProperties ID="sectionProperties" runat="server" />
                            <wesUserControl:FormFieldProperties ID="formFieldProperties" runat="server" EnableViewState="true" />
                            <wesUserControl:PageProperties ID="pageProperties" runat="server" />
                            <wesUserControl:FormProperties ID="formProperties" runat="server" EnableViewState="true" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="listFields" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <wesUserControl:EntityFieldList ID="fieldList" Title="Campos" EnableViewState="true" runat="server" />
                    </div>
                </div>
            </div>
            <div class="modal fade" id="lookupResultFields" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <wesUserControl:LookupResultFieldList ID="lookupResultFieldList" Title="Campos de resultado" EnableViewState="true" runat="server" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        $(document).ready(function () {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (!prm.get_isInAsyncPostBack()) {
                prm.add_endRequest(applyBorderSelect);
            }
        });

        function applyBorderSelect(sender, args) {
            
            if ($(".portlet-tab").length > 0) {
                $("#tabContainer .active").addClass("active-tab");
            }
            
            $(".form-section.selected").parent().addClass("group-selected");
        }
    </script>
</asp:Content>

