<%@ Page Title="Coordenação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="WF_COORDENACAO_PAPEIS" Title="Coordenação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="Z_WFPAPEIS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="@WFL_COORDENACAO_PAPEIS" UserDefinedDisableRowSelection="False" PageWidgetHandle="132" Level="15" Order="10"  />
        <wes:SimpleGrid runat="server" ID="TAREFAS" Title="Tarefas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="WF_COORDENACAO_PAPEIS" ChromeState="Normal" EntityViewName="Z_WFTAREFAS.COORDENACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="@WFL_COORDENACAO_PAPEIS_TAREFAS" UserDefinedDisableRowSelection="False" PageWidgetHandle="133" Level="15" Order="20"  />
        </div>
    
      </asp:Content>
    