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
import model.Question;
import model.Test;

/**
 *
 * @author dell
 */
public class QuestionDAO {

    public List<Question> listQuestionByTest(int TestID) throws Exception {
        List<Question> ls = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        String sql = "select * from Question where testID = " + TestID;
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int questionId = rs.getInt("questionID");
            int testID = rs.getInt("testID");
            String questionContent = rs.getString("questionContent");
            String opt1 = rs.getString("opt1");
            String opt2 = rs.getString("opt2");
            String opt3 = rs.getString("opt3");
            String opt4 = rs.getString("opt4");
            String rightOption = rs.getString("rightOption");
            ls.add(new Question(questionId, testID, questionContent, opt1, opt2, opt3, opt4, rightOption));
        }
        rs.close();
        conn.close();
        return ls;
    }

    public Question QuestionByID(int QuestionID) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "select * from Question where QuestionID = " + QuestionID;
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        Question q = new Question();
        rs.next();
        int questionId = rs.getInt("questionID");
        int testID = rs.getInt("testID");
        String questionContent = rs.getString("questionContent");
        String opt1 = rs.getString("opt1");
        String opt2 = rs.getString("opt2");
        String opt3 = rs.getString("opt3");
        String opt4 = rs.getString("opt4");
        String rightOption = rs.getString("rightOption");
        q = new Question(questionId, testID, questionContent, opt1, opt2, opt3, opt4, rightOption);
        rs.close();
        conn.close();
        return q;
    }

    public void delete(int id) throws Exception {
        String query = "delete from Question where questionid = " + id;
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.execute();
        ps.close();
        conn.close();
    }

    public void insert(int testID, String questionContent, String opt1, String opt2, String opt3, String opt4, String rightOption) throws Exception {
        String sql = "INSERT Question ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (?, ?, ?, ?, ?, ?, ?)";
        Connection con = new DBContext().getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, testID);
        ps.setString(2, questionContent);
        ps.setString(3, opt1);
        ps.setString(4, opt2);
        ps.setString(5, opt3);
        ps.setString(6, opt4);
        ps.setString(7, rightOption);
        ps.executeUpdate();
        ps.close();
        con.close();
    }

    public void update(int questionID, String questionContent, String opt1, String opt2, String opt3, String opt4, String rightOption) throws Exception {
        String sql = "UPDATE Question\n"
                + "SET questionContent = ?, opt1 = ?, opt2 = ?, opt3 = ?, opt4 = ?, rightOption = ?\n"
                + "WHERE questionID = " + questionID;
        Connection con = new DBContext().getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, questionContent);
        ps.setString(2, opt1);
        ps.setString(3, opt2);
        ps.setString(4, opt3);
        ps.setString(5, opt4);
        ps.setString(6, rightOption);
        ps.executeUpdate();
        ps.close();
        con.close();
    }
}
