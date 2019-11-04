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

    public List<User> listUser() throws Exception {
        List<User> ls = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        String sql = "select * from [User]";
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int userID = rs.getInt("userID");
            String username = rs.getString("username");
            String password = rs.getString("password");
            String email = rs.getString("email");
            int userType = rs.getInt("userType");
            ls.add(new User(userID, username, password, email, userType));
        }
        rs.close();
        conn.close();
        return ls;
    }

    public List<User> search(String searchText) throws Exception {
        List<User> ls = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        String sql = "select * from [User] where username like '" + searchText + "'";
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int userID = rs.getInt("userID");
            String username = rs.getString("username");
            String password = rs.getString("password");
            String email = rs.getString("email");
            int userType = rs.getInt("userType");
            ls.add(new User(userID, username, password, email, userType));
        }
        rs.close();
        conn.close();
        return ls;
    }

    public User selectbyId(int id) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "select * from [User] where userID = " + id;
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        User u = new User();
        while (rs.next()) {
            int userID = rs.getInt("userID");
            String username = rs.getString("username");
            String password = rs.getString("password");
            String email = rs.getString("email");
            int userType = rs.getInt("userType");
            u = new User(userID, username, password, email, userType);
        }
        rs.close();
        conn.close();
        return u;
    }

    public User select(String name) throws Exception {
        Connection conn = new DBContext().getConnection();
        String sql = "select * from [User] where username = '" + name + "'";
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        User u = new User();
        while (rs.next()) {
            int userID = rs.getInt("userID");
            String username = rs.getString("username");
            String password = rs.getString("password");
            String email = rs.getString("email");
            int userType = rs.getInt("userType");
            u = new User(userID, username, password, email, userType);
        }
        rs.close();
        conn.close();
        return u;
    }

    public void insert(String userName, String password, String email) throws Exception {
        String sql = "INSERT [User] ([username], [password], [email], [userType]) VALUES (?, ?, ?, ?)";
        Connection con = new DBContext().getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, userName);
        ps.setString(2, password);
        ps.setString(3, email);
        ps.setInt(4, 2);
        ps.executeUpdate();
        ps.close();
        con.close();
    }

    public void changeInfo(int userId, String username, String password, String email) throws Exception {
        String sql = "UPDATE [User] SET [username] = ?,[password] = ? where userID=" + userId;
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        ps.executeUpdate();
        ps.close();
        conn.close();
    }
}
