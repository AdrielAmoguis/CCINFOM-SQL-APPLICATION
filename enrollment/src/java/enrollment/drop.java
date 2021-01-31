/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enrollment;
import java.sql.*;
import java.util.*;

public class drop {
  
    public students                 Student         = new students();
    public int                      cur_term;
    public int                      sYear;
    public ArrayList<enrollment>    EnrollmentList  = new ArrayList<> ();
    public ArrayList<enrollment>    DropList        = new ArrayList<> ();
    public boolean                  loggedin;
    
    // Note: Loading will be done after student logs in
    public drop() // perform all the necessary data loading from DB
    {    
        loggedin = false;
    }
    
    
    public int loginStudent(int studentid, int cur_term, int sYear)
    {
        // Initialize the student object
        this.Student.studentid = studentid;
        this.Student.viewRecord();
        
        this.cur_term = cur_term;
        this.sYear = sYear;
        this.loggedin = true;
        
        // Load the student's enrollment list
        loadEnrollment();
   
        return 1;
    }
    
    // clears dropping data of the student
    public int clearDrop ()         {   
        this.DropList.clear();
        return 0;   
    }   
    
    // load enrollment data of the student 
    public int loadEnrollment ()    {   
        // Load student's currently enrolled courses based on term & schoolyear
        Connection dbCon;
        try
        {
            dbCon = DriverManager.getConnection(DBInfo.jdbcConnectionString);
            System.out.println("[Drop TAO - LOAD] Database Connection Established.");
            
            // Obtain all enrollment records with studentid, term, schoolyear         
            PreparedStatement sqlStatement = dbCon.prepareCall("SELECT studentid, courseid, term, schoolyear " +
                                                               "FROM enrollment " +
                                                               "WHERE studentid = ? " +
                                                               "AND   term = ? " +
                                                               "AND   schoolyear = ?");
                                                                                 
            sqlStatement.setInt(1, this.Student.studentid);
            sqlStatement.setInt(2, this.cur_term);
            sqlStatement.setInt(3, this.sYear);
            
            ResultSet rs = sqlStatement.executeQuery();
            // Clear list before appending
            EnrollmentList.clear();
            // Read the results
            while(rs.next())
            {
                enrollment new_en = new enrollment();
                new_en.studentid = rs.getInt("studentid");
                new_en.courseid = rs.getString("courseid");
                new_en.term = rs.getInt("term");
                new_en.schoolyear = rs.getInt("schoolyear");
               
                EnrollmentList.add(new_en);
            }
            
            // Close the connections
            rs.close();
            sqlStatement.close();
            dbCon.close();
        }
        catch (SQLException ex)
        {
            System.out.printf("[Drop TAO - LOAD] Exception Occurred Executing SQL:\n%s", ex.getMessage());
            return 0;
        }
        return 1;   
    }   
    
    
    // Adds a course to enrollment list
    public int addDropCourse(String courseid){
        enrollment new_en = new enrollment();
        // initialize attributes before adding to list
        new_en.studentid = this.Student.studentid;
        new_en.courseid = courseid;
        new_en.term = this.cur_term;
        new_en.schoolyear = this.sYear;
        
        // append to enrollment list
        DropList.add(new_en);
        return 1;
    }
    
    
    // saves dropping data into the Database
    public int confirmDrop()        {   
        for(int i = 0; i< DropList.size(); i++)
            DropList.get(i).delRecord();
        
        return 0;   
    }
    
    // Checks if the mentioned course is in the student's drop cart
    public boolean willDrop(enrollment em)
    {
        return this.DropList.contains(em);
    }
    
}
