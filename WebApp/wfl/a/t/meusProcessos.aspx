<%@ Page Title="Meus processos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="WF_MEUSPROCESSOS_GRID" Title="Minhas solicitações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="Z_WFMODELOINSTANCIAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" SystemInstanceName="WORKFLOW" UserDefinedSelectColumnVisible="False" Mode="None" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.SOLICITADOPOR = @USUARIO" FormUrl="~/wfl/a/t/instancia.aspx" UserDefinedDisableRowSelection="False" PageWidgetHandle="137" Level="15" Order="10"  />
        </div>
    
      </asp:Content>
    