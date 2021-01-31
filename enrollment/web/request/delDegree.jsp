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
<%@page import="enrollment.degree"%>

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
            <h2>Delete Degree Record</h2>
            
            <!-- Instantiate Bean -->
            <jsp:useBean id="getDegreeBean" class="enrollment.degree" scope="request" />
            <jsp:useBean id="delDegreeBean" class="enrollment.degree" scope="request" />
            <%
                getDegreeBean.degreeid = request.getParameter("DegreeID");
                if(getDegreeBean.degreeid != null && !getDegreeBean.degreeid.isEmpty())
                {
                     // Load data
                    if(getDegreeBean.viewRecord() != 0)
                    {
                        // Success
                        // If exists
                        if(getDegreeBean.degreename != null)
                        {
                            // Execute Deletion
                            delDegreeBean.degreeid = getDegreeBean.degreeid;
                            
                            if(delDegreeBean.delRecord() != 0)
                            {
                                // Success
                                %>
                                    <h3>Degree record has been successfully removed.</h3>
                                <%
                            }
                            else
                            {
                                // Failure
                                %>
                                    <h3>An error has occurred. Unable to delete degree data.</h3>
                                <%
                            }
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
                            <h3>An error has occurred. Unable to fetch degree data.</h3>
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
