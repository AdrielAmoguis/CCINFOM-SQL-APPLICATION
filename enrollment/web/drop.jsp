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
<%@page import="java.sql.*, java.util.*" %>
<%@page import="enrollment.drop" %>

<%
    // Redirect user if session already exists
    if(session.getAttribute("dropStatus") != null)
        response.sendRedirect("request/doDrop.jsp");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/styles.css" />
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
                    <li><a href="index.html">Home</a></li>
                    <li><a href="studentmaintenance.jsp">Student Management</a></li>
                    <li><a href="coursemaintenance.jsp">Course Management</a></li>
                    <li><a href="degreemaintenance.jsp">Degrees Management</a></li>
                    <li><a href="enroll.jsp">Enroll</a></li>
                    <li class="navSelected"><a href="drop.jsp">Drop</a></li>
                    <li><a href="report.jsp">Report</a></li>
                </ul>
            </div>
        </div>
        
        <!-- CONTENT -->
        <div id="content">
            <h2>Enrollment</h2>
            
            <p style="text-align: center;">
                This module facilitates course dropping for enrolled students.
            </p>
            
            <hr />
            <h3>Drop Courses</h3>
            <form id="regularForm" name="DropDetails" action="request/doDrop.jsp" method="POST">
                Student ID: <input name="StudentID" type="text" />
                Current Term: <input name="CurrentTerm" type="text" />
                Current School Year: <input name="SchoolYear" type="text" /><br />
                <center><input type="submit" value="Submit Student Details"/></center>
            </form>
            
            <hr />
            <h3 style="text-align: center">Program Authors:</h3>
            <p style="text-align: center;">
                AMOGUIS | MANUEL | SO | SUN
            </p>
        </div>
    </body>
</html>
