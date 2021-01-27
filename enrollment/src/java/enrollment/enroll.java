package enrollment;
import java.sql.*;
import java.util.*;

public class enroll {

    public students                 Student         = new students();
    public int                      cur_term        = 0;
    public int                      sYear           = 0;
    public ArrayList<enrollment>    EnrollmentList  = new ArrayList<> ();
    public ArrayList<coursedegree>  CourseList      = new ArrayList<> ();
    public boolean loggedin;
 
    // Note: Loading will be done after student logs in
    public enroll() // perform all the necessary data loading from DB
    {
        loggedin = false;
    }                                 
    
    public int clearEnrollment ()   
    {   
        this.EnrollmentList.clear();
        return 0;   
    }   // clears enrollment data of the student 
    
    
    // Load valid courses into the course list
    public int loadCourses ()        
    {   
        // Load valid courses based on student's degree
        String studentdegree = Student.degreeid;
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
                                                                                 
            sqlStatement.setString(1, studentdegree);
            
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
    
    public void loginStudent(int studentid, int cur_term, int sYear){
        Student.studentid = studentid;
        // Get record of studentid from database
        Student.viewRecord();
        this.cur_term = cur_term;
        this.sYear = sYear;
        this.loggedin = true;
    }
    public int confirmEnrollment()  
    {   return 0;   }   // saves enrollment data into the Database
    
    
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
