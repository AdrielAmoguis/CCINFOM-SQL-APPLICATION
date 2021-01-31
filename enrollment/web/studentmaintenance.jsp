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
                    <li class="navSelected"><a href="#">Student Management</a></li>
                    <li><a href="coursemaintenance.jsp">Course Management</a></li>
                    <li><a href="degreemaintenance.jsp">Degrees Management</a></li>
                    <li><a href="enroll.jsp">Enroll</a></li>
                    <li><a href="drop.jsp">Drop</a></li>
                    <li><a href="report.jsp">Report</a></li>
                </ul>
            </div>
        </div>
        
        <!-- CONTENT -->
        <div id="content">
            <h2>STUDENT MANAGEMENT</h2>
            
            <p style="text-align: center;">
                This module facilitates the management and maintenance of students.
            </p>
            
            <!-- Query Student Record -->
            <hr />
            <h3>Get Student Record by ID</h3>
            <form id="regularForm" name="GetStudentRecord" action="request/getStudent.jsp" method="GET">
                Student ID: <input name="StudentID" type="text" /><br/>
                <center><input type="submit" value="Search for Student"/></center>
            </form>
            
            <!-- Add a Student Record -->
            <hr />
            <h3>Add a Student Record</h3>
            <form id="regularForm" name="AddStudentRecord" action="request/addStudent.jsp" method="POST">
                Student ID: <input name="StudentID" type="text" />
                Complete Name: <input name="StudentName" type="text" />
                Degree ID: <input name="StudentDegree" type="text" /><br />
                <center><input type="submit" value="Add New Student Record"/></center>
            </form>
            
            <!-- Modify Student Record -->
            <hr />
            <h3>Modify a Student's Record</h3>
            <p>Leaving an optional field blank will not modify the student's information for that field.</p>
            <form id="regularForm" name="ModifyStudentRecord" action="request/modStudent.jsp" method="POST">
                Student ID (required): <input name="StudentID" type="text" />
                New Complete Name (optional): <input name="StudentNewName" type="text"/>
                New Degree ID (optional): <input name="StudentNewDegreeID" type="text"/><br/>
                <center><input type="submit" value="Modify Student Record"/></center>
            </form>
            
            <!-- Delete Student Record -->
            <hr />
            <h3>Delete a Student Record</h3>
            <form id="regularForm" name="DeleteStudentRecord" action="request/delStudent.jsp" method="POST">
                Student ID: <input name="StudentID" type=""text /><br/>
                <center><input type="submit" value="Delete Student Record"/></center>
            </form>
            
            <hr />
            <h3 style="text-align: center">Program Authors:</h3>
            <p style="text-align: center;">
                AMOGUIS | MANUEL | SO | SUN
            </p>
        </div>
    </body>
</html>
