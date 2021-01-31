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
<%@page import="enrollment.students"%>

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
            <h2>Add Student Record</h2>
            
            <p style="text-align: center;">
                Adding the new student record.
            </p>
            
            <!-- Instantiate Bean -->
            <jsp:useBean id="addStudentBean" class="enrollment.students" scope="request" />
            <%
                boolean valid = false;
                try
                {
                    addStudentBean.studentid = Integer.parseInt(request.getParameter("StudentID"));
                    addStudentBean.completename = request.getParameter("StudentName");
                    addStudentBean.degreeid = request.getParameter("StudentDegree");
                    valid = true;
                }
                catch(Exception ex)
                {
                    System.out.println(ex.getMessage());
                }
                if(valid){
            %>
            
            <!-- Execute Query -->
            <% if(addStudentBean.addRecord() != 0) {%>
            <h3 style="text-align: center;">New Student Record was added successfully.</h3>
            <h4>Student Information:</h4>
            <p><strong>Student ID:</strong> <%=addStudentBean.studentid%></p>
            <p><strong>Complete Name:</strong> <%=addStudentBean.completename%>
            <p><strong>Degree ID:</strong> <%=addStudentBean.degreeid%>
            
            <% } else { %>
            <h3 style="text-align: center;">A problem has occurred. Add New Record unsuccessful.</h3>
            <% } } 
            else
            {
                // Invalid input
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
