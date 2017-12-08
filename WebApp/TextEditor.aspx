﻿<%@ Page Language="C#" %>
<%@ Register Src="~/uc/HeadSection.ascx" TagName="HeadSection" TagPrefix="wes" %>
<%
    new Benner.Tecnologia.Wes.Components.WebApp.StylesLoader().EnsureResource(Page);
 %>
<!doctype html>
<html lang="pt" class="no-js">
    <head runat="server">
        <title>Editor de texto</title>
        <wes:HeadSection ID="HeadSection1" runat="server" />
        <style type="text/css">
            .text-editor-title {
                margin-top: 15px;
            }
        </style>
    </head>
    <body class="bg-white">
        <form id="form1" runat="server">
            <div class="modal-body text-editor-title">
                <textarea name="PropertyEditor" rows="15" cols="20" id="PropertyEditor" title="Área de Texto do Construtor" style="height: 280px; width: 100%;"></textarea>
            </div>
            <div class="modal-footer">
                <button id="OkButton" class="btn blue" type="button"  accesskey="O" onclick="javascript: OnOkClick();">OK</button>
                <button type="button" class="btn default" accesskey="C" onclick="javascript: OnCancelClick();">Cancelar</button>
            </div>
        </form>
        <script src="Content/assets/global/plugins/jquery.min.js"></script>
        <script type="text/javascript">
            $(function () {
                parent.Benner.ModalPage.init();
                $("#PropertyEditor").val(parent.Benner.TextEditor.val()).focus();
            });

            function OnOkClick() {
                parent.Benner.TextEditor.val($("#PropertyEditor").val());
                parent.Benner.ModalPage.hide();
            }

            function OnCancelClick() {
                parent.Benner.ModalPage.hide();
            }
        </script>
    </body>
</html>
