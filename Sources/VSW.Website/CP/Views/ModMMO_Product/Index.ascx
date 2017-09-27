<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl"%>

<%
    var model = ViewBag.Model as ModMMO_ProductModel;
    var listItem = ViewBag.Data as List<ModMMO_ProductEntity>;
%>

<form id="vswForm" name="vswForm" method="post">

<input type="hidden" id="_vsw_action" name="_vsw_action" />
<input type="hidden" id="boxchecked" name="boxchecked" value="0" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%=GetDefaultListCommand()%>
        </div>
        <div class="pagetitle icon-48-generic">
            <h2>M m o_ product</h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"> <div class="b"></div></div></div>
</div>
<div class="clr"></div>

<script type="text/javascript">

    var VSWController = 'ModMMO_Product';

    var VSWArrVar = [
                        'filter_menu', 'MenuID',
                        'filter_lang', 'LangID',  
                        'limit', 'PageSize'
                   ];


    var VSWArrVar_QS = [
                        'filter_search', 'SearchText'
                      ];

    var VSWArrQT = [
                      '<%= model.PageIndex + 1 %>', 'PageIndex', 
                      '<%= model.Sort %>', 'Sort'
                  ];

    var VSWArrDefault =
                  [
                    '1', 'PageIndex',
                    '1', 'LangID',
                    '20', 'PageSize'
                  ];
</script>

<%= ShowMessage()%>

<div id="element-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">

       <table>
            <tr>
                <td width="100%">
                     Lọc: <input type="text" id="filter_search" value="<%= model.SearchText %>" class="text_area" onchange="VSWRedirect();return false;" />
                    <button onclick="VSWRedirect();return false;">Tìm kiếm</button>
                </td>
                <td nowrap="nowrap">
                   Chuyên mục : 
                    <select id="filter_menu" onchange="VSWRedirect()" class="inputbox" size="1">
                         <option value="0">(Tất cả)</option>
                         <%= Utils.ShowDDLMenuByType("MMO_Product", model.LangID, model.MenuID)%> 
                    </select>
                   Ngôn ngữ :<%= ShowDDLLang(model.LangID)%>
                </td>
            </tr>
        </table>

        <table class="adminlist" cellspacing="1">
            <thead>
                <tr>
                    <th width="1%">
                        #
                    </th>
                    <th width="1%">
                        <input type="checkbox" name="toggle" value="" onclick="checkAll(<%= model.PageSize %>);" />
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("ID", "ID")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("S k u", "SKU")%>
                    </th>
                    <th class="title">
                        <%= GetSortLink("Tên", "Name")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Display name", "DisplayName")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Page title", "PageTitle")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Page description", "PageDescription")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Page keywords", "PageKeywords")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Sale price", "SalePrice")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Discounted price", "DiscountedPrice")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Discounted percentage", "DiscountedPercentage")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Discounted value", "DiscountedValue")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Currency id", "CurrencyId")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Category_ l v1", "Category_LV1")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Category_ l v2", "Category_LV2")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Category_ l v3", "Category_LV3")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Category_ l v1_ id", "Category_LV1_Id")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Category_ l v2_ id", "Category_LV2_Id")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Category_ l v3_ id", "Category_LV3_Id")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Category path", "CategoryPath")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Image1", "Image1")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Image2", "Image2")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Image3", "Image3")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Image4", "Image4")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Image5", "Image5")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("URL", "Url")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Redirect url", "RedirectUrl")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Hãng sản xuất", "Brand")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Brand id", "BrandId")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Status", "Status")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Chuyên mục", "MenuID")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Ngôn ngữ", "LangID")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("User id", "UserId")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Count click", "CountClick")%>
                    </th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td colspan="15">
                        <del class="container">
                            <%= GetPagination(model.PageIndex, model.PageSize, model.TotalRecord)%>
                        </del>
                    </td>
                </tr>
            </tfoot>
            <tbody>
               <%for (int i = 0; listItem != null && i < listItem.Count; i++)
                 { %>
                <tr class="row<%= i%2 %>">
                    <td align="center">
                        <%= i + 1%>
                    </td>
                    <td align="center">
                        <%= GetCheckbox(listItem[i].ID, i)%>
                    </td>
                    <td align="center">
                       <%= listItem[i].ID%>
                    </td>
                    <td align="center">
                       <%= listItem[i].SKU%>
                    </td>
                    <td>
                        <a href="javascript:VSWRedirect('Add', <%= listItem[i].ID %>)"><%= listItem[i].Name%></a>
                    </td>
                    <td align="center">
                       <%= listItem[i].DisplayName%>
                    </td>
                    <td align="center">
                       <%= listItem[i].PageTitle%>
                    </td>
                    <td align="center">
                       <%= listItem[i].PageDescription%>
                    </td>
                    <td align="center">
                       <%= listItem[i].PageKeywords%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:#,##0}", listItem[i].SalePrice)%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:#,##0}", listItem[i].DiscountedPrice)%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:#,##0}", listItem[i].DiscountedPercentage)%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:#,##0}", listItem[i].DiscountedValue)%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:#,##0}", listItem[i].CurrencyId)%>
                    </td>
                    <td align="center">
                       <%= listItem[i].Category_LV1%>
                    </td>
                    <td align="center">
                       <%= listItem[i].Category_LV2%>
                    </td>
                    <td align="center">
                       <%= listItem[i].Category_LV3%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:#,##0}", listItem[i].Category_LV1_Id)%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:#,##0}", listItem[i].Category_LV2_Id)%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:#,##0}", listItem[i].Category_LV3_Id)%>
                    </td>
                    <td align="center">
                       <%= listItem[i].CategoryPath%>
                    </td>
                    <td align="center">
                       <%= listItem[i].Image1%>
                    </td>
                    <td align="center">
                       <%= listItem[i].Image2%>
                    </td>
                    <td align="center">
                       <%= listItem[i].Image3%>
                    </td>
                    <td align="center">
                       <%= listItem[i].Image4%>
                    </td>
                    <td align="center">
                       <%= listItem[i].Image5%>
                    </td>
                    <td align="center">
                       <%= listItem[i].Url%>
                    </td>
                    <td align="center">
                       <%= listItem[i].RedirectUrl%>
                    </td>
                    <td align="center">
                       <%= listItem[i].Brand%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:#,##0}", listItem[i].BrandId)%>
                    </td>
                    <td align="center">
                       <a class="jgrid" href="javascript:void(0);" onclick="vsw_exec_cmd('[statusgx][<%= listItem[i].ID %>,<%= !listItem[i].Status %>]')">
                          <span class="jgrid">
                             <span class="state <%= listItem[i].Status ? "publish" : "unpublish" %>"></span>
                          </span>
                       </a>
                    </td>
                    <td align="center">
                       <%= GetName(listItem[i].getMenu()) %>
                    </td>
                    <td align="center">
                       <%= GetName(listItem[i].getLang()) %>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:#,##0}", listItem[i].UserId)%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:#,##0}", listItem[i].CountClick)%>
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
                            
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>
