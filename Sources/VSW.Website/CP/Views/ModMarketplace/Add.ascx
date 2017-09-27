<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl" %>

<script language="javascript" type="text/javascript">
function CheckValidationForm() {
 return true; 
}
</script>

<%
    var model = ViewBag.Model as ModMarketplaceModel;
    var item = ViewBag.Data as ModMarketplaceEntity;
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
            <h2>Marketplace : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <label>Tên :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Name" id="Name" value="<%=item.Name %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Website link :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="WebsiteLink" id="WebsiteLink" value="<%=item.WebsiteLink %>" maxlength="255" />
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