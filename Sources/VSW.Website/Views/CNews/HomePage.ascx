<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<%
    // Không hiển thị module
    if (!ViewBag.ShowModule)
        return;
        
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    listItem = listItem == null ? new List<ModNewsEntity>() : listItem;
%>
<div class="col-lg-4 col-md-4 news-group" id="<%= ViewBag.ModuleId %>">
<div class="title"><%=ViewBag.Title %></div>
<div class="list-item">
<ul>
<%foreach (var item in listItem)
  {%>
      <li><i class="fa fa-angle-double-right"></i> <a href="<%=ViewPage.GetURL(item.MenuID, item.Code) %>"><%=item.Name %></a></li>
  <%} %>
</ul>
</div>
</div>