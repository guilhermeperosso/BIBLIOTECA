<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tile.ascx.cs" Inherits="uc_Tile" %>
<div class="dashboard-stat <%= Color %>">
    <div class="visual">
        <i class="<%= Icon %>"></i>
    </div>
    <div class="details">
        <div class="number">
            <%= Value %>
        </div>
        <div class="desc">
            <%= Description %>
        </div>
    </div>
    <% if (!string.IsNullOrEmpty(Url))
       {%>
    <a class="more" href="<%= Url %>">Ver mais <i class="m-icon-swapright m-icon-white"></i></a>
    <% }%>
</div>
