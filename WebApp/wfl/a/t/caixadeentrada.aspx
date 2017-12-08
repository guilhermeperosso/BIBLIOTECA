<%@ Page Title="Minhas tarefas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:WorkFlowGrid runat="server" ID="WFL_TASKS_INBOX" Title="Minhas tarefas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="Z_WFTAREFAS.INBOX.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" SystemInstanceName="WORKFLOW" DefaultFilterName="Título" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="@WFL_INBOX" FormUrl="~/wfl/a/t/tarefa.aspx" PageWidgetHandle="155" Level="15" Order="10"  />
        </div>
    
      </asp:Content>
    