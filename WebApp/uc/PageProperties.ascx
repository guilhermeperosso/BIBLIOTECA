﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="Benner.Tecnologia.Wes.Components.WebApp.PagePropertiesControl" %>
<div class="portlet portlet-tab">
    <div class="portlet-title">
        <div class="caption">
            Guia
        </div>
    </div>
    <div class="portlet-body">
        <div class="form-group">
            <asp:Label ID="Label1" CssClass="control-label" runat="server" Text="Nome"></asp:Label>
            <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label2" CssClass="control-label" runat="server" Text="Título"></asp:Label>
            <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server"></asp:TextBox>
        </div>

        <asp:CheckBox runat="server" ID="chkVisible" Text="Visível" />
    </div>
</div>
