<%-- 
    Document   : addToEnrollmentCart
    Created on : 01 27, 21, 3:01:22 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="enrollment.coursedegree" %>
<%@page import="enrollment.enroll" %>

<jsp:useBean id="dropBean" class="enrollment.drop" scope="session" />
        <%
            if(request.getParameter("removeCourseID") != null && !request.getParameter("removeCourseID").isEmpty())
            {
                enrollment.enrollment em = new enrollment.enrollment();
                em.courseid = request.getParameter("removeCourseID");
                em.studentid = dropBean.Student.studentid;
                em.term = dropBean.cur_term;
                em.schoolyear = dropBean.sYear;
                
                dropBean.DropList.remove(em);
            }
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="0; URL=doDrop.jsp" />
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>
