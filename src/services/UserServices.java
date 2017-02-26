package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.user;
import util.JDBC;

public class UserServices {
	public static boolean login(String username,String password) {
		String sql = "select `username` from user where username = ? and password = ?";
		try(Connection con =  JDBC.getConnection()) {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet res = stmt.executeQuery();
			if(res.next()){
				/*response.sendRedirect("index.jsp");*/
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public static boolean reg(String user,String password,String name,String Email) {
		
		String sql = "INSERT INTO user(`username`,`password`,`name`,`e-mail`,`Avatar-src`) values(?,?,?,?,'Avatarsrc/002.jpg')";
		try(Connection con =  JDBC.getConnection()) {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, user);
			stmt.setString(2, password);
			stmt.setString(3, name);
			stmt.setString(4, Email);
			return stmt.executeUpdate()==1;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
/*	public static boolean saveuser(String user,String password,String name,String email,String avatar) {
		
		String sql = "INSERT INTO user(`username`,`password`,`name`,`e-mail`,`Avatar-src`) values(?,?,?,?,?)";
		try(Connection con =  JDBC.getConnection()) {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, user);
			stmt.setString(2, password);
			stmt.setString(3, name);
			stmt.setString(4, email);
			stmt.setString(5, avatar);
			return stmt.executeUpdate()==1;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static boolean updateuser(String user,String password,String name,String email,String avatar,String id){
		try(Connection conn =JDBC.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("update user set `username`=?,`password`=?,`name`=?,`e-mail`=? ,`Avatar-src`=? where `id`=? ");
			stmt.setString(1,user );
			stmt.setString(2, password);
			stmt.setString(3, name);
			stmt.setString(4,email);
			stmt.setString(5,avatar );
			stmt.setString(6,id );
			return stmt.executeUpdate()==1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}*/
	public static user getuserByName(String username){
		try(Connection con =  JDBC.getConnection()) {
			String sql = "SELECT * FROM `user` WHERE username = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			ResultSet res = stmt.executeQuery();
			if(res.next()){
				user users = new user();
				users.setName(res.getString("name"));
				users.setId(res.getString("id"));
				users.setAvatarsrc(res.getString("Avatar-src"));
				users.setUsername(res.getString("username"));
				return users;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static boolean getuser(String username){
		try(Connection con =  JDBC.getConnection()) {
			String sql = "SELECT * FROM `user` WHERE username = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			 ResultSet res = stmt.executeQuery();
			return res.next();
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static boolean isEmail(String email){
		String regex = "^[A-Za-z]{1,40}@[A-Za-z0-9]{1,40}\\.[A-Za-z]{2,3}$";
	    return email.matches(regex);
	}
}

