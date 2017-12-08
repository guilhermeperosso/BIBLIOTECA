<%@ Page Language="C#" %>

<%@ Register Src="~/uc/HeadSection.ascx" TagName="HeadSection" TagPrefix="wes" %>
<%
    new Benner.Tecnologia.Wes.Components.WebApp.StylesLoader().EnsureResource(Page);
%>

<!doctype html>
<html lang="pt" class="no-js">
<head runat="server">
    <title>Acesso negado!</title>
    <wes:HeadSection ID="HeadSection1" runat="server" />
</head>
<body class="bg-white">
    <form id="form2" runat="server">
        <asp:HiddenField runat="server" ID="hdnToken" />
        <div class="container">
            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 50px; width: 80%;">
                <div class="errorTitlePanel">
                    <p class="emoticon"><i class="fa fa-times-circle"></i></p>
                    <div style="padding-top: 20px; padding-bottom: 40px;">
                        <asp:Label runat="server" Text="Ops, ocorreu um problema" Font-Size="X-Large" ID="lblProblem" />
                        <div class="errorCmds" style="margin-top: 10px;">
                            <div>
                                <div class="accessDeniedPage">
                                    <h3>Acesso negado. Você não está autorizado a visualizar esta página.</h3>
                                    <span>Para maiores informações consulte o administrador do sistema.
                                        <br />
                                        <br />
                                        <a href="<%= Page.ResolveUrl("~/") %>">Página inicial</a>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <asp:Label ID="lblErrorMessage" runat="server" Font-Size="1.5em"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="<%= Page.ResolveUrl("~/Content/assets/global/plugins/jquery.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/Content/assets/global/plugins/bootstrap/js/bootstrap.min.js") %>"></script>
    <script type="text/javascript">

        $(function () {
            $("body").keyup(function (e) {
                if (e.keyCode == 27) // esc
                {
                    if (parent != null)
                        parent.Benner.ModalPage.hide();
                    else
                        Benner.ModalPage.hide();

                    return false;
                }
            });
        });
    </script>
</body>
</html>
