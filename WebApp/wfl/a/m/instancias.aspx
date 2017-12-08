<%@ Page Title="Instâncias" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="INSTNCIASDEFLUXO" Title="Instâncias de fluxo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFMODELOINSTANCIAS.MONITOR.GRID" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.SUPERIOR IS NULL" FormUrl="~/wfl/a/m/instancia.aspx" UserDefinedDisableRowSelection="False" PageWidgetHandle="145" Level="15" Order="10"  />
        </div>
    
      </asp:Content>
    