package enrollment;
import java.sql.*;
import java.util.*;

public class enroll {

    students                        Student         = new students();
    int                             cur_term        = 0;
    int                             sYear           = 0;
    public ArrayList<enrollment>    EnrollmentList  = new ArrayList<> ();
    public ArrayList<coursedegree>  CourseList      = new ArrayList<> ();
 
    // Note: Loading will be done after student logs in
    public enroll() // perform all the necessary data loading from DB
    {
      
    }                                 
    
    public int clearEnrollment ()   
    {   return 0;   }   // clears enrollment data of the student 
    
    
    // Load valid courses into the course list
    public int loadCourses ()        
    {   
        // Load valid courses based on student's degree
        String studentdegree = Student.degreeid;
        Connection dbCon;
        try
        {
            dbCon = DriverManager.getConnection(DBInfo.jdbcConnectionString);
            System.out.println("[CourseDegree DAO - VIEW] Database Connection Established.");
            
            // Obtain all records where degreeid == studentdegree
            PreparedStatement sqlStatement = dbCon.prepareCall("SELECT courseid, degree FROM coursedegree WHERE degreeid = ?");
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
        
    }
    public int confirmEnrollment()  
    {   return 0;   }   // saves enrollment data into the Database
    
}
