<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<% 
    List<SysPageEntity> listAllPage = SysPageService.Instance.CreateQuery().ToList_Cache();
    var listItem = ViewBag.Data as List<ModMenu_DynamicEntity>;
    var listParent = listItem.Where(o => o.ParentID == 0).OrderBy(o=>o.Order).ToList();
   %>

<div id="<%= ViewBag.ModuleId%>">
    <ul class="megamenu skyblue">
        <%for (int i = 0; listParent != null && i < listParent.Count; i++)
          {
              var item = listParent[i];
              string link = string.IsNullOrEmpty(item.Url) ? ViewPage.GetPageURL(item.SysPageID, listAllPage) : item.Url;
              link = string.IsNullOrEmpty(link) ? "#" : link;
              link = link != "/"? "javascript:void(0);" : "/";

              var currentPage = listAllPage.Where(o => o.ID == item.SysPageID).FirstOrDefault();
              currentPage = currentPage == null ? new SysPageEntity() : currentPage;
              var lstNewsByCategoryId = ModNewsService.Instance.CreateQuery().Where(o => o.MenuID == currentPage.MenuID && o.Activity == true).OrderByAsc(o => o.Order).ToList_Cache();
              lstNewsByCategoryId = lstNewsByCategoryId == null ? new List<ModNewsEntity>() : lstNewsByCategoryId;
              int MenuID = currentPage.MenuID;              
     %>
        <li><a class="color<%=i %>" href="<%=link %>">
        <% if (!string.IsNullOrEmpty(item.CssIcon))
           {%>
           <i class="<%= item.CssIcon%>"></i> 
        <%} %>
        <%=item.Name%></a>

        <% if (lstNewsByCategoryId != null && lstNewsByCategoryId.Count > 0)
           {
               int iCountNew = 0;%>
           <div class="megapanel">
					<div class="row">
                    <% foreach (var itemNews in lstNewsByCategoryId)
                       {
                           iCountNew++;%>
                        <div class="col-lg-4 col-md-4 <%=(lstNewsByCategoryId.Count > iCountNew? "border-right" : "") %>">
                            <div class="title margin-bottom-5px">
                            <% if (!string.IsNullOrEmpty(itemNews.CssIcon))
                                { %>
                                <i class="<%= itemNews.CssIcon %>"></i>
                            <%} %>
                                <a href="<%=ViewPage.GetURL(itemNews.MenuID, itemNews.Code) %>"><%= itemNews.Name %></a>
                            </div>
                            <div class="address color-shortdescription">
                                <%= itemNews.Summary %>
                            </div>
                        </div>
                       <%}%>
                    </div>
            </div>
           </li>
        <%}
           else
           { %>
           </li>
<%} }%>
		   </ul>
</div>