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
            dropBean.confirmDrop(); 

            // Invalidate session (to reset the enrollBean)
            session.removeAttribute("dropStatus");
            session.invalidate();
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../assets/styles.css" />
        <title>The Better Enrollment System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="5; URL=../index.html" />
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
                    <li class="navSelected"><a href="../drop.jsp">Drop</a></li>
                    <li><a href="../report.jsp">Report</a></li>
                </ul>
            </div>
        </div>
        
        <!-- CONTENT -->
        <div id="content">
            <h2>Drop</h2>
            
            <p style="text-align: center;">
                This module facilitates student dropping.
            </p>
            
            <hr />
            <h3>The selected courses have been dropped.</h3>
            <p>You will be redirected to the home page in 5 seconds.</p>
            
            <hr />
            <h3 style="text-align: center">Program Authors:</h3>
            <p style="text-align: center;">
                AMOGUIS | MANUEL | SO | SUN
            </p>
        </div>
    </body>
</html>
