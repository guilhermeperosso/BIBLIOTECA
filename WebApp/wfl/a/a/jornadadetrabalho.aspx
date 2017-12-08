<%@ Page Title="Jornada de trabalho" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="JORNADADETRABALHO" Title="Jornada de trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFJORNADADETRABALHO.ADM.FORM" IncludeRecordInRecentItems="True" UserDefinedLinkVisible="True" UserDefinedCommandsVisible="True" PageWidgetHandle="97" Level="15" Order="10"  />
        <wes:SimpleGrid runat="server" ID="HORRIOS" Title="Horários" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="JORNADADETRABALHO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFJORNADADETRABALHOHORARIOS.ADM.GRID" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.JORNADADETRABALHO = @CAMPO(HANDLE)" FormUrl="~/wfl/a/a/horario.aspx" UserDefinedDisableRowSelection="False" PageWidgetHandle="98" Level="15" Order="20"  />
        </div>
    
      </asp:Content>
    