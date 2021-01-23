<!DOCTYPE html>
<!--
    AUTHORS:
        1. AMOGUIS, ADRIEL ISAIAH
        2. MANUEL, SARAH
        3. SO, TIFFANY ANNE
        4. SUN, BENEDICT
    CCINFOM S15
-->
<!-- JSP Imports -->
<%@page import="java.sql.*, java.util.*"%>
<%@page import="enrollment.courses"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../assets/styles.css" />
        <title>The Better Enrollment System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <!-- HEADER -->
        <div id="header">
            
            <!-- Title Bar -->
            <div id="titleBar">
                <h1>The Better Enrollment System</h1>
                <p>Keeping it quick and simple.</p>
            </div>
            <hr />
            
            <!-- Navigation Bar -->
            <div id="nav">
                <ul>
                    <li><a href="../index.html">Home</a></li>
                    <li><a href="../studentmaintenance.jsp">Student Management</a></li>
                    <li><a href="../coursemaintenance.jsp">Course Management</a></li>
                    <li><a href="../enroll.jsp">Enroll</a></li>
                    <li><a href="../drop.jsp">Drop</a></li>
                    <li><a href="../report.jsp">Report</a></li>
                </ul>
            </div>
        </div>
        
        <!-- CONTENT -->
        <div id="content">
            <h2>Get Course Information</h2>
            
            <!-- Instantiate Bean -->
            <jsp:useBean id="getCourseBean" class="enrollment.courses" scope="request" />
            <%
                getCourseBean.courseid = request.getParameter("CourseID");
                if(getCourseBean.courseid != null && !getCourseBean.courseid.isEmpty())
                {
                     // Load data
                    if(getCourseBean.viewRecord() != 0)
                    {
                        // Success
                        // If exists
                        if(getCourseBean.coursename != null)
                        {
                            %>
                                <h3>Course Data:</h3>
                                <p><strong>Course ID:</strong> <%=getCourseBean.courseid%></p>
                                <p><strong>Course Name:</strong> <%=getCourseBean.coursename%></p>
                                <p><strong>Course Department:</strong> <%=getCourseBean.department%></p>
                            <%
                        }
                        else
                        {
                            // Record notfound
                            %>
                                <h3>The requested record cannot be found.</h3>
                            <%
                        }
                    }
                    else
                    {
                        // Failure
                        %>
                            <h3>An error has occurred. Unable to fetch course data.</h3>
                        <%
                    }
                }
                else
                {
                    %>
                    <h3>The field you submitted was empty. Please try again.</h3>
                    <%
                }
            %>
                
            
            <br />
            
            <p>Click an option on the navigation bar to execute another transaction.</br>
            
            <h3 style="text-align: center">Program Authors:</h3>
            <p style="text-align: center;">
                AMOGUIS | MANUEL | SO | SUN
            </p>
        </div>
    </body>
</html>
