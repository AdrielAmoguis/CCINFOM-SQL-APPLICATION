<%-- 
    Document   : logout
    Created on : 01 31, 21, 10:35:52 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("../index.html");
%>