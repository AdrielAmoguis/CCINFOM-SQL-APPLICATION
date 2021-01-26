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
<%@page import="enrollment.coursedegree" %>
<%@page import="enrollment.enroll" %>

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
                    <li class="navSelected"><a href="../enroll.jsp">Enroll</a></li>
                    <li><a href="../drop.jsp">Drop</a></li>
                    <li><a href="../report.jsp">Report</a></li>
                </ul>
            </div>
        </div>
        
        <!-- CONTENT -->
        <div id="content">
            <h2>Enrollment</h2>
            
            <p style="text-align: center;">
                This module facilitates student enrollment.
            </p>
           
            <hr />
            <!-- Load student data -->
            <jsp:useBean id="enrollBean" class="enrollment.enroll" scope="session" />
            <%
                if(request.getParameter("SelectedCourse") != null && !request.getParameter("SelectedCourse").isEmpty())
                {
                    enrollment.enrollment em = new enrollment.enrollment();
                    em.studentid = enrollBean.Student.studentid;
                    em.courseid = request.getParameter("SelectedCourse");
                    em.term = enrollBean.cur_term;
                    em.schoolyear = enrollBean.sYear;
                    em.viewRecord();
                    
                    if(!enrollBean.isEnrolled(em.courseid))
                        enrollBean.EnrollmentList.add(em);
                }
                try
                {
                    if(!enrollBean.loggedin)
                        enrollBean.loginStudent(Integer.parseInt(request.getParameter("StudentID")), Integer.parseInt(request.getParameter("CurrentTerm")), Integer.parseInt(request.getParameter("SchoolYear")));
                    
                    // Display user logged in
                    %>
                    <p>Welcome back, <strong><%=enrollBean.Student.completename%></strong>!</p>
                    <%
                    
                    // Show the student his currently enrolled courses
                    if(enrollBean.EnrollmentList.size() > 0)
                    {
                        %>
                        <h3>Your current enrollment cart</h3>
                        <center>
                        <table id="cartCourses" style="margin-bottom: 15px;">
                            <tr><th>Course</th></tr>
                        <%
                        for(enrollment.enrollment em : enrollBean.EnrollmentList)
                        {
                            %>
                            <tr>
                                <td><%=em.courseid%></td>
                            </tr>
                            <%
                        }
                        %>
                        </table></center>
                        <form id="regularForm" name="removeCourse" method ="POST" action="removeFromEnrollment.jsp">
                            <center>Select CourseID to remove: <input name="removeCourseID" type="text"/><br /></center>
                            <center><input type="submit" value="Remove Course"/></center>
                        </form>
                        <form id="regularForm" name="ClearEnrollment" action="clearEnrollment.jsp" method="POST">
                            <center><input type="submit" value="Clear Enrollment List"/></center>
                        </form>
                        <%
                    }
                    
                    if(enrollBean.loadCourses() != 0)
                    {
                    
                        %>
                        <form id="regularForm" name="GetCourses" action="doEnroll.jsp" method="POST">
                            Select a course to add to your enrollment list: <br />
                            <select name="SelectedCourse" id="ChosenCourse">
                                <%
                                  for(int i = 0; i < enrollBean.CourseList.size(); i++)
                                  {
                                      coursedegree cl = enrollBean.CourseList.get(i);
                                      if(!enrollBean.isEnrolled(cl.courseid))
                                      {%>
                                       <option value="<%=cl.courseid%>"><%=cl.courseid%></option>
                                      <%}
                                  }
                                %>
                            </select>
                            <center><input type="submit" value="Add Course to Enrollment List" /></center>
                        </form>
                <%  }
                    else
                    {
                        %>
                        <h3>There was an error in fetching student data.</h3>
                        <%
                    }
                }
                catch(Exception ex)
                {
                    %>
                    <h3>Input Error</h3>
                    <p>One or more of your inputs were invalid.</p>
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
