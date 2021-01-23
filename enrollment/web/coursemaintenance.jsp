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
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@page import="java.sql.*, java.util.*" %>
<%@page import="enrollment.students"%>

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
                    <li class="navSelected"><a href="#">Course Management</a></li>
                    <li><a href="enroll.jsp">Enroll</a></li>
                    <li><a href="drop.jsp">Drop</a></li>
                    <li><a href="report.jsp">Report</a></li>
                </ul>
            </div>
        </div>
        
        <!-- CONTENT -->
        <div id="content">
            <h2>COURSE MANAGEMENT</h2>
            
            <p style="text-align: center;">
                This module facilitates the management and maintenance of available courses.
            </p>
            
            <!-- Query Course Record -->
            <hr />
            <h3>Get Course Record by ID</h3>
            <form id="regularForm" name="GetCourseRecord" action="request/getCourse.jsp" method="GET">
                Course ID: <input name="CourseID" type="text" /><br/>
                <center><input type="submit" value="Search for Course"/></center>
            </form>
            
            <!-- Add a Student Record -->
            <hr />
            <h3>Add a Course Record</h3>
            <form id="regularForm" name="AddCourseRecord" action="request/addCourse.jsp" method="POST">
                Course ID: <input name="CourseID" type="text" />
                Course Name: <input name="CourseName" type="text" />
                Course Department: <input name="CourseDepartment" type="text" /><br />
                <center><input type="submit" value="Add New Course Record"/></center>
            </form>
            
            <!-- Modify Student Record -->
            <hr />
            <h3>Modify a Course's Record</h3>
            <p>Leaving an optional field blank will not modify the course's information for that field.</p>
            <form id="regularForm" name="ModifyCourseRecord" action="request/modCourse.jsp" method="POST">
                Course ID (required): <input name="CourseID" type="text" />
                New Course Name (optional): <input name="CourseNewName" type="text"/>
                New Department (optional): <input name="CourseNewDepartment" type="text"/><br/>
                <center><input type="submit" value="Modify Course Record"/></center>
            </form>
            
            <!-- Delete Student Record -->
            <hr />
            <h3>Delete a Course Record</h3>
            <form id="regularForm" name="DeleteCourseRecord" action="request/delCourse.jsp" method="POST">
                Course ID: <input name="CourseID" type="text" /><br/>
                <center><input type="submit" value="Delete Course Record"/></center>
            </form>
            
            <hr />
            <h3 style="text-align: center">Program Authors:</h3>
            <p style="text-align: center;">
                AMOGUIS | MANUEL | SO | SUN
            </p>
        </div>
    </body>
</html>
