<%@ Page Title="Informação do ambiente" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.EnvironmentInfoPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <div class="col-md-4">
            <div class="portlet box blue-hoki">
                <div class="portlet-title">
                    <div class="caption">
                        Informações da versão
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group">
                        <asp:Label runat="server" ID="wesVersion"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="providerVersion"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="superServerVersion"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="portlet box blue-hoki">
                <div class="portlet-title">
                    <div class="caption">
                        Informações do ambiente
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group">
                        <asp:Label runat="server" ID="poolName"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="serverName"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="serverPort"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="serverSoftware"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="activeSessionCount" runat="server" Text="" />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="portlet box blue-hoki">
                <div class="portlet-title">
                    <div class="caption">
                        Informações do sistema
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group">
                        Última alteração:
                    <asp:Label runat="server" ID="lastChange"></asp:Label>
                    </div>
                    <div class="form-group">
                        Última correção:
                    <asp:Label runat="server" ID="lastCorrection"></asp:Label>
                    </div>
                    <div class="form-group">
                        Versão DB:
                    <asp:Label runat="server" ID="dbVersion"></asp:Label>
                    </div>
                    <div class="form-group">
                        Versão do sistema:
                    <asp:Label runat="server" ID="systemVersion"></asp:Label>
                    </div>
                    <div class="form-group">
                        Nome do sistema:
                    <asp:Label runat="server" ID="systemName"></asp:Label>
                    </div>
                    <div class="form-group">
                        Sistema é específico:
                    <asp:Label runat="server" ID="isCustomSystem"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="lastSpecific"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red-sunglo">
                <div class="portlet-title">
                    <div class="caption">
                        Usuários logados
                    </div>
                </div>
                <div class="portlet-body">
                    <asp:UpdatePanel runat="server" ID="gridUsersUpdate">
                        <ContentTemplate>
                            <asp:Timer ID="timerUpdateGridUsers" runat="server"></asp:Timer>
                            <asp:GridView runat="server" ID="gridUsers">
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

