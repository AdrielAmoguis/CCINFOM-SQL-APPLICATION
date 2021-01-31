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
                    <li><a href="coursemaintenance.jsp">Course Management</a></li>
                    <li class="navSelected"><a href="degreemaintenance.jsp">Degree Management</a></li>
                    <li><a href="enroll.jsp">Enroll</a></li>
                    <li><a href="drop.jsp">Drop</a></li>
                    <li><a href="report.jsp">Report</a></li>
                </ul>
            </div>
        </div>
        
        <!-- CONTENT -->
        <div id="content">
            <h2>DEGREE MANAGEMENT</h2>
            
            <p style="text-align: center;">
                This module facilitates the management and maintenance of available degree programs.
            </p>
            
            <!-- Query Course Record -->
            <hr />
            <h3>Get Degree Record by ID</h3>
            <form id="regularForm" name="GetDegreeRecord" action="request/getDegree.jsp" method="GET">
                Degree ID: <input name="DegreeID" type="text" /><br/>
                <center><input type="submit" value="Search for Degree"/></center>
            </form>
            
            <!-- Add a Student Record -->
            <hr />
            <h3>Add a Degree Record</h3>
            <form id="regularForm" name="AddDegreeRecord" action="request/addDegree.jsp" method="POST">
                Degree ID: <input name="DegreeID" type="text" />
                Degree Name: <input name="DegreeName" type="text" /><br />
                <center><input type="submit" value="Add New Degree Record"/></center>
            </form>
            
            <!-- Modify Student Record -->
            <hr />
            <h3>Modify a Degree's Record</h3>
            <p>Leaving an optional field blank will not modify the degree's information for that field.</p>
            <form id="regularForm" name="ModifyDegreeRecord" action="request/modDegree.jsp" method="POST">
                Degree ID (required): <input name="DegreeID" type="text" />
                New Degree Name (optional): <input name="NewDegreeName" type="text"/><br/>
                <center><input type="submit" value="Modify Degree Record"/></center>
            </form>
            
            <!-- Delete Student Record -->
            <hr />
            <h3>Delete a Degree Record</h3>
            <form id="regularForm" name="DeleteDegreeRecord" action="request/delDegree.jsp" method="POST">
                Degree ID: <input name="DegreeID" type="text" /><br/>
                <center><input type="submit" value="Delete Degree Record"/></center>
            </form>
            
            <!-- Add Required Course -->
            <hr />
            <h3>Add Required Course</h3>
            <form id="regularForm" name="AddRequiredCourse" action="request/linkCourse.jsp" method="POST">
                Degree ID: <input name="DegreeID" type="text" />
                Course ID: <input name="CourseID" type="text" /><br/>
                <center><input type="submit" value="Require Course"/></center>
            </form>
            
            <!-- Remove Required Course -->
            <hr />
            <h3>Remove Required Course</h3>
            <form id="regularForm" name="AddRequiredCourse" action="request/unlinkCourse.jsp" method="POST">
                Degree ID: <input name="DegreeID" type="text" />
                Course ID: <input name="CourseID" type="text" /><br/>
                <center><input type="submit" value="Unrequire Course"/></center>
            </form>
            
            <hr />
            <h3 style="text-align: center">Program Authors:</h3>
            <p style="text-align: center;">
                AMOGUIS | MANUEL | SO | SUN
            </p>
        </div>
    </body>
</html>
