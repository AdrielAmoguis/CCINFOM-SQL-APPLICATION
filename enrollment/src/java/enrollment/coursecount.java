/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package enrollment;

/**
 * Helper class to store number of students per course.
 * To be used in report transaction object
 * @author SUN, Benedict
 */
public class coursecount {
    courses course;
    int    nStudents;
    
    public coursecount(){
        course = new courses();
        nStudents = 0;
    }
}
