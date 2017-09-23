<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<% 
    var listItem = ViewBag.Data as List<ModMenu_DynamicEntity>; 
    //var listParent = listItem.Where(o => o.ParentID == 0).ToList();
   %>
   
<div class="col-lg-12 col-md-12 callus border-full margin-bottom-10px padding-left-right-none" id="<%= ViewBag.ModuleId%>">
<% foreach (var item in listItem)
   {%>
    <div class="col-lg-3 col-md-3">
        <div class="row border-right">
            <% if (!string.IsNullOrEmpty(item.CssIcon))
               { %>
                <div class="col-lg-2 col-md-2">            
                    <i class="<%= item.CssIcon %>"></i>
                </div>
            <%} %>
            <div class="col-lg-10 col-md-10">
                <%= item.Code %>
            </div>
        </div>
    </div>       
   <%} %>

</div>
<div class="clearfix">
</div>
