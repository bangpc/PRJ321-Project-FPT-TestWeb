/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author BangPC
 */
public class MarkDAO {
    public void insertMark(int userID, int testID, double Mark) throws Exception{
        String sql = "INSERT Mark VALUES(?,?,?)";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userID);
        ps.setInt(2, testID);
        ps.setDouble(1, Mark);
    }
}
