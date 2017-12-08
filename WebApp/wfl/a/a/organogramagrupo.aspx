<%@ Page Title="Grupo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="NOMEDOGRUPO" Title="Detalhes do grupo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFGRUPOS.ADM.FORM" IncludeRecordInRecentItems="True" UserDefinedLinkVisible="True" UserDefinedCommandsVisible="True" PageWidgetHandle="102" Level="15" Order="10"  />
        <wes:SimpleGrid runat="server" ID="GRUPOS" Title="Grupos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="NOMEDOGRUPO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFGRUPOS.ADM.GRID" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.NIVELSUPERIOR = @CAMPO(HANDLE)" FormUrl="~/wfl/a/a/organogramagrupo.aspx" UserDefinedDisableRowSelection="False" PageWidgetHandle="103" Level="15" Order="20"  />
        <wes:SimpleGrid runat="server" ID="PAPIS" Title="Papéis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="NOMEDOGRUPO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFPAPEIS.ADM.GRID" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.GRUPO = @CAMPO(HANDLE)" FormUrl="~/wfl/a/a/organogramapapel.aspx" UserDefinedDisableRowSelection="False" PageWidgetHandle="104" Level="15" Order="30"  />
        </div>
    
      </asp:Content>
    