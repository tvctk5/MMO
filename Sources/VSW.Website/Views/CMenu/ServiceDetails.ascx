<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<%
    List<SysPageEntity> listAllPage = SysPageService.Instance.CreateQuery().ToList_Cache();
    var listItem = ViewBag.Data as List<ModMenu_DynamicEntity>;
    var listParent = listItem.Where(o => o.ParentID == 0).ToList();
%>

<% foreach (var item in listItem)
   {
       string link = string.IsNullOrEmpty(item.Url) ? ViewPage.GetPageURL(item.SysPageID, listAllPage) : item.Url;
       link = string.IsNullOrEmpty(link) ? "#" : link;
       
       var currentPage = listAllPage.Where(o=>o.ID == item.SysPageID).FirstOrDefault();
       currentPage = currentPage == null? new SysPageEntity() : currentPage;
       var getListNewsByCategoryId = ModNewsService.Instance.CreateQuery().Where(o => o.MenuID == currentPage.MenuID && o.Activity == true).OrderByAsc(o=>o.Order).ToList_Cache();
       getListNewsByCategoryId = getListNewsByCategoryId == null ? new List<ModNewsEntity>() : getListNewsByCategoryId;
       int MenuID = currentPage.MenuID;
       %>
    <div class="col-lg-12 col-md-12 service-detail border-full margin-bottom-10px">
        <div class="header margin-bottom-10px">
        <a href="<%= link %>">
            <% if (!string.IsNullOrEmpty(item.CssIcon))
               { %>
                <i class="<%= item.CssIcon %> fa-2x"></i>
            <%} %>
             <%=item.Name %></a></div>
        <div class="row content">
        <% foreach (var itemNews in getListNewsByCategoryId)
           {%>
             
            <div class="col-lg-3 col-md-3 group">
                <div class="row border-right">
                    <div class="col-lg-2 col-md-2">
                        <% if (!string.IsNullOrEmpty(itemNews.CssIcon))
                           { %>
                            <i class="<%= itemNews.CssIcon %> fa-2x"></i>
                        <%} %>
                    </div>
                    <div class="col-lg-10 col-md-10">
                        <div class="title margin-bottom-5px">
                            <a href="<%=ViewPage.GetURL(itemNews.MenuID, itemNews.Code) %>"><%= itemNews.Name %></a>
                        </div>
                        <div class="address color-shortdescription">
                            <%= itemNews.Summary %>
                        </div>
                    </div>
                </div>
            </div>  
           <%} 
             // get news in category
            var ListNewsOther = ModNewsService.Instance.CreateQuery()
                     .Where(o => o.Activity == true && o.MenuID != MenuID)
                     .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("News", MenuID, ViewPage.CurrentLang.ID))
                     .OrderByAsc(o => o.Order).ToList_Cache();
                      //.Take(PageSize)
                      //.Skip(PageSize * model.Page);
            ListNewsOther = ListNewsOther == null ? new List<ModNewsEntity>() : ListNewsOther;
             %>
             <!--col-lg-3 group-->
            <div class="col-lg-3 col-md-3 group">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="title text-center margin-bottom-5px">
                           <a><i class="fa fa-hand-o-right fa-1x"></i> Thông tin hỗ trợ</a>
                        </div>
                        <div class="list-content color-shortdescription">
                            <ul>
                            <% foreach (var itemNews in ListNewsOther)
                               {%>
                                <li><a href="<%=ViewPage.GetURL(itemNews.MenuID, itemNews.Code) %>">- <%=itemNews.Name %></a></li>                                   
                               <%} %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--End: col-lg-3 group-->
        </div>
</div>
<div class="clearfix">
</div>  
   <%} %>


