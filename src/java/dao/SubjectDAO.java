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
import model.Subject;

/**
 *
 * @author BangPC
 */
public class SubjectDAO {
    public List<Subject> listSubject() throws Exception{
        List<Subject> ls = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        String sql="select * from Subject";
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while(rs.next()){
            int id = rs.getInt("subjectID");
            String name = rs.getString("subjectName");
            ls.add(new Subject(id, name));
        }
        rs.close();
        conn.close();
        return ls;
    }
}
