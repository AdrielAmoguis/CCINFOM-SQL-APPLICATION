package enrollment;
import java.sql.*;


/**
 * This class handles all SQL operations that are specific for the enrollment table.
 * @author Adriel Isaiah V. Amoguis
 */
public class enrollment {
 
    public int studentid;
    public String courseid;
    public int term;
    public int schoolyear;
    
    public int newStudentId;
    public String newCourseId;
    public int newTerm;
    public int newSchoolYear;
    
    public enrollment () { this.courseid = null; };
    
    public int modRecord()  
    { 
        try
        {
            Connection dbCon = DriverManager.getConnection(DBInfo.jdbcConnectionString);
            PreparedStatement sqlStatement = dbCon.prepareStatement("UPDATE enrollment SET studentid = ?, courseid = ?, term = ?, schoolyear = ? WHERE"
                    + "studentid = ? AND courseid = ? AND term = ? AND schoolyear = ?");
            sqlStatement.setInt(1, this.newStudentId);
            sqlStatement.setString(2, this.newCourseId);
            sqlStatement.setInt(3, this.newTerm);
            sqlStatement.setInt(4, this.newSchoolYear);
            sqlStatement.setInt(5, this.studentid);
            sqlStatement.setString(6, this.courseid);
            sqlStatement.setInt(7, this.term);
            sqlStatement.setInt(8, this.schoolyear);
            
            sqlStatement.executeUpdate();
           
            sqlStatement.close();
            dbCon.close();
        }
        catch(SQLException ex)
        {
            System.out.println(ex.getMessage());
            return 0;
        }
        return 1; 
    }
    
    public int delRecord()  
    { 
        try
        {
            Connection dbCon = DriverManager.getConnection(DBInfo.jdbcConnectionString);
            PreparedStatement sqlStatement = dbCon.prepareStatement("DELETE FROM enrollment WHERE studentid = ? AND courseid = ? AND term = ? AND schoolyear = ?");
            sqlStatement.setInt(1, this.studentid);
            sqlStatement.setString(2, this.courseid);
            sqlStatement.setInt(3, this.term);
            sqlStatement.setInt(4, this.schoolyear);
            
            sqlStatement.executeUpdate();
           
            sqlStatement.close();
            dbCon.close();
        }
        catch(SQLException ex)
        {
            System.out.println(ex.getMessage());
            return 0;
        }
        return 1; 
    }
    
    public int addRecord()  
    { 
        try
        {
            Connection dbCon = DriverManager.getConnection(DBInfo.jdbcConnectionString);
            PreparedStatement sqlStatement = dbCon.prepareStatement("INSERT INTO enrollment (studentid, courseid, term, schoolyear) VALUES (?,?,?,?)");
            sqlStatement.setInt(1, this.studentid);
            sqlStatement.setString(2, this.courseid);
            sqlStatement.setInt(3, this.term);
            sqlStatement.setInt(4, this.schoolyear);
            
            sqlStatement.executeUpdate();
           
            sqlStatement.close();
            dbCon.close();
        }
        catch(SQLException ex)
        {
            System.out.println(ex.getMessage());
            return 0;
        }
        return 1; 
    }
    
    public int viewRecord() 
    { 
        try
        {
            Connection dbCon = DriverManager.getConnection(DBInfo.jdbcConnectionString);
            PreparedStatement sqlStatement = dbCon.prepareStatement("SELECT studentid, courseid, term, schoolyear FROM enrollment WHERE studentid = ? AND courseid = ? AND term = ? AND schoolyear = ?");
            sqlStatement.setInt(1, this.studentid);
            sqlStatement.setString(2, this.courseid);
            sqlStatement.setInt(3, this.term);
            sqlStatement.setInt(4, this.schoolyear);
            
            ResultSet rs = sqlStatement.executeQuery();
            
            while(rs.next())
            {
                this.studentid = rs.getInt("studentid");
                this.courseid = rs.getString("courseid");
                this.term = rs.getInt("term");
                this.schoolyear = rs.getInt("schoolyear");
            }
           
            rs.close();
            sqlStatement.close();
            dbCon.close();
        }
        catch(SQLException ex)
        {
            System.out.println(ex.getMessage());
            return 0;
        }
        return 1; 
    }
    
    @Override
    public boolean equals(Object obj)
    {
        enrollment em = (enrollment) obj;
        return em.courseid.equals(this.courseid) && em.studentid == this.studentid && em.schoolyear == this.schoolyear && em.term == this.term;
    }
    
    public static void main(String args[]) {
       
    }
}
