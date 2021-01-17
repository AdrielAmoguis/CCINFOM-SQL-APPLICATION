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
    
    // USING DEFAULT CONSTRUCTOR
    public coursedegree() 
    {
        this.courseid = null;
        this.degree = null;
    }
    
    public int modRecord()
    {
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
        return 0;
    }
    
    public int viewRecord()
    {
//        // Invoke the connection
//        Connection dbCon;
//        try
//        {
//            dbCon = DriverManager.getConnection(DBInfo.jdbcConnectionString);
//            System.out.println("[CourseDegree DAO - VIEW] Database Connection Established.");
//            
//            // Query using degreeid or degree?
//            String qryCond;
//            if(this.courseid != null && this.degree == null)
//                qryCond = this.courseid;
//            else if(this.courseid == null && this.degree != null)
//                qryCond = this.degree;
//            else
//            {
//                System.out.println("[CourseDegree DAO - VIEW] Ambiguous View Request:\nOne of the field attributes must be null.\nExample: " +
//                        "if courseid == null, then this DAO will query for the courseid ");
//                return 1;
//            }
//            
//            // Prepare SQL statement
//            PreparedStatement sqlStatement = dbCon.prepareStatement("SELECT courseid, degree FROM coursedegree WHERE courseid = ?");
//            sqlStatement.setString(1, this.courseid);
//            
//            // Execute statement and get results
//            ResultSet results = sqlStatement.executeQuery();
//            
//            // Parse Results
//            while(results.next())
//            {
//                this.degree.add(results.getString("degree"));
//            }
//            
//            // Close the connection
//            results.close();
//            sqlStatement.close();
//            dbCon.close();
//        }
//        catch (SQLException ex)
//        {
//            System.out.printf("[CourseDegree DAO - VIEW] Exception Occurred Executing SQL:\n%s", ex.getMessage());
//            return 1;
//        }
        
        return 0;
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
//        
    }
}
