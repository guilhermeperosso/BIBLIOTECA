<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Src="~/uc/HeadSection.ascx" TagName="HeadSection" TagPrefix="wes" %>

<!DOCTYPE html>
<html lang="pt" class="no-js">
<head id="Head1" runat="server">
    <title></title>
    <wes:HeadSection ID="HeadSection" runat="server" />
    <style>
        .effectImg {
            opacity: 0.6;
            width:217px;
            height:129px;
            border:1px solid black;
        }

        .effectImg:hover {
            opacity: 1;
        }

        @media (max-width: 992px) {
            .form-group {
                margin-bottom: 0px;
            }
            .col-sm-6{
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body class="bg-white">
    <form id="form1" runat="server">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" onclick="javascript:parent.Benner.ModalPage.hide();"></button>
            <h4 class="modal-title">Opções de templates</h4>
        </div>
        <div class="modal-body form-horizontal text-center">
            <div class="form-group">
                <div class="col-sm-6">
                    <a onclick="javascript:selectTemplate('inheritance');">
                        <img id="loginAtual" class="effectImg" src="../Content/img/LoginAtual.png" />
                    </a>
                </div>
                <div class="col-sm-6">
                    <a onclick="javascript:selectTemplate('right');">
                        <img id="loginRight" class="effectImg" src="../Content/img/LoginRight.png" />
                    </a>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6">
                    <a onclick="javascript:selectTemplate('blur');">
                        <img id="loginBlur" class="effectImg" src="../Content/img/LoginBlur.png" />
                    </a>
                </div>
                <div class="col-sm-6">
                    <a onclick="javascript:selectTemplate('default');">
                        <img id="loginDefault" class="effectImg" src="../Content/img/LoginDefault.png" />
                    </a>
                </div>
            </div>
        </div>
    </form>
    <script src="../content/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="../content/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
    <script src="../content/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="../content/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../content/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="../content/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="../content/assets/global/scripts/app.min.js" type="text/javascript"></script>
    <script src="../content/assets/layouts/layout/scripts/layout.js" type="text/javascript"></script>
    <script src="../content/assets/layouts/global/scripts/quick-sidebar.js" type="text/javascript"></script>
    <script type="text/javascript">
        function selectTemplate(template) {
            parent.document.getElementById("hdnTemplateLogin").value = template;
            parent.Benner.ModalPage.hide();
        }
    </script>
</body>
</html>
