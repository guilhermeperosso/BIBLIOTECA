<%@ Page Title="Processos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="WF_ADM_PROCESSOS" Title="Processos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFPROCESSOS.GRID" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" DisplayRowCommand="True" CompanyFilterMode="None" FormUrl="~/wfl/a/a/processo.aspx" UserDefinedDisableRowSelection="False" PageWidgetHandle="111" Level="15" Order="10"  />
        </div>
    
      </asp:Content>
    