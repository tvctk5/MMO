﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.CPViewControl" %>
<%
    var model = ViewBag.Model as ModProduct_CommentsModel;
    var listItem = ViewBag.Data as List<ModProduct_CommentsEntity>;

    var sListId = string.Empty;
    var ListProduct = new List<ModProduct_InfoEntity>();
    if (listItem != null && listItem.Count > 0)
    {
        sListId = VSW.Core.Global.Array.ToString(listItem.Select(o => o.ProductInfoId).ToArray());
        ListProduct = ModProduct_InfoService.Instance.CreateQuery().WhereIn(o => o.ID, sListId).Select(o => new ModProduct_InfoEntity() { ID = o.ID, Name = o.Name }).ToList();
    }

    if (ListProduct == null)
        ListProduct = new List<ModProduct_InfoEntity>();
%>
<form id="vswForm" name="vswForm" method="post">
<input type="hidden" id="_vsw_action" name="_vsw_action" />
<input type="hidden" id="boxchecked" name="boxchecked" value="0" />
<div id="toolbar-box">
    <div class="t">
        <div class="t">
            <div class="t">
            </div>
        </div>
    </div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%=GetDefaultListCommand()%>
        </div>
        <div class="pagetitle icon-48-generic">
            <h2>
                Danh sách các bình luận sản phẩm</h2>
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
<div class="clr">
</div>
<script type="text/javascript">

    var VSWController = 'ModProduct_Comments';

    var VSWArrVar = [
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
                    '20', 'PageSize'
                  ];
</script>
<%= ShowMessage()%>
<div id="element-box">
    <div class="t">
        <div class="t">
            <div class="t">
            </div>
        </div>
    </div>
    <div class="m">
        <table>
            <tr>
                <td width="100%">
                    Lọc:
                    <input type="text" id="filter_search" value="<%= model.SearchText %>" class="text_area"
                        onchange="VSWRedirect();return false;" />
                    <button onclick="VSWRedirect();return false;">
                        Tìm kiếm</button>
                </td>
                <td nowrap="nowrap">
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
                        <%= GetSortLink("Sản phẩm", "ProductInfoId")%>
                    </th>
                    <th class="title">
                        <%= GetSortLink("Người bình luận", "Name")%>
                    </th>
                    <th class="title">
                        <%= GetSortLink("Nội dung", "Content")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Approved", "Approved")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Ngày bình luận", "CreateDate")%>
                    </th>
                    <th width="1%" nowrap="nowrap" class="hide">
                        <%= GetSortLink("Duyệt", "Activity")%>
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
                    <td align="right" nowrap="nowrap">
                        <%= i + 1%>
                    </td>
                    <td align="center">
                        <%= GetCheckbox(listItem[i].ID, i)%>
                    </td>
                    <td align="right" nowrap="nowrap">
                        <%= listItem[i].ID%>
                    </td>
                    <td align="left" style="width: 25%">
                        <% var objProduct = ListProduct.Where(o => o.ID == listItem[i].ProductInfoId).FirstOrDefault();
                           if (objProduct == null)
                               objProduct = new ModProduct_InfoEntity();
                        %>
                        <a href="javascript:RedirectController('ModProduct_Info','Add', <%= listItem[i].ProductInfoId %>)">
                            <%= objProduct.Name%>
                        </a>
                    </td>
                    <td nowrap="nowrap">
                        <%= listItem[i].Name%>
                    </td>
                    <td style="width: 100%">
                        <a href="javascript:VSWRedirect('Add', <%= listItem[i].ID %>)">
                            <p>
                                <%= listItem[i].Content%></p>
                        </a>
                    </td>
                    <td align="center">
                        <a class="jgrid" href="javascript:void(0);" onclick="vsw_exec_cmd('[approvedgx][<%= listItem[i].ID %>,<%= !listItem[i].Approved %>]')">
                            <span class="jgrid"><span class="state <%= listItem[i].Approved ? "publish" : "unpublish" %>">
                            </span></span></a>
                    </td>
                    <td align="center">
                        <%= string.Format("{0:dd/MM/yyyy HH:mm}", listItem[i].CreateDate) %>
                    </td>
                    <td align="center" class="hide">
                        <%= GetPublish(listItem[i].ID, listItem[i].Activity)%>
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
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
