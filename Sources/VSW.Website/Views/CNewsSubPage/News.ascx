<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<%
    // Không hiển thị module
    if (!ViewBag.ShowModule)
        return;
        
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    listItem = listItem == null? new List<ModNewsEntity>(): listItem;
    var PageByMenuId = ViewBag.PageByCategory != null? ViewBag.PageByCategory as SysPageEntity : null;
%>

<div class="row border-full margin-bottom-10px module-news-subpage padding-10px module-subpage" id="<%= ViewBag.ModuleId%>">
<div class="title"><%= ViewBag.Title%></div>
<ul>
<%if (listItem != null && listItem.Any())
  { %>
<% foreach (var item in listItem)
   {%>
    <li>
        <i class="fa fa-angle-double-right"></i> <a href="<%=ViewPage.GetURL(item.MenuID, item.Code) %>"><%= item.Name%></a>
    </li>       
   <%} if (PageByMenuId != null && PageByMenuId.ID != 0)
   {%>
     <li class="read-more"><a href="<%=ViewPage.GetPageURL(PageByMenuId.ID)%>">Xem thêm <i class="fa fa-arrow-right"></i></a></li>
  <%}
  }%>
</ul>
</div>