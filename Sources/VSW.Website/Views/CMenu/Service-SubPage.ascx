<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<%
    // Get List menu by type Sản phẩm dịch vụ
    var MenuType = ModMenu_TypeService.Instance.GetByID(6);
    MenuType = MenuType == null ? new ModMenu_TypeEntity() : MenuType;
    // Tymenu: HomePage_MenuSlide -	Sản phẩm dịch vụ
    var ListMenu = ModMenu_DynamicService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.ModMenuTypeID == MenuType.ID)
                            .OrderByDesc(o => o.Order)
                            .ToList_Cache();
    ListMenu = ListMenu == null ? new List<ModMenu_DynamicEntity>() : ListMenu;
    var MenuParent = ListMenu.Where(o => o.ParentID == 0).OrderBy(o => o.Order).ToList();
%>
<div class="row border-full margin-bottom-10px">
<%if (ListMenu.Count > 0)
  {%>
    <div class="">
        <div class="news-service">
            <div class="title text-group">
                <i class="fa fa-diamond fa-x3"></i><span><%=MenuType.Name%></span></div>
            <ul>
            <%foreach (var itemParent in MenuParent)
              {
                  var listChilden = ListMenu.Where(o => o.ParentID == itemParent.ID).OrderBy(o=>o.Order).ToList();
                  %>
                  <li>
                    <div class="text-group sub-title" data-id="<%=itemParent.ID %>">
                        <% if (!string.IsNullOrEmpty(itemParent.CssIcon))
                           { %>
                            <i class="<%= itemParent.CssIcon %>"></i>
                        <%} %>
                        <span> <%=itemParent.Name %></span></div>
                    <div class="content-detail color-shortdescription">
                        <%=itemParent.Description %>
                    </div>
                    <% if(listChilden != null && listChilden.Count > 0) {%>
                        <div class="content-menu hidden">
                            <ul>
                            <% foreach (var item in listChilden)
                               {%>
                                <li>
                                    <a href="<%=item.Url %>">
                                    <% if (!string.IsNullOrEmpty(item.CssIcon))
                                       { %>
                                        <i class="<%= item.CssIcon %>"></i>
                                    <%} %> <span><%= item.Name %></span></a>
                                </li>
                            <%} %>
                            </ul>
                        </div>
                    <%} %>
                </li>
              <%} %>
            </ul>
        </div>
    </div>
<%} %>
</div>