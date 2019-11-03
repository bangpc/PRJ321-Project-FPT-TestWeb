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
import model.UserResponse;

/**
 *
 * @author dell
 */
public class ResponseDAO {

    public List<UserResponse> listResponse() throws Exception {
        List<UserResponse> ls = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        String sql = "select UserResponse.*, [User].username from UserResponse, [User] where UserResponse.userID = [User].userID";
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int responseID = rs.getInt("responseID");
            int userID = rs.getInt("userID");
            String username = rs.getString("username");
            String title = rs.getString("title");
            String responseContent = rs.getString("responseContent");
            ls.add(new UserResponse(responseID, userID, username, title, responseContent));
        }
        rs.close();
        conn.close();
        return ls;
    }
    
    public void insert(int userID, String title, String responseContent) throws Exception {
        String sql = "INSERT UserResponse ([userID], [title], [responseContent]) VALUES (?, ?, ?)";
        Connection con = new DBContext().getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userID);
        ps.setString(2, title);
        ps.setString(3, responseContent);
        ps.executeUpdate();
        ps.close();
        con.close();
    }
}
