﻿<%@ Page Title="Tarefa" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="TAREFA" Title="Tarefa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFTAREFAS.MONITOR.FORM" IncludeRecordInRecentItems="True" UserDefinedLinkVisible="True" UserDefinedCommandsVisible="True" PageWidgetHandle="148" Level="15" Order="10"  />
        <wes:SimpleGrid runat="server" ID="PARTICIPANTES" Title="Participantes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="TAREFA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFTAREFAPARTICIPANTES.MONITOR.GRID" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.TAREFA = @CAMPO(HANDLE)" FormUrl="~/wfl/a/t/participante.aspx" UserDefinedDisableRowSelection="False" PageWidgetHandle="149" Level="15" Order="20"  />
        <wes:SimpleGrid runat="server" ID="LEMBRETES" Title="Lembretes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="TAREFA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFLEMBRETES.MONITOR.GRID" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.TAREFA = @CAMPO(HANDLE)" UserDefinedDisableRowSelection="False" PageWidgetHandle="150" Level="15" Order="30"  />
        <wes:SimpleGrid runat="server" ID="WF_TAREFAAUDITORIA" Title="Auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="TAREFA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFTAREFAAUDITORIAS.GRID" UserDefinedSelectColumnVisible="False" Mode="None" UserDefinedPageSize="10" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.TAREFA = @CAMPO(HANDLE)" UserDefinedDisableRowSelection="False" PageWidgetHandle="151" Level="15" Order="40"  />
        </div>
    
      </asp:Content>
    