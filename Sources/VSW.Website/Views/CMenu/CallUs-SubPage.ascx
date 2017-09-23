<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<% 
    var listItem = ViewBag.Data as List<ModMenu_DynamicEntity>;
    listItem = listItem.OrderByDescending(o => o.Order).ToList();
   %>
<div class="row callus border-full margin-bottom-10px callus-subpage padding-10px" id="<%= ViewBag.ModuleId%>">
<ul>
<% foreach (var item in listItem)
   {%>
    <li>
        <div class="row">
            <% if (!string.IsNullOrEmpty(item.CssIcon))
               { %>
                <div class="col-lg-2">            
                    <i class="<%= item.CssIcon %>"></i>
                </div>
            <%} %>
            <div class="col-lg-10">
                <%= item.Code %>
            </div>
        </div>
    </li>       
   <%} %>
</ul>
</div>
