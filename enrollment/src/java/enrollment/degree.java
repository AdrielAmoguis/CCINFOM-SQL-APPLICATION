package enrollment;
import java.sql.*;

public class degree {
    
    // Attributes
    public String degreeid;
    public String degreename;
   
    // Constructor
    public degree () {};
    
    // Add record with values [degreeid, degreename]
    public int addRecord() {
        try {
            // 1. Instantiate a connection variable
            Connection conn;     
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("[degree.addRecord] Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO degree VALUES(?,?)");
            // 5. Supply the statement with values
            pstmt.setString(1, degreeid);
            pstmt.setString(2, degreename);
            // 6. Execute the SQL Statement
            pstmt.executeUpdate();
            // 7. Close connections
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());  
            return 0;
        }         
    };
    
    // Modify an existing record. 
    // Access using PK degreeid, edit attribute degreename
    public int modRecord() {
        try{
           // 1. Instantiate a Connection object
           Connection conn;
           // 2. Establish a connection to DB
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
           System.out.println("[degree.modRecord] Connection Successful");
           // 3. Prepare UPDATE statement
           PreparedStatement pstmt = conn.prepareStatement("UPDATE degree " +
                                                           "SET degreename = ?" +
                                                           "WHERE degreeid = ?");
           // 4. Supply statement with values
           pstmt.setString(1, degreename);
           pstmt.setString(2, degreeid);
           // 5. Execute SQL statement
           pstmt.executeUpdate();
           // 6. Close connections
           pstmt.close();
           conn.close();
           return 1;
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            return 0;
        }
    };
    
    // Delete record. Access using PK degreeid
    public int delRecord() {
        try{
            // 1. Instantiate Connection object
            Connection conn;
            // 2. Establish connection to DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("[degree.delRecord] Connection Successful");
            // 3. Prepare DELETE statement
            PreparedStatement pstmt = conn.prepareStatement("DELETE " +
                                                            "FROM degree " +
                                                            "WHERE degreeid = ?");
            // 4. Insert values to SQL statement
            pstmt.setString(1, degreeid);
            // 5. Execute statement
            pstmt.executeUpdate();
            // 6. Close connections
            pstmt.close();
            conn.close();
            return 1;
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            return 0;
        }
    };
    
    public int viewRecord() {
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("[degree.viewRecord] Connection Successful");
            // Prepare SELECT statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT degreeid, degreename " +
                                                            "FROM degree " + 
                                                            "WHERE degreeid = ?");
            // Insert values
            pstmt.setString(1, degreeid);
            // Execute and store result
            ResultSet rs = pstmt.executeQuery();
            // Get results
            while(rs.next()){
                degreeid = rs.getString("degreeid");
                degreename = rs.getString("degreename");
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
        degree temp_deg = new degree();
        // addRecord()
        /*
        temp_deg.degreeid = "BSBS";
        temp_deg.degreename = "Bachelor of Science in Benedict Sun";
        temp_deg.addRecord();
        */
        // modRecord()
        /*
        temp_deg.degreeid= "BSCS";
        temp_deg.degreename = "Benedict of Sun in Computer Science";
        temp_deg.modRecord();
        */
        // delRecord()
        /*
        temp_deg.degreeid = "BSBS";
        temp_deg.delRecord();
        */
        // viewRecord()
        temp_deg.degreeid = "BSCS";
        temp_deg.viewRecord();
        System.out.println("degreeid: " + temp_deg.degreeid);
        System.out.println("degreename: " + temp_deg.degreename);
    }
}