<%--<div class="row service-detail border-full margin-bottom-10px" >
    <div class="col-lg-12">
        <div class="header margin-bottom-10px">
            <i class="fa fa-snowflake-o fa-2x"></i> Máy điều hòa</div>
        <div class="row content">
            <div class="col-lg-3 group">
                <div class="row border-right">
                    <div class="col-lg-2">
                        <i class="fa fa-cogs fa-2x"></i>
                    </div>
                    <div class="col-lg-10">
                        <div class="title margin-bottom-5px">
                            <a>Sửa chữa máy điều hòa</a>
                        </div>
                        <div class="address color-shortdescription">
                            Sửa chữa điều hòa đảm bảo uy tín, chất lượng
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 group">
                <div class="row border-right">
                    <div class="col-lg-2">
                        <i class="fa fa-connectdevelop fa-2x"></i>
                    </div>
                    <div class="col-lg-10">
                        <div class="title margin-bottom-5px">
                            <a>Lắp đặt điều hòa</a>
                        </div>
                        <div class="address color-shortdescription">
                            Nhận lắp đặt điều hòa theo yêu cầu, sản phẩm chính hiệu, bảo hành chính hãng
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 group">
                <div class="row border-right">
                    <div class="col-lg-2">
                        <i class="fa fa-hourglass-half fa-2x"></i>
                    </div>
                    <div class="col-lg-10">
                        <div class="title margin-bottom-5px">
                            <a>Bảo dưỡng điều hòa</a>
                        </div>
                        <div class="address color-shortdescription">
                            Dịch vụ nhanh chóng, giá tốt nhất thị trường
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 group">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="title text-center margin-bottom-5px">
                           <a><i class="fa fa-hand-o-right fa-1x"></i> Đoán bệnh</a>
                        </div>
                        <div class="list-content color-shortdescription">
                            <ul>
                                <li><a>- Bản tin 1</a></li>
                                <li><a>- Bản tin 2</a></li>
                                <li><a>- Bản tin 3</a></li>
                                <li><a>- Bản tin 4</a></li>
                                <li><a>- Bản tin 5</a></li>
                                <li><a>- Bản tin 6</a></li>
                                <li><a>- Bản tin 7</a></li>
                                <li><a>- Bản tin 8</a></li>
                                <li><a>- Bản tin 9</a></li>
                                <li><a>- Bản tin 10</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clearfix">
</div>
<div class="row service-detail border-full margin-bottom-10px" >
    <div class="col-lg-12">
        <div class="header margin-bottom-10px">
            <i class="fa fa-trello fa-2x"></i> Tủ lạnh</div>
        <div class="row content">
            <div class="col-lg-3 group">
                <div class="row border-right">
                    <div class="col-lg-2">
                        <i class="fa fa-cogs fa-2x"></i>
                    </div>
                    <div class="col-lg-10">
                        <div class="title margin-bottom-5px">
                            <a>Sửa chữa máy điều hòa</a>
                        </div>
                        <div class="address color-shortdescription">
                            Sửa chữa điều hòa đảm bảo uy tín, chất lượng
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 group">
                <div class="row border-right">
                    <div class="col-lg-2">
                        <i class="fa fa-connectdevelop fa-2x"></i>
                    </div>
                    <div class="col-lg-10">
                        <div class="title margin-bottom-5px">
                            <a>Lắp đặt điều hòa</a>
                        </div>
                        <div class="address color-shortdescription">
                            Nhận lắp đặt điều hòa theo yêu cầu, sản phẩm chính hiệu, bảo hành chính hãng
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 group">
                <div class="row border-right">
                    <div class="col-lg-2">
                        <i class="fa fa-hourglass-half fa-2x"></i>
                    </div>
                    <div class="col-lg-10">
                        <div class="title margin-bottom-5px">
                            <a>Bảo dưỡng điều hòa</a>
                        </div>
                        <div class="address color-shortdescription">
                            Dịch vụ nhanh chóng, giá tốt nhất thị trường
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 group">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="title text-center margin-bottom-5px">
                           <a><i class="fa fa-hand-o-right fa-1x"></i> Đoán bệnh</a>
                        </div>
                        <div class="list-content color-shortdescription">
                            <ul>
                                <li><a>- Bản tin 1</a></li>
                                <li><a>- Bản tin 2</a></li>
                                <li><a>- Bản tin 3</a></li>
                                <li><a>- Bản tin 4</a></li>
                                <li><a>- Bản tin 5</a></li>
                                <li><a>- Bản tin 6</a></li>
                                <li><a>- Bản tin 7</a></li>
                                <li><a>- Bản tin 8</a></li>
                                <li><a>- Bản tin 9</a></li>
                                <li><a>- Bản tin 10</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clearfix">
