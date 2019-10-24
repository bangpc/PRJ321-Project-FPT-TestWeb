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
import model.Subject;
import model.Test;

/**
 *
 * @author dell
 */
public class TestDAO {

    public List<Test> listTestByClass(int ClassID) throws Exception {
        List<Test> ls = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        String sql = "select * from Test where ClassID = " + ClassID;
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int testId = rs.getInt("testID");
            String name = rs.getString("testName");
            int classID = rs.getInt("classID");
            String subjectContent = rs.getString("testContent");
            int difficulty = rs.getInt("difficulty");
            ls.add(new Test(testId, name, classID, subjectContent, difficulty));
        }
        rs.close();
        conn.close();
        return ls;
    }

    public void delete(int id) throws Exception {
        String query = "delete from Test where testid = " + id;
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.execute();
        ps.close();
        conn.close();
    }
}
