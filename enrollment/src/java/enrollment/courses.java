package enrollment;
import java.sql.*;

public class courses {
    
    // Attributes
    public String courseid;
    public String coursename;
    public String department;
    
    // Constructor
    public courses () {
        courseid = null;
        coursename = null;
        department = null;
    };
    
    // Add record with values [courseid, coursename, department]
    public int addRecord()  {
        try {
            Connection conn;     
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("[courses.addRecord] Connection Successful");
            // Prepare INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO courses VALUES(?,?, ?)");
            // Supply statement with values
            pstmt.setString(1, courseid);
            pstmt.setString(2, coursename);
            pstmt.setString(3, department);
            // Execute the SQL Statement
            pstmt.executeUpdate();
            // Close connections
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());  
            return 0;
        }         
    };
    
    // Modify record. Access using PK courseid, edit attributes [coursename, department]
    public int modRecord()  {
        try{
           Connection conn;
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
           System.out.println("[courses.modRecord] Connection Successful");
           // Prepare UPDATE statement
           PreparedStatement pstmt = conn.prepareStatement("UPDATE courses " +
                                                           "SET coursename = ?, " +
                                                           "    department = ? " +
                                                           "WHERE courseid = ?");
           // Supply statement with values
           pstmt.setString(1, coursename);
           pstmt.setString(2, department);
           pstmt.setString(3, courseid);
           // Execute SQL statement
           pstmt.executeUpdate();
           // Close connections
           pstmt.close();
           conn.close();
           return 1;
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            return 0;
        }
    };
    
    // Delete record. Access using PK courseid.
    public int delRecord()  {
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("[courses.delRecord] Connection Successful");
            // Prepare DELETE statement
            PreparedStatement pstmt = conn.prepareStatement("DELETE " +
                                                            "FROM courses " +
                                                            "WHERE courseid = ?");
            // Insert values to SQL statement
            pstmt.setString(1, courseid);
            // Execute statement
            pstmt.executeUpdate();
            // Close connections
            pstmt.close();
            conn.close();
            return 1;
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            return 0;
        }
    };
    
    // 
    public int viewRecord() {
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("[courses.viewRecord] Connection Successful");
            // Prepare SELECT statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT courseid, coursename, department " +
                                                            "FROM courses " + 
                                                            "WHERE courseid = ?");
            // Insert values
            pstmt.setString(1, courseid);
            // Execute query and store result
            ResultSet rs = pstmt.executeQuery();
            // Get results
            while(rs.next()){
                courseid = rs.getString("courseid");
                coursename = rs.getString("coursename");
                department = rs.getString("department");
            }
            
            // Close connections
            pstmt.close();
            conn.close();
   
            return 1;
        }catch (SQLException e){
            System.out.println(e.getMessage());
            return 0;
        }
    };
    
    public static void main(String args[]) {
        courses temp = new courses();
        // addRecord()
        /*
        temp.courseid = "CCADPRG";
        temp.coursename = "Advanced Programming";
        temp.department = "Software Technology";
        temp.addRecord();
        */
        // modRecord()
        /*
        temp.courseid = "CCADPRG";
        temp.coursename = "Actually Programming";
        temp.department = "Super Tardy";
        temp.modRecord();
        */
        // delRecord()
        /*
        temp.courseid = "CCADPRG";
        temp.delRecord();
        */
        // viewRecord()
        temp.courseid = "CCICOMP";
        temp.viewRecord();
        System.out.println("courseid: " + temp.courseid);
        System.out.println("coursename: " + temp.coursename);
        System.out.println("department: " + temp.department);
    }
}
