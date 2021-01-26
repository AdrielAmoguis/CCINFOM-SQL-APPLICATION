package enrollment;
import java.sql.*;
import java.util.ArrayList;

/**
 * This Data Access Object execute operations on the database for the
 * coursedegree table.
 * @author AMOGUIS, Adriel Isaiah V.
 */
public class coursedegree {
    
    // Class Attributes
    public String courseid;
    public String degree;
    
    public String newCourseId;
    public String newDegree;
    
    // USING DEFAULT CONSTRUCTOR
    public coursedegree() 
    {
        this.courseid = null;
        this.degree = null;
        this.newCourseId = null;
        this.newDegree = null;
    }
    
    public int modRecord()
    {
        // Invoke the connection
        Connection dbCon;
        try
        {
            dbCon = DriverManager.getConnection(DBInfo.jdbcConnectionString);
            System.out.println("[CourseDegree DAO - MOD] Database Connection Established.");
            
            // Prepare SQL statement
            PreparedStatement sqlStatement = dbCon.prepareStatement("UPDATE coursedegree SET courseid = ?, degree = ? WHERE courseid = ? AND degree = ?");
            sqlStatement.setString(1, this.newCourseId);
            sqlStatement.setString(2, this.newDegree);
            sqlStatement.setString(1, this.courseid);
            sqlStatement.setString(2, this.degree);
            
            // Execute statement and get results
            sqlStatement.executeUpdate();
            
            // Close the connection
            sqlStatement.close();
            dbCon.close();
        }
        catch (SQLException ex)
        {
            System.out.printf("[CourseDegree DAO - MOD] Exception Occurred Executing SQL:\n%s", ex.getMessage());
            return 1;
        }
        
        return 0;
    }
    
    public int delRecord()
    {
        // Invoke the connection
        Connection dbCon;
        try
        {
            dbCon = DriverManager.getConnection(DBInfo.jdbcConnectionString);
            System.out.println("[CourseDegree DAO - DELETE] Database Connection Established.");
            
            // Prepare SQL statement
            PreparedStatement sqlStatement = dbCon.prepareStatement("DELETE FROM coursedegree WHERE courseid = ? AND degree = ?");
            sqlStatement.setString(1, this.courseid);
            sqlStatement.setString(2, this.degree);
            
            // Execute statement and get results
            sqlStatement.executeUpdate();
            
            // Close the connection
            sqlStatement.close();
            dbCon.close();
        }
        catch (SQLException ex)
        {
            System.out.printf("[CourseDegree DAO - DELETE] Exception Occurred Executing SQL:\n%s", ex.getMessage());
            return 1;
        }
        
        return 0;
    }
    
    public int addRecord()
    {
        // Invoke the connection
        Connection dbCon;
        try
        {
            dbCon = DriverManager.getConnection(DBInfo.jdbcConnectionString);
            System.out.println("[CourseDegree DAO - ADD] Database Connection Established.");
            
            // Prepare SQL statement
            PreparedStatement sqlStatement = dbCon.prepareStatement("INSERT INTO coursedegree (courseid, degree) VALUES (?,?)");
            sqlStatement.setString(1, this.courseid);
            sqlStatement.setString(2, this.degree);
            
            // Execute statement
            sqlStatement.executeUpdate();
            
            // Close the connection
            sqlStatement.close();
            dbCon.close();
        }
        catch (SQLException ex)
        {
            System.out.printf("[CourseDegree DAO - ADD] Exception Occurred Executing SQL:\n%s", ex.getMessage());
            return 0;
        }
        
        return 1;
    }
    
    public int viewRecord()
    {
        // Invoke the connection
        Connection dbCon;
        try
        {
            dbCon = DriverManager.getConnection(DBInfo.jdbcConnectionString);
            System.out.println("[CourseDegree DAO - VIEW] Database Connection Established.");
            
            // Prepare SQL statement
            PreparedStatement sqlStatement = dbCon.prepareCall("SELECT courseid, degree FROM coursedegree WHERE courseid = ? AND degreeid = ?");
            sqlStatement.setString(1, this.courseid);
            sqlStatement.setString(2, this.degree);
            
            
            // Execute statement and get results
            ResultSet rs = sqlStatement.executeQuery();
            
            // Read the results
            while(rs.next())
            {
                this.courseid = rs.getString("courseid");
                this.degree = rs.getString("degree");
            }
            
            // Close the connection
            rs.close();
            sqlStatement.close();
            dbCon.close();
        }
        catch (SQLException ex)
        {
            System.out.printf("[CourseDegree DAO - VIEW] Exception Occurred Executing SQL:\n%s", ex.getMessage());
            return 0;
        }
        
        return 1;
    }
    
    public static void main(String args[]) {
//        // Test Script for coursedegree
//        // Instantiate class
//        coursedegree cd = new coursedegree();
//        
//        // VIEW RECORDS
//        System.out.println("VIEW RECORDS");
//        cd.courseid = "CCPROG1";
//        cd.viewRecord();
//        System.out.println(cd.toString());
//        
//        // MODIFY RECORDS
//        cd = new coursedegree();

          // View Record
//          coursedegree cd = new coursedegree();
//          cd.courseid = "CCPROG1";
//          cd.viewRecord();
//          for(String degree : cd.degrees)
//          {
//              System.out.println(degree);
//          }
//          
//          cd = new coursedegree();
//          cd.degree = "BSCS";
//          cd.viewRecord();
//          for(String course : cd.courses)
//          {
//              System.out.println(course);
//          }
//        
    }
}
