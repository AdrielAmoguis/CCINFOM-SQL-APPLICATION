package enrollment;
import java.sql.*;
import java.util.*;

public class enroll {

    public students                 Student         = new students();
    public int                      cur_term;
    public int                      sYear;
    public ArrayList<enrollment>    EnrollmentList  = new ArrayList<> ();
    public ArrayList<coursedegree>  CourseList      = new ArrayList<> ();
    public boolean                  loggedin;
 
    // Note: Loading will be done after student logs in
    public enroll() // perform all the necessary data loading from DB
    {
        loggedin = false;
    }                                 
    
    // clears enrollment data of the student 
    public int clearEnrollment ()   
    {   
        this.EnrollmentList.clear();
        return 0;   
    }   
    
    
    // Load valid courses into the course list
    // Note: student must be logged in first
    public int loadCourses ()        
    {   
        // Load valid courses based on student's degree
        Connection dbCon;
        try
        {
            dbCon = DriverManager.getConnection(DBInfo.jdbcConnectionString);
            System.out.println("[Enroll TAO - LOAD] Database Connection Established.");
            
            // Obtain all course|degree records where degreeid == studentdegree
            //                          and studentid, courseid, term, schoolyear not in enrollment
            PreparedStatement sqlStatement = dbCon.prepareCall("SELECT courseid, degree " + 
                                                               "FROM coursedegree " +
                                                               "WHERE degree = ?" + 
                                                               "AND courseid NOT IN ( SELECT courseid " +
                                                                                 "FROM enrollment " + 
                                                                                 "WHERE studentid = ? " + 
                                                                                 "AND term = ? " + 
                                                                                 "AND schoolyear = ? )");
            // Main query                                                                     
            sqlStatement.setString(1, Student.degreeid);
            // Subquery
            sqlStatement.setInt(2, Student.studentid);
            sqlStatement.setInt(3, this.cur_term);
            sqlStatement.setInt(4, this.sYear);
            
            ResultSet rs = sqlStatement.executeQuery();
            // Clear list before appending
            CourseList.clear();
            // Read the results
            while(rs.next())
            {
                coursedegree new_cd = new coursedegree();
                new_cd.courseid = rs.getString("courseid");
                new_cd.degree = rs.getString("degree");
                CourseList.add(new_cd);
            }
            
            // Close the connections
            rs.close();
            sqlStatement.close();
            dbCon.close();
        }
        catch (SQLException ex)
        {
            System.out.printf("[Enroll TAO - LOAD] Exception Occurred Executing SQL:\n%s", ex.getMessage());
            return 0;
        }
        
        return 1;  
    }   
    
    public int loginStudent(int studentid, int cur_term, int sYear){
        Student.studentid = studentid;
        // Get record of studentid from database
        Student.viewRecord();
        this.cur_term = cur_term;
        this.sYear = sYear;
        this.loggedin = true;
        
        // Load the student's valid courses
        loadCourses();
        
        return 1;
    }
    
    // Adds a course to enrollment list
    public int addCourse(String courseid){
        enrollment new_en = new enrollment();
        // initialize attributes before adding to list
        new_en.studentid = this.Student.studentid;
        new_en.courseid = courseid;
        new_en.term = this.cur_term;
        new_en.schoolyear = this.sYear;
        
        // append to enrollment list
        EnrollmentList.add(new_en);
        return 1;
    }
    
    // Saves enrollment data into the Database
    public int confirmEnrollment()  
    {   
        // Add all enrollment records to DB
        for (int i = 0; i<EnrollmentList.size(); i++)
            if(EnrollmentList.get(i).addRecord() == 0)
                return 0;
        
        // Clear Enrollment
        this.clearEnrollment();
        
        return 1;   
    }   
    
    // Helper method for JSP to not display coursedegree that is already in enrollmentlist
    public boolean isEnrolled(String courseid)
    {
        enrollment em = new enrollment();
        em.courseid = new String(courseid);
        em.studentid = this.Student.studentid;
        em.term = this.cur_term;
        em.schoolyear = this.sYear;
        
        return this.EnrollmentList.contains(em);
    }
}
