<%-- 
    Document   : addToEnrollmentCart
    Created on : 01 27, 21, 3:01:22 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="enrollment.coursedegree" %>
<%@page import="enrollment.drop" %>

<jsp:useBean id="dropBean" class="enrollment.drop" scope="session" />
        <%
            dropBean.clearDrop(); 
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="0; URL=drop.jsp" />
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>
