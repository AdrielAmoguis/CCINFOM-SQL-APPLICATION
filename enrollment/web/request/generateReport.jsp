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
<%@page import="enrollment.coursecount" %>

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
                    <li class="navSelected"><a href="../report.jsp">Report</a></li>
                </ul>
            </div>
        </div>
        
        <!-- CONTENT -->
        <div id="content">
            <h2>Report</h2>
            
            <p style="text-align: center;">
                The generated term report is shown below.
            </p>
            
            <jsp:useBean id="reportBean" class="enrollment.report" scope="request" />
            <%
                // Initialize the reportBean
                try
                {
                    reportBean.updateTermYear(Integer.parseInt(request.getParameter("CurrentTerm")), 
                            Integer.parseInt(request.getParameter("SchoolYear")));
                    
                    // Generate the Report
                    if(reportBean.generateReport() != 0)
                    {
                        // Report generated
                        // Display report
                        %>
                        <h3>Enrollment Report</h3>
                        <center><table>
                            <tr>
                                <th>Course</th>
                                <th>Course Name</th>
                                <th>Course Department</th>
                                <th>Number of Students</th>
                            </tr>
                            
                            <%
                                for(coursecount cc : reportBean.ccList)
                                {
                                    %>
                                    <tr>
                                        <td><%=cc.course.courseid%></td>
                                        <td><%=cc.course.coursename%></td>
                                        <td><%=cc.course.department%></td>
                                        <td><%=cc.nStudents%></td>
                                    </tr>
                                    <%
                                }
                            %>
                            
                        </table></center>
                        <%
                    }
                    else
                    {
                        // Failed
                    }
                }
                catch(Exception ex)
                {
                    // Input Error
                    %>
                    <h3>One or more of your inputs were invalid. Please try again.</h3>
                    <%
                }
            %>
            
            <hr />
            <h3 style="text-align: center">Program Authors:</h3>
            <p style="text-align: center;">
                AMOGUIS | MANUEL | SO | SUN
            </p>
        </div>
    </body>
</html>
