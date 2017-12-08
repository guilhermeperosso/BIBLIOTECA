<%@ Page Title="Realizadas por mim" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="WF_MT_REALIZADASPORMIM" Title="Tarefas realizadas por mim" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFTAREFAS.GRID" UserDefinedSelectColumnVisible="False" Mode="None" UserDefinedPageSize="10" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.EXECUTOR = @USUARIO" FormUrl="~/wfl/a/t/vertarefa.aspx" UserDefinedDisableRowSelection="False" PageWidgetHandle="154" Level="15" Order="10"  />
        </div>
    
      </asp:Content>
    