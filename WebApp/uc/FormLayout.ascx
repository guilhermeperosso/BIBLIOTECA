<%@ Control Language="C#" AutoEventWireup="true" Inherits="Benner.Tecnologia.Wes.Components.WebApp.FormLayoutControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components.WebControls" TagPrefix="cc1" %>

<div class="portlet">
    <div class="portlet-title">
        <div class="caption">
            Formulário
        </div>
        <div class="actions">
            <asp:LinkButton ID="btnAddField" CssClass="btn green btn-sm" runat="server" data-toggle="modal" OnClientClick="openScreenAddFields()"><i class="fa fa-plus btn-action"></i>Campos</asp:LinkButton>
            <asp:LinkButton ID="btnAddPathField" CssClass="btn green btn-sm" runat="server" OnClick="OnAddPathFieldClick"><i class="fa fa-plus btn-action"></i>Traduzido</asp:LinkButton>
            <asp:LinkButton ID="btnAddSqlField" CssClass="btn green btn-sm" runat="server" OnClick="OnAddSqlFieldClick"><i class="fa fa-plus btn-action"></i>Campo SQL</asp:LinkButton>
            <asp:LinkButton ID="btnAddLabel" CssClass="btn green btn-sm" runat="server" OnClick="OnAddLabelClick"><i class="fa fa-plus btn-action"></i>Customizado</asp:LinkButton>
            <asp:LinkButton ID="btnAddSection" CssClass="btn green btn-sm" runat="server" OnClick="OnAddSectionClick"><i class="fa fa-plus btn-action"></i>Seção</asp:LinkButton>
            <asp:LinkButton ID="btnAddPage" CssClass="btn green btn-sm" runat="server" OnClick="OnAddPageClick"><i class="fa fa-plus btn-action"></i>Guia</asp:LinkButton>

            <div class="btn-group">
                <asp:LinkButton ID="btnLeft" CssClass="btn btn-default form-editor-button" runat="server" OnClick="OnLeftClick"><i class="fa fa-arrow-left"></i></asp:LinkButton>
                <asp:LinkButton ID="btnRight" CssClass="btn btn-default form-editor-button" runat="server" OnClick="OnRightClick"><i class="fa fa-arrow-right"></i></asp:LinkButton>
            </div>
            <div class="btn-group">
                <asp:LinkButton ID="btnUp" CssClass="btn btn-default form-editor-button" runat="server" OnClick="OnUpClick"><i class="fa fa-arrow-up"></i></asp:LinkButton>
                <asp:LinkButton ID="btnDown" runat="server" CssClass="btn btn-default form-editor-button" OnClick="OnDownClick"><i class="fa fa-arrow-down"></i></asp:LinkButton>
            </div>

            <asp:LinkButton ID="btnDel" runat="server" CssClass="btn red" OnClick="OnDeleteItemClick"><i class="fa fa-minus"></i></asp:LinkButton>
        </div>
    </div>
    <div class="portlet-body ignore-autofocus">
        <asp:HiddenField ID="formEditorSelectedTab" ClientIDMode="Static" runat="server"></asp:HiddenField>
        <asp:FormView ID="formView" runat="server" CssClass="form-editor-view" />
    </div>
</div>

<script type="text/javascript">
    function openScreenAddFields() {
        $('#listFields').modal('show');
    }
</script>


