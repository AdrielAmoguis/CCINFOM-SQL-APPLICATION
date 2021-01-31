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
<%@page import="enrollment.courses" %>
<%@page import="enrollment.drop" %>

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
                    <li class="navSelected"><a href="../drop.jsp">Drop</a></li>
                    <li><a href="../report.jsp">Report</a></li>
                </ul>
            </div>
        </div>
        
        <!-- CONTENT -->
        <div id="content">
            <h2>Drop</h2>
            
            <p style="text-align: center;">
                This module facilitates the dropping of courses.
            </p>
           
            <hr />
            <!-- Load student data -->
            <jsp:useBean id="dropBean" class="enrollment.drop" scope="session" />
            <%
                if(request.getParameter("SelectedCourse") != null && !request.getParameter("SelectedCourse").isEmpty())
                {
                    enrollment.enrollment em = new enrollment.enrollment();
                    em.studentid = dropBean.Student.studentid;
                    em.courseid = request.getParameter("SelectedCourse");
                    em.term = dropBean.cur_term;
                    em.schoolyear = dropBean.sYear;
                    em.viewRecord();
                    
                    if(!dropBean.willDrop(em))
                        dropBean.DropList.add(em);
                }
                try
                {
                    if(!dropBean.loggedin)
                        dropBean.loginStudent(Integer.parseInt(request.getParameter("StudentID")), Integer.parseInt(request.getParameter("CurrentTerm")), Integer.parseInt(request.getParameter("SchoolYear")));
                    
                    // Check if the student exists
                    if(dropBean.Student.completename != null)
                    {
                    
                        // Display user logged in
                        %>
                        <p>Welcome back, <strong><%=dropBean.Student.completename%></strong>!</p>
                        <%
                            
                         // Initialize Session
                         session.setAttribute("dropStatus", new String());

                        // Show the student his currently enrolled courses
                        if(dropBean.DropList.size() > 0)
                        {
                            %>
                            <h3>Your current drop cart</h3>
                            <center>
                            <table id="cartCourses" style="margin-bottom: 15px;">
                                <tr><th>Course</th></tr>
                            <%
                            for(enrollment.enrollment em : dropBean.DropList)
                            {
                                courses cs = new courses();
                                cs.courseid = em.courseid;
                                cs.viewRecord();
                                %>
                                <tr>
                                    <td><strong><%=em.courseid%></strong> - <%=cs.coursename%> <br/>(<%=cs.department%>)</td>
                                </tr>
                                <%
                            }
                            %>
                            </table></center>
                            <form id="regularForm" name="removeCourse" method ="POST" action="removeFromDrop.jsp">
                                <center>Select CourseID to remove: <input name="removeCourseID" type="text"/><br /></center>
                                <center><input type="submit" value="Remove Course"/></center>
                            </form><br/>
                            <form id="regularForm" name="ClearEnrollment" action="clearDrop.jsp" method="POST">
                                <center><input type="submit" value="Clear Drop List"/></center>
                            </form>
                            <form id="regularForm" name="ConfirmEnrollment" action="confirmDrop.jsp" method="POST">
                                <center><input type="submit" value="Confirm Dropping"/></center>
                            </form><br/>
                            <%
                        }
                        else
                        {
                            %>
                            <p>Your dropping cart is empty.</p>
                            <%
                        }

                        if(dropBean.loadEnrollment() != 0)
                        {

                            %>
                            <form id="regularForm" name="GetCourses" action="doDrop.jsp" method="POST">
                                Select a course to add to your drop list: <br />
                                <select name="SelectedCourse" id="ChosenCourse">
                                    <%
                                      for(int i = 0; i < dropBean.EnrollmentList.size(); i++)
                                      {
                                          enrollment.enrollment em = dropBean.EnrollmentList.get(i);
                                          if(!dropBean.willDrop(em))
                                          {%>
                                           <option value="<%=em.courseid%>"><%=em.courseid%></option>
                                          <%}
                                      }
                                    %>
                                </select>
                                <center><input type="submit" value="Add Course to Drop List" /></center>
                            </form>
                                
                            <br />
                                <form id="logout" name="Logout" action="logout.jsp" method="POST">
                                    <center><input type="submit" value="Logout"/></center>
                                </form>
                    <%  }
                        else
                        {
                            %>
                            <h3>There was an error in fetching student data.</h3>
                            <%
                        }
                    }
                    else
                    {
                        // Student not found
                        %>
                        <h3>Student not found.</h3>
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
