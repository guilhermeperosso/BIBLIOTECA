<%@ Page Title="Editor de visão de grid" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.GridEditorPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components.WebControls" TagPrefix="wes" %>
<%@ Register Src="~/uc/EntityFieldList.ascx" TagName="EntityFieldList" TagPrefix="wesUserControl" %>
<%@ Register Src="~/uc/GridProperties.ascx" TagName="GridProperties" TagPrefix="wesUserControl" %>
<%@ Register Src="~/uc/GridFieldNavigator.ascx" TagName="GridFieldNavigator" TagPrefix="wesUserControl" %>
<%@ Register Src="~/uc/GridFieldProperties.ascx" TagName="GridFieldProperties" TagPrefix="wesUserControl" %>
<%@ Register Src="~/uc/EntityViewHeader.ascx" TagName="EntityViewHeader" TagPrefix="wesUserControl" %>
<%@ Register Src="~/uc/LookupResultFieldList.ascx" TagName="LookupResultFieldList" TagPrefix="wesUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="portlet light">
                <div class="portlet-title">
                    <div class="caption">
                        <span class="caption-subject font-green-sharp bold uppercase">Editor de grid</span>
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
                            <div class="portlet">
                                <div class="portlet-title">
                                    <div class="caption">
                                        Grid
                                    </div>
                                    <div class="actions">
                                        <asp:LinkButton ID="btnAddField" CssClass="btn green btn-sm" runat="server" data-toggle="modal" OnClientClick="openScreenAddFields()"><i class="fa fa-plus btn-action"></i>Campos</asp:LinkButton>
                                        <asp:LinkButton ID="lnkBtnAddCustomField" CssClass="btn green" runat="server"><i class="fa fa-plus btn-action"></i>Customizado</asp:LinkButton>
                                        <asp:LinkButton ID="lnkBtnAddPathField" CssClass="btn green" runat="server"><i class="fa fa-plus btn-action"></i>Traduzido</asp:LinkButton>
                                        <asp:LinkButton ID="lnkBtnAddSQLField" CssClass="btn green btn-sm" runat="server"><i class="fa fa-plus btn-action"></i>Campo SQL</asp:LinkButton>
                                        <div class="btn-group">
                                            <asp:LinkButton ID="btnLeft" CssClass="btn btn-default" runat="server" OnClick="OnLeftClick"><i class="fa fa fa-arrow-left"></i></asp:LinkButton>
                                            <asp:LinkButton ID="btnRight" CssClass="btn btn-default" runat="server" OnClick="OnRightClick"><i class="fa fa fa-arrow-right"></i></asp:LinkButton>
                                        </div>
                                        <asp:LinkButton ID="btnDel" runat="server" CssClass="btn red" OnClick="OnDeleteClick"><i class="fa fa-minus"></i></asp:LinkButton>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div class="table-scrollable">
                                        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" AllowSorting="true">
                                            <HeaderStyle />
                                            <RowStyle />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <wesUserControl:GridFieldProperties ID="GridDefFields1" runat="server" EnableViewState="true" />
                            <wesUserControl:GridProperties ID="GridDefProp1" runat="server" EnableViewState="true" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="listFields" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <wesUserControl:EntityFieldList ID="gridListFields1" Title="Campos" runat="server" />
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
            <script type="text/javascript">
                function openScreenAddFields() {
                    $('#listFields').modal('show');
                }
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

