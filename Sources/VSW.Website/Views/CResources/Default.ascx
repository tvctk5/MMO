<%@ Control Language="C#" AutoEventWireup="true" Inherits="VSW.Lib.MVC.ViewControl" %>
<%

    var Data = ViewBag.Data as VSW.Lib.Models.WebResourceEntity;
%>

<%=
Data.Value
%>