﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModMarketplaceEntity>;
%>

<div class="title"><%= ViewBag.Title %></div>

<div class="list">
<%for(int i = 0; listItem != null && i < listItem.Count; i++)
{
string Url = ViewPage.GetURLCurrentPage(listItem[i].ID.ToString());%>
    <p class="list-item-name"><a href="<%=Url %>"><%= listItem[i].Name %></a></p>
<%}%>
</div>

