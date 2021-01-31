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
<%@page import="enrollment.coursedegree"%>
<%@page import="enrollment.degree"%>
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
                    <li><a href="../degreemaintenance.jsp">Degrees Management</a></li>
                    <li><a href="../enroll.jsp">Enroll</a></li>
                    <li><a href="../drop.jsp">Drop</a></li>
                    <li><a href="../report.jsp">Report</a></li>
                </ul>
            </div>
        </div>
        
        <!-- CONTENT -->
        <div id="content">
            <h2>Link Course Record</h2>
            
            <!-- Instantiate Bean -->
            <jsp:useBean id="getCourseBean" class="enrollment.courses" scope="request" />
            <jsp:useBean id="getDegreeBean" class="enrollment.degree" scope="request" />
            
            <%
                // Get request to course and degree beans
                try
                {
                    // Initialize Data
                    getCourseBean.courseid = request.getParameter("CourseID");
                    getDegreeBean.degreeid = request.getParameter("DegreeID");
                    
                    if(getCourseBean.viewRecord() != 0 && getDegreeBean.viewRecord() != 0)
                    {
                        // Check if course or degree exists
                        if(getCourseBean.coursename != null && !getCourseBean.coursename.isEmpty())
                        {
                            if(getDegreeBean.degreename != null && !getDegreeBean.degreename.isEmpty())
                            {
                                // Proceed with link
                                coursedegree linkBean = new coursedegree();
                                linkBean.courseid = getCourseBean.courseid;
                                linkBean.degree = getDegreeBean.degreeid;
                                if(linkBean.addRecord() != 0)
                                {
                                    %>
                                    <h3>Link successful.</h3>
                                    <%
                                }
                                else
                                {
                                    %>
                                    <h3>There was a problem creating the link. Please try again.</h3>
                                    <%
                                }
                            }
                            else
                            {
                                %>
                                <h3>The specified degree does not exist. Please try again.</h3>
                                <%
                            }
                        }
                        else
                        {
                            %>
                            <h3>The specified course does not exist. Please try again.</h3>
                            <%
                        }
                    }
                    else
                    {
                        %>
                        <h3>An error occurred while fetching course or degree data. Please try again.</h3>
                        <%
                    }
                }
                catch(Exception ex)
                {
                    // Failure
                    %>
                    <h3>One or more of your inputs were invalid. Please try again.</h3>
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
