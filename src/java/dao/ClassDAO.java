/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Classes;

/**
 *
 * @author dell
 */
public class ClassDAO {

    public List<Classes> listClassBySubject(int SubjectID) throws Exception {
        List<Classes> ls = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        String sql = "select * from [class] where subjectID = " + SubjectID;
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int testId = rs.getInt("classID");
            String name = rs.getString("className");
            int subjectID = rs.getInt("subjectID");
            String classContent = rs.getString("classContent");
            ls.add(new Classes(testId, subjectID, name, classContent));
        }
        rs.close();
        conn.close();
        return ls;
    }

    public Classes getClasses(int classID) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "select * from [class] where classID = " + classID;
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        rs.next();
        int testId = rs.getInt("classID");
        String name = rs.getString("className");
        int subjectID = rs.getInt("subjectID");
        String classContent = rs.getString("classContent");
        Classes c = new Classes(testId, subjectID, name, classContent);

        rs.close();
        conn.close();
        return c;
    }

    public List<Classes> search(String searchText) throws Exception {
        List<Classes> ls = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        String sql = "select * from [class] where className like '%" + searchText + "%'";
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int testId = rs.getInt("classID");
            String name = rs.getString("className");
            int subjectID = rs.getInt("subjectID");
            String classContent = rs.getString("classContent");
            ls.add(new Classes(testId, subjectID, name, classContent));
        }
        rs.close();
        conn.close();
        return ls;
    }

    public void delete(int id) throws Exception {
        String query = "delete from [class] where classid = " + id;
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.execute();
        ps.close();
        conn.close();
    }
}
