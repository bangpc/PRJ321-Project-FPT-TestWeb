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

    public List<Test> search(String searchText) throws Exception {
        List<Test> ls = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        String sql = "select * from Test where testName like '" + searchText + "'";
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

    public int getNewTestID(int ClassID) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "select * from Test where ClassID = " + ClassID;
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        int id = 0;
        while (rs.next()) {
            id = rs.getInt("testID");
        }
        rs.close();
        conn.close();
        return id;
    }

    public Test getTest(int TestID) throws Exception {
        int timeTest = 0;
        Connection conn = new DBContext().getConnection();
        String sql = "select * from Test,Class where Test.classID = Class.classID and Test.testID=" + TestID;
        Test t = new Test();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int testId = rs.getInt("testID");
            String name = rs.getString("testName");
            int classID = rs.getInt("classID");
            String subjectContent = rs.getString("testContent");
            int difficulty = rs.getInt("difficulty");
            t.setClassID(classID);
            t.setDifficulty(difficulty);
            t.setTestContent(subjectContent);
            t.setTestID(testId);
            t.setTestName(name);
        }
        return t;
    }

    public void delete(int id) throws Exception {
        String query = "delete from Test where testid = " + id;
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.execute();
        ps.close();
        conn.close();
    }

    public Test TestByID(int TestID) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "select * from Test where TestID = " + TestID;
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        Test t = new Test();
        rs.next();
        int testID = rs.getInt("testID");
        String testName = rs.getString("testName");
        int classID = rs.getInt("classID");
        String testContent = rs.getString("testContent");
        int difficulty = rs.getInt("difficulty");
        t = new Test(testID, testName, classID, testContent, difficulty);
        rs.close();
        conn.close();
        return t;
    }

    public void update(int TestID, String testName, String testContent, String difficulty) throws Exception {
        String sql = "UPDATE Test\n"
                + "SET testName = ?, testContent = ?, difficulty = ?\n"
                + "WHERE TestID = " + TestID;
        Connection con = new DBContext().getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, testName);
        ps.setString(2, testContent);
        ps.setString(3, difficulty);
        ps.executeUpdate();
        ps.close();
        con.close();
    }

    public void insert(String testName, int classID, String testContent, String difficulty) throws Exception {
        String sql = "INSERT Test ([testName], [classID], [testContent], [difficulty]) VALUES (?, ?, ?, ?)";
        Connection con = new DBContext().getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, testName);
        ps.setInt(2, classID);
        ps.setString(3, testContent);
        ps.setString(4, difficulty);
        ps.executeUpdate();
        ps.close();
        con.close();
    }
}
