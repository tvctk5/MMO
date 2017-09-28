<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl" %>

<script language="javascript" type="text/javascript">
function CheckValidationForm() {
 return true; 
}
</script>

<%
    var model = ViewBag.Model as ModMMO_ProductModel;
    var item = ViewBag.Data as ModMMO_ProductEntity;
%>

<form id="vswForm" name="vswForm" method="post">
<input type="hidden" id="_vsw_action" name="_vsw_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <!--GetDefaultAddCommand()-->
            <%= GetDefaultAddCommandValidation()%>
     </div>
        <div class="pagetitle icon-48-generic">
            <h2>M m o_ product : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>
<div class="clr"></div>

<%= ShowMessage()%>

<div id="element-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="col width-100">
          <table class="admintable">
           <tr>
                <td class="key">
                    <label>S k u :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="SKU" id="SKU" value="<%=item.SKU %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Tên :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Name" id="Name" value="<%=item.Name %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Display name :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DisplayName" id="DisplayName" value="<%=item.DisplayName %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Page title :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="PageTitle" id="PageTitle" value="<%=item.PageTitle %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Page description :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="PageDescription" id="PageDescription" value="<%=item.PageDescription %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Page keywords :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="PageKeywords" id="PageKeywords" value="<%=item.PageKeywords %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Sale price :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="SalePrice" id="SalePrice" value="<%=item.SalePrice %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Discounted price :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DiscountedPrice" id="DiscountedPrice" value="<%=item.DiscountedPrice %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Discounted percentage :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DiscountedPercentage" id="DiscountedPercentage" value="<%=item.DiscountedPercentage %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Discounted value :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DiscountedValue" id="DiscountedValue" value="<%=item.DiscountedValue %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Currency id :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="CurrencyId" id="CurrencyId" value="<%=item.CurrencyId %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Category_ l v1 :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Category_LV1" id="Category_LV1" value="<%=item.Category_LV1 %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Category_ l v2 :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Category_LV2" id="Category_LV2" value="<%=item.Category_LV2 %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Category_ l v3 :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Category_LV3" id="Category_LV3" value="<%=item.Category_LV3 %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Category_ l v1_ id :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Category_LV1_Id" id="Category_LV1_Id" value="<%=item.Category_LV1_Id %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Category_ l v2_ id :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Category_LV2_Id" id="Category_LV2_Id" value="<%=item.Category_LV2_Id %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Category_ l v3_ id :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Category_LV3_Id" id="Category_LV3_Id" value="<%=item.Category_LV3_Id %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Category path :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="CategoryPath" id="CategoryPath" value="<%=item.CategoryPath %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Image1 :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Image1" id="Image1" value="<%=item.Image1 %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Image2 :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Image2" id="Image2" value="<%=item.Image2 %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Image3 :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Image3" id="Image3" value="<%=item.Image3 %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Image4 :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Image4" id="Image4" value="<%=item.Image4 %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Image5 :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Image5" id="Image5" value="<%=item.Image5 %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>URL :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Url" id="Url" value="<%=item.Url %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Redirect url :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="RedirectUrl" id="RedirectUrl" value="<%=item.RedirectUrl %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Hãng sản xuất :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Brand" id="Brand" value="<%=item.Brand %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Brand id :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="BrandId" id="BrandId" value="<%=item.BrandId %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Status :</label>
                </td>
                <td>
                    <input name="Status" <%= item.Status ? "checked" : "" %> type="radio" value='1' /> Có
                    <input name="Status" <%= !item.Status ? "checked" : "" %> type="radio" value='0' /> Không
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Chuyên mục :</label>
                </td>
                <td>
                     <select name="MenuID" id="MenuID" class="text_input">
                         <option value="0">Root</option>
                         <%= Utils.ShowDDLMenuByType("MMO_Product", model.LangID, item.MenuID)%> 
                    </select>
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Ngôn ngữ :</label>
                </td>
                <td>
                     <%--<select name="LangID" id="LangID" class="text_input">
                         <option value="0">-</option>
                         <%= Utils.ShowDDLMenuByType2("Lang", model.LangID, item.LangID)%> 
                    </select>--%>
                    <%= ShowDDLLang(model.LangID)%>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>User id :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="UserId" id="UserId" value="<%=item.UserId %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Count click :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="CountClick" id="CountClick" value="<%=item.CountClick %>" maxlength="255" />
                </td>
            </tr>
          </table>
        </div>                
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>
<div class="toolbar-box">
	<div class="t">
		<div class="t">
			<div class="t">
			</div>
		</div>
	</div>
	<div class="m">
		<div class="toolbar-list">
			<%= GetDefaultAddCommandValidation()%>
		</div>
		<div class="clr">
		</div>
	</div>
	<div class="b">
		<div class="b">
			<div class="b">
			</div>
		</div>
	</div>
</div>

</form>