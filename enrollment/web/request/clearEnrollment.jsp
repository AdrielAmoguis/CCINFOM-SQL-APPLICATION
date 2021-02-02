<%-- 
    Document   : addToEnrollmentCart
    Created on : 01 27, 21, 3:01:22 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="enrollment.coursedegree" %>
<%@page import="enrollment.enroll" %>

<jsp:useBean id="enrollBean" class="enrollment.enroll" scope="session" />
        <%
            enrollBean.clearEnrollment();
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="0; URL=../enroll.jsp" />
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>
