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
                    <li><a href="../degreemaintenance.jsp">Degrees Management</a></li>
                    <li><a href="../enroll.jsp">Enroll</a></li>
                    <li><a href="../drop.jsp">Drop</a></li>
                    <li><a href="../report.jsp">Report</a></li>
                </ul>
            </div>
        </div>
        
        <!-- CONTENT -->
        <div id="content">
            <h2>Add Course Record</h2>
            
            <!-- Instantiate Bean -->
            <jsp:useBean id="addCourseBean" class="enrollment.courses" scope="request" />
            <%
              // Initialize Values from HTTP Request
              addCourseBean.courseid = request.getParameter("CourseID");
              addCourseBean.coursename = request.getParameter("CourseName");
              addCourseBean.department = request.getParameter("CourseDepartment");
              
              // Check for null values
              if(addCourseBean.courseid.isEmpty() || addCourseBean.coursename.isEmpty() || addCourseBean.department.isEmpty())
              {
                  // Reject Requests
                  %>
                    <h3>One or more fields you have entered were empty. Please try again.</h3>
                  <%
              }
              else
              {
                // Good Request - carry on
                // Execute Query
                if(addCourseBean.addRecord() != 0)
                {
                    // Successful
                    %>
                    <h3>Inserted Course Data:</h3>
                    <p><strong>Course ID:</strong> <%=addCourseBean.courseid%></p>
                    <p><strong>Course Name:</strong> <%=addCourseBean.coursename%></p>
                    <p><strong>Course Department:</strong> <%=addCourseBean.department%></p>
                    <%
                }
                else
                {
                    // Query Failure
                    %>
                    <h3>An error has occurred. New course record has not been added.</h3>
                    <%
                }
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
