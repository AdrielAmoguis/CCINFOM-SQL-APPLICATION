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
                    <li><a href="../enroll.jsp">Enroll</a></li>
                    <li><a href="../drop.jsp">Drop</a></li>
                    <li><a href="../report.jsp">Report</a></li>
                </ul>
            </div>
        </div>
        
        <!-- CONTENT -->
        <div id="content">
            <h2>Modify Student Information</h2>
            
            <!-- Instantiate Bean -->
            <jsp:useBean id="getStudentBean" class="enrollment.students" scope="request" />
            <%  
                boolean valid = false;
                if(request.getParameter("StudentID") != null && !request.getParameter("StudentID").isEmpty())
                {
                    // Query by ID
                    try
                    {
                        getStudentBean.studentid = Integer.parseInt(request.getParameter("StudentID"));
                        valid = true;
                    }
                    catch(Exception ex)
                    {
                        System.out.println(ex.getMessage());
                    }
                }
                
                if(valid) {
                // Execute Query
                if(getStudentBean.viewRecord() != 0)
                {
                    if(getStudentBean.completename != null) {
            %>
            <h3>Old Student Information:</h3>
            <p><strong>Student ID:</strong> <%=getStudentBean.studentid%></p>
            <p><strong>Complete Name:</strong> <%=getStudentBean.completename%>
            <p><strong>Degree ID:</strong> <%=getStudentBean.degreeid%>
            <%
                    } else {
                        %> <h3 style="text-align: center;">Student record does not exist.</h3> <%
                    }
                } else
                {   
            %>
            <h3 style="text-align: center;">A problem has occurred. Unable to get student data.</h3>
            <%} }
            else
            {
                // Invalid input
                %>
                <h3>The student ID provided is invalid. Please try again.</h3>
                <%
            }  
            %>
            
            <jsp:useBean id="modStudentBean" class="enrollment.students" scope="request"/>
            <%
                if(getStudentBean.completename != null && valid){
                    modStudentBean.studentid = getStudentBean.studentid;
                    modStudentBean.completename = request.getParameter("StudentNewName");
                    modStudentBean.degreeid = request.getParameter("StudentNewDegreeID");
                    
                    // Check nulls
                    if(modStudentBean.completename.isEmpty()) modStudentBean.completename = getStudentBean.completename;
                    if(modStudentBean.degreeid.isEmpty()) modStudentBean.degreeid = getStudentBean.degreeid;
                    
                    // Execute Query
                    if(modStudentBean.modRecord() != 0)
                    {
                        // Sucess
                        %>
                            <hr/>    
                            <h3>Student Record Updated.</h3>    
                            <h3>Updated Student Information:</h3>
                            <p><strong>Student ID:</strong> <%=modStudentBean.studentid%></p>
                            <p><strong>Complete Name:</strong> <%=modStudentBean.completename%>
                            <p><strong>Degree ID:</strong> <%=modStudentBean.degreeid%>
                        <%
                    }
                    else
                    {
                        // Failure
                        %>
                            <h3>Record Update Failed..</h3>
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
