/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
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
    public List<Question> listQuestionByTest(int TestID) throws Exception{
        List<Question> ls = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        String sql="select * from Question where testID="+TestID;
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while(rs.next()){
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
            
}
