/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enrollment;
import java.sql.*;
import java.util.ArrayList;

/**
 * For generating number of students that enrolled in every course given:
 * (1) term and (2) school year
 *  
 * @author/s SO, Tiffany, SUN, Benedict
 */
public class report {
    // coursecount attributes: course | nStudents
    // where-in course attributes = courseid | coursename | department
    ArrayList<coursecount> ccList;
    int                term;
    int                schoolyear;
    
    // Instantiate objects
    public report(){
        ccList = new ArrayList<>();
    };
    
    public int resetReport(){
        ccList.clear();
        term = 0;
        schoolyear = 0;
        
        return 0;
    }
    
    
    // Change current term and schoolyear for report generation
    public int updateTermYear(int term, int schoolyear){
        this.term = term;
        this.schoolyear = schoolyear;
        
        return 0;
    }
    
    // Generate number of students for each course
    public int generateReport(){
  
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("[Report TAO - generateReport] Connection Successful");
            
            // courses LEFT JOIN enrollment
            // obtain nStudents from each course
            ccList.clear();
            PreparedStatement pstmt = conn.prepareStatement("SELECT c.courseid, c.coursename, c.department, COUNT(e.studentid) AS nStudents " +
                                                            "FROM courses c LEFT JOIN enrollment e ON c.courseid = e.courseid " +
                                                            "AND (term = ? or term IS NULL) " +
                                                            "AND (schoolyear = ? or schoolyear IS NULL) " +
                                                            "GROUP BY c.courseid " + 
                                                            "ORDER BY c.courseid");
            pstmt.setInt(1, this.term);
            pstmt.setInt(2, this.schoolyear);
            
            ResultSet rs = pstmt.executeQuery();
       
            while(rs.next()){
                coursecount new_cc = new coursecount();
                new_cc.course.courseid = rs.getString("c.courseid");
                new_cc.course.coursename = rs.getString("c.coursename");
                new_cc.course.department = rs.getString("c.department");
                new_cc.nStudents = rs.getInt("nStudents");
                // append course to ccList
                ccList.add(new_cc);
            }

            // Close connections
            pstmt.close();
            conn.close();
   
            return 1;
        }catch (SQLException e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
    /*
    public static void main(String[] args){
       
        report new_report = new report();
        new_report.updateTermYear(2, 20192020);
        new_report.generateReport();
        System.out.println("courseid | coursename | department | nStudents");
        for (int i = 0; i <new_report.ccList.size(); i++){
            coursecount new_cc = new_report.ccList.get(i);
            System.out.println(new_cc.course.courseid + " | " + 
                    new_cc.course.coursename + " | " + new_cc.course.department + 
                    " | " + new_cc.nStudents);
        }
        
        new_report.resetReport();
        System.out.println(new_report.schoolyear);
    }
    */
}
