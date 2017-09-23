<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<%
    // Không hiển thị module
    if (!ViewBag.ShowModule)
        return;

    var listItem = ViewBag.Data as List<ModNewsEntity>;
    if (listItem == null || listItem.Any() == false)
        return;

    listItem.OrderBy(o => o.Order).ThenByDescending(o => o.Published);//.ToList();
    
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

<div class="col-lg-12 col-md-12 slide-group-home border-full margin-bottom-10px padding-left-right-none">
<%if (ListMenu.Count > 0)
  {%>
    <div class="col-lg-4 col-md-4">
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
    <%--<div class="col-lg-4">
        <div class="news-service">
            <div class="title text-group">
                <i class="fa fa-diamond fa-x3"></i><span>Sản phẩm dịch vụ</span></div>
            <ul>
                <li>
                    <div class="text-group sub-title">
                        <i class="fa fa-cogs fa-x4"></i><span>Dịch vụ sửa chữa</span></div>
                    <div class="content-detail color-shortdescription">
                        Nhanh chóng, chuyên nghiệp, đảm bảo</div>
                    <div class="content-menu">
                        <ul>
                            <li><a>Điều hòa</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="text-group sub-title">
                        <i class="fa fa-connectdevelop fa-x4"></i><span>Dịch vụ lắp đặt</span></div>
                    <div class="content-detail color-shortdescription">
                        Có mặt chỉ từ sau 20 phút</div>
                </li>
                <li>
                    <div class="text-group sub-title">
                        <i class="fa fa-hourglass-half fa-x4"></i><span>Dịch vụ bảo dưỡng</span></div>
                    <div class="content-detail color-shortdescription">
                        Uy tín, hiệu quả lâu dài, tận tình chu đáo</div>
                </li>
                <li>
                    <div class="text-group sub-title">
                        <i class="fa fa-recycle fa-x4"></i><span>Mua bán sản phẩm cũ</span></div>
                    <div class="content-detail color-shortdescription">
                        Mua sản phẩm cũ giá cao, sản phẩm tân trang giá rẻ</div>
                </li>
            </ul>
        </div>
    </div>--%>
    <div class="col-lg-8 col-md-8">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <% for (int i = 0; i < listItem.Count; i++)
                   {%>
                <li data-target="#myCarousel" data-slide-to="<%=i %>" class='<%= i == 0? "active" : "" %>'>
                </li>
                <%   }
                %>
                <%--<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>--%>
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <% for (int i = 0; i < listItem.Count; i++)
                   {
                       var item = listItem[i];%>
                <div class="item <%= i == 0? "active" : "" %>">
                   <a href="<%=ViewPage.GetURL(item.MenuID, item.Code) %>"> 
                        <img src="<%=Utils.GetResizeFile(item.File, 2, 900, 300)%>" alt="Chania" class="img-responsive"
                            width="100%">
                   </a>
                    <div class="carousel-caption hidden-xs hidden-sm">
                        <h5>
                            <a href="<%=ViewPage.GetURL(item.MenuID, item.Code) %>">
                                <%= item.Name %></a></h5>
                    </div>
                </div>
                <%   }
                %>
                <%--    <div class="item active">
      <img src="/Content/plugins/adidas-pack/images/banner1.jpg" alt="Chania">
      <div class="carousel-caption">
        <h3>Chania</h3>
        <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
      </div>
    </div>

    <div class="item">
      <img src="/Content/plugins/adidas-pack/images/banner2.jpg" alt="Chania">
      <div class="carousel-caption">
        <h3>Chania</h3>
        <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
      </div>
    </div>

    <div class="item">
      <img src="/Content/plugins/adidas-pack/images/banner1.jpg" alt="Flower">
      <div class="carousel-caption">
        <h3>Flowers</h3>
        <p>Beatiful flowers in Kolymbari, Crete.</p>
      </div>
    </div>

    <div class="item">
      <img src="/Content/plugins/adidas-pack/images/banner2.jpg" alt="Flower">
      <div class="carousel-caption">
        <h3>Flowers</h3>
        <p>Beatiful flowers in Kolymbari, Crete.</p>
      </div>
    </div>--%>
            </div>
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">
                    Previous</span> </a><a class="right carousel-control" href="#myCarousel" role="button"
                        data-slide="next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true">
                        </span><span class="sr-only">Next</span> </a>
        </div>
    </div>
</div>
<style type="text/css">
    .carousel-control.right
    {
        background-image: linear-gradient(to right, rgba(0, 0, 0, .0001) 0%, rgba(0, 0, 0, 0.05) 100%) !important;
    }
    .carousel-control.left
    {
        background-image: linear-gradient(to left, rgba(0, 0, 0, .0001) 0%, rgba(0, 0, 0, 0.05) 100%) !important;
    }
    .carousel-indicators li
    {
        border-color: #bdbbbb !important;
        background-color: white !important;
    }
    .carousel-indicators li.active
    {
        background-color: #8e8c8c !important;
    }
    .carousel-caption
    {
        background-color: rgba(0, 51, 102, 0.54);
        right: 0% !important;
        left: 0% !important;
        padding-left: 25px;
        padding-right: 25px;
    }
    .carousel-caption a
    {
        color: #f9ff00 !important;
    }
</style>
