<%@ Page Title="Participante" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PARTICIPANTE" Title="Participante" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFTAREFAPARTICIPANTES.FORM" IncludeRecordInRecentItems="True" UserDefinedLinkVisible="True" UserDefinedCommandsVisible="True" PageWidgetHandle="84" Level="15" Order="10"  />
        <wes:SimpleGrid runat="server" ID="USURIOSDOPAPEL" Title="Usuários do papel" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PARTICIPANTE" ChromeState="Normal" EntityViewName="Z_WFPAPELUSUARIOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.PAPEL = @CAMPO(PAPEL)" UserDefinedDisableRowSelection="False" PageWidgetHandle="85" Level="15" Order="20"  />
        </div>
    
      </asp:Content>
    