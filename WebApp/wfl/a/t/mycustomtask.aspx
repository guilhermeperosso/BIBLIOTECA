<%@ Page Title="WF_MT_URL" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="TAREFA" Title="Tarefa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFTAREFAS.INBOX.LITE.FORM" IncludeRecordInRecentItems="True" UserDefinedLinkVisible="True" UserDefinedCommandsVisible="True" PageWidgetHandle="152" Level="15" Order="10"  />
        <wes:WorkFlowForm runat="server" ID="DADOSRELEVANTES" Title="Dados relevantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="TAREFA" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" UserDefinedLinkVisible="True" UserDefinedCriteriaWhereClause="A.HANDLE = (SELECT Z.HANDLEDADORELEVANTE FROM Z_WFMODELOINSTANCIAATIVIDADES Z WHERE Z.HANDLE = @CAMPO(ATIVIDADE))" UserDefinedCommandsVisible="True" PageWidgetHandle="153" Level="15" Order="20"  />
        </div>
    
      </asp:Content>
    