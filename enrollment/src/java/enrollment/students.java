package enrollment;
import java.sql.*;

public class students {
    
    public int studentid;
    public String completename;
    public String degreeid;
    
    public students () {};
    
    
    public int addRecord()  { 
        try {
            Connection conn;     
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO students VALUES (?,?,?)");
            pstmt.setInt    (1, studentid );
            pstmt.setString (2, completename);
            pstmt.setString (3, degreeid);
            pstmt.executeUpdate();   
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());  
            return 0;
        }       
    }
    
    public int modRecord()  { 
    try{
            Connection conn;     
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("UPDATE students " +
                                                            "SET    degreeid   = ?," +
                                                            "       completename = ? " +
                                                            "WHERE  studentid = ? ");
            // 5. Supply the statement with values
            pstmt.setString (1, degreeid );
            pstmt.setString (2, completename);
            pstmt.setInt    (3, studentid);
            pstmt.executeUpdate();   
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());  
            return 0;
        }         
    }
    
    public int delRecord()  { 
        try {
            // Delete instances in enrollment
            enrollment em = new enrollment();
            em.studentid = this.studentid;
            if(em.delStudent() == 0) return 0;
            
            Connection conn;     
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM students WHERE studentid=?");
            // 5. Supply the statement with values
            pstmt.setInt    (1, studentid );
            // 6. Execute the SQL Statement
            pstmt.executeUpdate();   
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());  
            return 0;
        }       
    }
    
   
    public int viewRecord() { 
    try {
            Connection conn;     
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM students WHERE studentid=?");
            pstmt.setInt    (1, studentid );
            // 6. Execute the SQL Statement
            ResultSet rs = pstmt.executeQuery();
            
            // 7. Get the results
            while (rs.next()) {
                studentid  = rs.getInt("studentid");
                completename = rs.getString ("completename");
                degreeid    = rs.getString("degreeid");
            }
            rs.close();
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());  
            return 0;
        }           
    }
    
    public static void main(String args[]) {
       students s = new students();
       
       //Add Record
       /*
       s.studentid = 12345678;
       s.completename = "Hello World";
       s.degreeid = "BSIS";
       s.addRecord();
       */
       
       
       //Modify Record
       /*
       s.degreeid = "BSCS";
       s.studentid = 12345678;
       s.modRecord();
       */
       
       
       //Delete Record
       /*
       s.studentid = 12345678;
       s.delRecord();
       */
       
       
       //View Record
       /*
       s.studentid = 10100001;
       s.viewRecord();
       System.out.println("studentid: " + s.studentid);
       System.out.println("completename: " + s.completename);
       System.out.println("degreeid: " + s.degreeid);
       */
    }
}

