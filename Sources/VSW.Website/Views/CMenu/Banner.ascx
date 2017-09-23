<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<ModMenu_DynamicEntity>; 
    var listAllPage = ViewBag.ListAllSysPage as List<SysPageEntity>;
    var listSlideItem = ViewBag.DataSlide as List<ModAdvEntity>;
    if (listSlideItem == null || true)
        listSlideItem = new List<ModAdvEntity>();
   %>

<%--<%for (int i = 0; listItem != null && i < listItem.Count; i++ )
{ %>
  <%= Utils.GetCodeAdv(listItem[i])%>
<%} %>--%>

<div class="col-md-4">
<%--	<a href="index.html"><img src="/Content/plugins/adidas-pack/images/logo.png" alt=""/></a>--%>
<a href="/"><img src="/Content/images/logo_350x145.png" alt="" style="width:350px;height:100px;"/></a>

</div>
<div class="col-md-8">
<div class="row text-right">
    <div class="cssmenu">
	    <ul>
        <%for (int i = 0; listItem != null && i < listItem.Count; i++ )
        { 
              // var page = listAllPage.Where(o=>o.ID == listItem[i].SysPageID).SingleOrDefault(); page = page == null? new SysPageEntity() : page;
              var link = string.IsNullOrEmpty(listItem[i].Url) ? ViewPage.GetPageURL(listItem[i].SysPageID, listAllPage) : listItem[i].Url;
         %>
            <li><a href="<%=link %>"><%=listItem[i].Name %></a></li> 
    <%} %>
    <%--		<li class="active"><a href="register.html">Sign up & Save</a></li> 
		    <li><a href="shop.html">Store Locator</a></li> 
		    <li><a href="login.html">My Account</a></li> 
		    <li><a href="checkout.html">CheckOut</a></li> --%>
	    </ul>
    </div>
</div>

<div class="row banner-content text-center">
{RS:Web_BannerText}
</div>

</div>
<ul class="icon2 sub-icon2 profile_img hidden">
	<li><a class="active-icon c2" href="#"> </a>
		<ul class="sub-icon2 list">
			<li><h3>Products</h3><a href=""></a></li>
			<li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
		</ul>
	</li>
</ul>
<div class="clear"></div>
<style type="text/css">
    /*.cssmenu{float:right !important;}*/
    .cssmenu1 ul li{display:inline-block !important;}
    .cssmenu1 ul li a{text-transform:none !important;}
    .img-banner-slide{}
</style>