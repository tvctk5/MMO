<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<div class="news-detail">
    <div class="detail">
        <div class="title">
            <%=ViewPage.CurrentPage.Name%></div>
        <div class="content">
            <%= Utils.GetHTMLForSeo(ViewPage.CurrentPage.Content)%>
        </div>
    </div>
</div>
