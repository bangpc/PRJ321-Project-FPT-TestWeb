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
import java.util.Date;
import java.util.List;
import model.User;

/**
 *
 * @author dell
 */
public class UserDAO {
    public List<User> listUser() throws Exception{
        List<User> ls = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        String sql="select * from [User]";
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while(rs.next()){
            int userID = rs.getInt("userID");
            String userName = rs.getString("username");
            String password = rs.getString("password");
            String email = rs.getString("email");
            int userType = rs.getInt("userType");
            ls.add(new User(userID, userName, password, email, userType));
        }
        rs.close();
        conn.close();
        return ls;
    }
    
    public void insert(String userName,String password, String email) throws Exception{
        String sql="insert into User values(?, ?, ?, ?)";
        Connection con = new DBContext().getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, userName);
        ps.setString(2,password);
        ps.setString(3, email);
        ps.setInt(4, 2);
        ps.executeUpdate();
        ps.close();
        con.close();
        
    }
}
