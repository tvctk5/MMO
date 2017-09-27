<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModMMO_ProductEntity;
    var listOther = ViewBag.Other as List<ModMMO_ProductEntity>;
%>

<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="item">
    <p class="item-id">ID : <%= item.ID %></p>
    <p class="item-sku">S k u : <%= item.SKU %></p>
    <p class="item-name">Tên : <%= item.Name %></p>
    <p class="item-displayname">Display name : <%= item.DisplayName %></p>
    <p class="item-pagetitle">Page title : <%= item.PageTitle %></p>
    <p class="item-pagedescription">Page description : <%= item.PageDescription %></p>
    <p class="item-pagekeywords">Page keywords : <%= item.PageKeywords %></p>
    <p class="item-saleprice">Sale price : <%= string.Format("{0:#,##0}", item.SalePrice) %></p>
    <p class="item-discountedprice">Discounted price : <%= string.Format("{0:#,##0}", item.DiscountedPrice) %></p>
    <p class="item-discountedpercentage">Discounted percentage : <%= string.Format("{0:#,##0}", item.DiscountedPercentage) %></p>
    <p class="item-discountedvalue">Discounted value : <%= string.Format("{0:#,##0}", item.DiscountedValue) %></p>
    <p class="item-currencyid">Currency id : <%= string.Format("{0:#,##0}", item.CurrencyId) %></p>
    <p class="item-category_lv1">Category_ l v1 : <%= item.Category_LV1 %></p>
    <p class="item-category_lv2">Category_ l v2 : <%= item.Category_LV2 %></p>
    <p class="item-category_lv3">Category_ l v3 : <%= item.Category_LV3 %></p>
    <p class="item-category_lv1_id">Category_ l v1_ id : <%= string.Format("{0:#,##0}", item.Category_LV1_Id) %></p>
    <p class="item-category_lv2_id">Category_ l v2_ id : <%= string.Format("{0:#,##0}", item.Category_LV2_Id) %></p>
    <p class="item-category_lv3_id">Category_ l v3_ id : <%= string.Format("{0:#,##0}", item.Category_LV3_Id) %></p>
    <p class="item-categorypath">Category path : <%= item.CategoryPath %></p>
    <p class="item-image1">Image1 : <%= item.Image1 %></p>
    <p class="item-image2">Image2 : <%= item.Image2 %></p>
    <p class="item-image3">Image3 : <%= item.Image3 %></p>
    <p class="item-image4">Image4 : <%= item.Image4 %></p>
    <p class="item-image5">Image5 : <%= item.Image5 %></p>
    <p class="item-url">URL : <%= item.Url %></p>
    <p class="item-redirecturl">Redirect url : <%= item.RedirectUrl %></p>
    <p class="item-brand">Hãng sản xuất : <%= item.Brand %></p>
    <p class="item-brandid">Brand id : <%= string.Format("{0:#,##0}", item.BrandId) %></p>
    <p class="item-status">Status : <%= item.Status ? "Có" : "Không" %></p>
    <p class="item-menuid">Chuyên mục : <%= item.getMenu().Name %></p>
    <p class="item-langid">Ngôn ngữ : <%= item.getLang().Name %></p>
    <p class="item-userid">User id : <%= string.Format("{0:#,##0}", item.UserId) %></p>
    <p class="item-countclick">Count click : <%= string.Format("{0:#,##0}", item.CountClick) %></p>
</div>

<div class="list-other">
<%for(int i = 0; listOther != null && i < listOther.Count; i++)
{
string Url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].ID.ToString());%>
    <p class="list-other-name"><a href="<%=Url %>"><%= listOther[i].Name %></a></p>
<%}%>
</div>
