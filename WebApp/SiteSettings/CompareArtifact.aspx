﻿<%@ Page Title="Comparação de artefatos" Language="C#"
    Inherits="Benner.Tecnologia.Wes.Components.WebApp.CompareArtifactPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <link rel="stylesheet" href="../content/js/ace-diff/styles.css">
    <div id="flex-container" class="ignore-context-menu">
        <div>
            <div class="title-editor">
                Conteúdo da base do sistema
            </div>
            <div id="acediff-left-editor"><%= HttpUtility.HtmlEncode( GetDatabaseContent() ) %></div>
        </div>
        <div id="acediff-gutter">
            <div style="position: fixed; left: 50%; margin-left: -4px;"><a href="#" id="sincronizarRolagem" data-placement="top" data-original-title="Sincroniza"><i id="sincronizarRolagemIcone" class="fa fa-lock"></i></a></div>
        </div>
        <div>
            <div class="title-editor">
                Conteúdo do arquivo local
            </div>
            <div id="acediff-right-editor"><%= HttpUtility.HtmlEncode( GetFileContent() ) %></div>
        </div>
    </div>
    <script src="../content/js/ace-diff/diff_match_patch.js"></script>
    <script src="../content/js/ace/ace.js"></script>
    <script src="../content/js/ace/mode-xml.js"></script>
    <script src="../content/js/ace/mode-json.js"></script>
    <script src="../content/js/ace/ext-language_tools.js"></script>
    <script src="../content/js/ace-diff/ace-diff.min.js"></script>
    <script src="../content/js/ArtifactsDiff.js"></script>
</asp:Content>
