﻿<%@ Page Title="Processo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PROCESSO" Title="Processo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFPROCESSOS.ADM.FORM" IncludeRecordInRecentItems="True" UserDefinedLinkVisible="True" UserDefinedCommandsVisible="True" PageWidgetHandle="106" Level="15" Order="10"  />
        <wes:SimpleGrid runat="server" ID="FLUXOS" Title="Fluxos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PROCESSO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFPROCESSOMODELOS.ADM.GRID" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.PROCESSO = @CAMPO(HANDLE)" UserDefinedDisableRowSelection="False" PageWidgetHandle="107" Level="15" Order="20"  />
        <wes:AjaxForm runat="server" ID="FLUXO" Title="Configuração do fluxo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FLUXOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFPROCESSOMODELOS.ADM.FORM" IncludeRecordInRecentItems="True" UserDefinedLinkVisible="True" UserDefinedCommandsVisible="True" PageWidgetHandle="108" Level="15" Order="30"  />
        <wes:SimpleGrid runat="server" ID="WF_ADM_AUTORIZACOES" Title="Papéis com permissão" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PROCESSO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFPROCESSOAUTORIZACOES.GRID" UserDefinedSelectColumnVisible="False" Mode="None" UserDefinedPageSize="10" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PROCESSO=@CAMPO(HANDLE)" UserDefinedDisableRowSelection="False" PageWidgetHandle="109" Level="15" Order="40"  />
        <wes:AjaxForm runat="server" ID="WF_ADM_AUTORIZACAO" Title="Papel com permissão" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="WF_ADM_AUTORIZACOES" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" SystemInstanceName="WORKFLOW" EntityViewName="Z_WFPROCESSOAUTORIZACOES.FORM" IncludeRecordInRecentItems="True" UserDefinedLinkVisible="True" UserDefinedCommandsVisible="True" PageWidgetHandle="110" Level="15" Order="50"  />
        </div>
    
      </asp:Content>
    