</div>
<div class="row service-detail border-full margin-bottom-10px" >
    <div class="col-lg-12">
        <div class="header margin-bottom-10px">
            <i class="fa fa-map-pin fa-2x"></i> Bình nóng lạnh</div>
        <div class="row content">
            <div class="col-lg-3 group">
                <div class="row border-right">
                    <div class="col-lg-2">
                        <i class="fa fa-cogs fa-2x"></i>
                    </div>
                    <div class="col-lg-10">
                        <div class="title margin-bottom-5px">
                            <a>Sửa chữa máy điều hòa</a>
                        </div>
                        <div class="address color-shortdescription">
                            Sửa chữa điều hòa đảm bảo uy tín, chất lượng
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 group">
                <div class="row border-right">
                    <div class="col-lg-2">
                        <i class="fa fa-connectdevelop fa-2x"></i>
                    </div>
                    <div class="col-lg-10">
                        <div class="title margin-bottom-5px">
                            <a>Lắp đặt điều hòa</a>
                        </div>
                        <div class="address color-shortdescription">
                            Nhận lắp đặt điều hòa theo yêu cầu, sản phẩm chính hiệu, bảo hành chính hãng
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 group">
                <div class="row border-right">
                    <div class="col-lg-2">
                        <i class="fa fa-hourglass-half fa-2x"></i>
                    </div>
                    <div class="col-lg-10">
                        <div class="title margin-bottom-5px">
                            <a>Bảo dưỡng điều hòa</a>
                        </div>
                        <div class="address color-shortdescription">
                            Dịch vụ nhanh chóng, giá tốt nhất thị trường
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 group">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="title text-center margin-bottom-5px">
                           <a><i class="fa fa-hand-o-right fa-1x"></i> Đoán bệnh</a>
                        </div>
                        <div class="list-content color-shortdescription">
                            <ul>
                                <li><a>- Bản tin 1</a></li>
                                <li><a>- Bản tin 2</a></li>
                                <li><a>- Bản tin 3</a></li>
                                <li><a>- Bản tin 4</a></li>
                                <li><a>- Bản tin 5</a></li>
                                <li><a>- Bản tin 6</a></li>
                                <li><a>- Bản tin 7</a></li>
                                <li><a>- Bản tin 8</a></li>
                                <li><a>- Bản tin 9</a></li>
                                <li><a>- Bản tin 10</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clearfix">
</div>
<div class="row service-detail border-full margin-bottom-10px" >
    <div class="col-lg-12">
        <div class="header margin-bottom-10px">
            <i class="fa fa-flask fa-2x"></i> Máy giặt</div>
        <div class="row content">
            <div class="col-lg-3 group">
                <div class="row border-right">
                    <div class="col-lg-2">
                        <i class="fa fa-cogs fa-2x"></i>
                    </div>
                    <div class="col-lg-10">
                        <div class="title margin-bottom-5px">
                            <a>Sửa chữa máy điều hòa</a>
                        </div>
                        <div class="address color-shortdescription">
                            Sửa chữa điều hòa đảm bảo uy tín, chất lượng
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 group">
                <div class="row border-right">
                    <div class="col-lg-2">
                        <i class="fa fa-connectdevelop fa-2x"></i>
                    </div>
                    <div class="col-lg-10">
                        <div class="title margin-bottom-5px">
                            <a>Lắp đặt điều hòa</a>
                        </div>
                        <div class="address color-shortdescription">
                            Nhận lắp đặt điều hòa theo yêu cầu, sản phẩm chính hiệu, bảo hành chính hãng
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 group">
                <div class="row border-right">
                    <div class="col-lg-2">
                        <i class="fa fa-hourglass-half fa-2x"></i>
                    </div>
                    <div class="col-lg-10">
                        <div class="title margin-bottom-5px">
                            <a>Bảo dưỡng điều hòa</a>
                        </div>
                        <div class="address color-shortdescription">
                            Dịch vụ nhanh chóng, giá tốt nhất thị trường
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 group">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="title text-center margin-bottom-5px">
                           <a><i class="fa fa-hand-o-right fa-1x"></i> Đoán bệnh</a>
                        </div>
                        <div class="list-content color-shortdescription">
                            <ul>
                                <li><a>- Bản tin 1</a></li>
                                <li><a>- Bản tin 2</a></li>
                                <li><a>- Bản tin 3</a></li>
                                <li><a>- Bản tin 4</a></li>
                                <li><a>- Bản tin 5</a></li>
                                <li><a>- Bản tin 6</a></li>
                                <li><a>- Bản tin 7</a></li>
                                <li><a>- Bản tin 8</a></li>
                                <li><a>- Bản tin 9</a></li>
                                <li><a>- Bản tin 10</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clearfix">
</div>--%>
