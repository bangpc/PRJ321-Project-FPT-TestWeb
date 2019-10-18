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
}
