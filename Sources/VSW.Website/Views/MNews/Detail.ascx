<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<% 
    var item = ViewBag.Data as ModNewsEntity;
    var listOther = ViewBag.Other as List<ModNewsEntity>;

    var listComment = ViewBag.Comment as List<ModCommentEntity>;
    var model = ViewBag.Model as MNewsModel;
    if (model == null)
        model = new MNewsModel();

    var itemComment = ViewBag.AddComment as ModCommentEntity;
    if (itemComment == null)
    {
        itemComment = new ModCommentEntity();

        itemComment.Name = Cookies.GetValue("Web.Comment.Name", true);
        itemComment.Email = Cookies.GetValue("Web.Comment.Email", true);
    }

    var Url = ViewPage.GetURL(item.MenuID, item.Code);
    string image = "~/Content/images/uploading.gif";
    if (string.IsNullOrEmpty(item.File))
        item.File = image;
%>
<head class="headsub" prefix="og: http://ogp.me/ns# fb:http://ogp.me/ns/fb# article:http://ogp.me/ns/article#">
<!-- You can use open graph tags to customize link previews.
    Learn more: https://developers.facebook.com/docs/sharing/webmasters< %=Url % > -->
	<meta property="og:url" content="{RS:Web_CurrentSite}<%=Url%>" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="<%= ViewPage.CurrentPage.PageTitle %>" />
	<meta property="og:description" content="<%= ViewPage.CurrentPage.PageDescription %>" />
	<meta property="og:image" content="{RS:Web_CurrentSite}<%=Utils.GetResizeFile(item.File, 2, 120, 130)%>" />
    <script type="text/javascript" src="https://apis.google.com/js/plusone.js" ></script>
</head>
<div class="news-detail">
    <div class="site-map"><i class="fa fa-star"></i> <%= ViewPage.CurrentPage.Name %> <i class="fa fa-angle-double-right"></i> </div>
    <div class="detail">
        <div class="title">
            <%=item.Name%></div>
        <div class="content">
            <%= Utils.GetHTMLForSeo(item.Content) %>
        </div>
        <div class="like-share">
            <!-- Your like button code -->
            <div class="fb-like" data-href="{RS:Web_CurrentSite}<%=Url %>" data-layout="button_count" data-action="like" data-size="small" data-show-faces="false" data-share="true"></div>
            <g:plusone size="medium"></g:plusone>
        </div>
        <div class="facebook-comment">
            <div class="fb-comments" data-href="{RS:Web_CurrentSite}<%=Url %>" data-numposts="5" width="100%"></div>
        </div>
        <div class="tag">
            <p>
                <b><i class="fa fa-tags"></i> Tags </b>:
                <% if (!string.IsNullOrEmpty(item.Tags))
                   {
                       string[] ArrTag = item.Tags.Split(',');%>
                <%for (int i = 0; i < ArrTag.Length; i++)
                  {
                      ArrTag[i] = ArrTag[i].Trim();%>
                <%if (i > 0)
                  { %>
                ,
                <%} %>
                <a href="<%= ViewPage.GetURL("Tag", Data.GetCode(ArrTag[i])) %>" title="<%= ArrTag[i] %>">
                    <%= ArrTag[i]%></a>
                <%} %>
                <%} %>
            </p>
        </div>
        <div class="list-other">
            <div class="title"><i class="fa fa-list "></i> {RS:Web_OtherNews}</div>
            <div class="list-news-other">
                <ul>
                    <%for (int i = 0; listOther != null && i < listOther.Count; i++)
                      {
                          string urlDetail = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);
                    %>
                        <li><a href="<%=urlDetail %>"><i class="fa fa-angle-double-right"></i> <%=listOther[i].Name%> </a></li>
                    <%} %>
                </ul>
            </div>
        </div>
    </div>
</div>

<%--<div class="box100 mg">
    <div class="boxtitle">
        <h5 class="font_title pl">
            <%= ViewPage.CurrentPage.Name %>
            >>
        </h5>
    </div>
    <div class="boxvien" style="padding: 10px;">
        <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td style="border-bottom: #999999 dotted 1px; padding-bottom: 15px; padding-top: 10px;">
                    <h1>
                        <%=item.Name%></h1>
                    <br />
                    <%= Utils.GetHTMLForSeo(item.Content) %>
                    <p>
                        <b>Tags </b>:
                        <% if (!string.IsNullOrEmpty(item.Tags))
                           {
                               string[] ArrTag = item.Tags.Split(',');%>
                        <%for (int i = 0; i < ArrTag.Length; i++)
                          {
                              ArrTag[i] = ArrTag[i].Trim();%>
                        <%if (i > 0)
                          { %>
                        ,
                        <%} %>
                        <a href="<%= ViewPage.GetURL("Tag", Data.GetCode(ArrTag[i])) %>" title="<%= ArrTag[i] %>">
                            <%= ArrTag[i]%></a>
                        <%} %>
                        <%} %>
                    </p>--%>
                    <%--                    <form method="post" class="hide">
                    <table width="100%" class="hide">
                      <tr>
                         <td colspan="2" align="center"><h3> <b><%if (item.getCountComment() > 0)
                                                { %><%= item.getCountComment()%> <%}
                                                else
                                                { %>chưa có<%} %> bình luận &#8220;<%= item.Name%>&#8221;</b></h3></td>
                      </tr>
                      <%for (int i = 0; listComment != null && i < listComment.Count; i++)
                        {%>
                      <tr>
                        <td><b><%=listComment[i].Name%></b> viết:</td>
                        <td><%=listComment[i].Content.Replace("\n","<br />")%></td>
                      </tr>
                      <%} %>  
                      <tr>
                        <td colspan="2" style="padding-top: 6px;" class="navigation">
                           <div id="paginationControl">
                           <%if (model.TotalRecord > model.PageSize)
                           {%>
                              <%= GetPagination(Url, model.Page, model.PageSize, model.TotalRecord)%>
                          <%} %></div></td>
                      </tr>
                      <tr>
                         <td colspan="2" align="center"><h3> <b>Viết bình luận</b></h3></td>
                      </tr>
                      <tr>
                        <td>Họ và tên </td>
                        <td><input name="Name" id="Name" value="<%=itemComment.Name %>" size="28" tabindex="1" type="text"> (bắt buộc)</td>
                      </tr>
                      <tr>
                        <td>Email </td>
                        <td><input name="Email" id="Email" value="<%=itemComment.Email %>" size="28" tabindex="1" type="text"> (bắt buộc)</td>
                      </tr>
                      <tr>
                        <td>Nội dung </td>
                        <td><textarea name='Content' id='Content' cols='60' rows='10' tabindex='4'><%=itemComment.Content%></textarea> (bắt buộc)</td>
                      </tr>
                      <tr>
                         <td colspan="2" align="center"><input name="_vsw_action[AddCommentPOST]" type="submit" value="Gửi bình luận" /></td>
                      </tr>
                    </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td style="padding-top: 6px;">
                    <div class="title_tintuc_cl">
                        <b>{RS:Web_OtherNews}</b></div>
                    <div style="padding: 11px 0 9px 27px;">
                        <%for (int i = 0; listOther != null && i < listOther.Count; i++)
                          {
                              string urlDetail = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);
                        %>
                        <div class="font_titleother">
                            <li><a href="<%=urlDetail %>">
                                <%=listOther[i].Name%>
                            </a></li>
                        </div>
                        <%} %>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>--%>
