package com.laptrinhweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.sql.ResultSet;

import com.laptrinhweb.model.User;

public class UserDAOImpl implements UserDAO{
    @Override
	public void addUser(User u) {
		
		String query = "INSERT INTO User(Username, UserHashPassword";
        query += ", ngaysinh, gioitinh, email";
        query += ", sdt, diachi, role)";
        query += " VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
		PreparedStatement ps;
		try {
			Connection con = DBConnect.getConn();
			ps = (PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, u.getUser_id());
			ps.setString(2, u.getUsername());
			ps.setString(3, u.getPassword());
			ps.setDate(4, u.getNgaysinh());
			ps.setString(5, u.getGioitinh());
			ps.setString(6, u.getEmail());
			ps.setString(7, u.getSdt());
			ps.setString(8, u.getDiachi());
			ps.setString(9, u.getRole());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean checkUser(String username){
		String sql = "select * from user where username='" + username + "'";
		PreparedStatement ps;
		try {
			Connection con = DBConnect.getConn();
			ps = (PreparedStatement) con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean login(String username, String password){
		String sql = "SELECT * FROM User WHERE username='" + username + "' and password='" + password + "'";
		PreparedStatement ps;
		try {
			Connection con = DBConnect.getConn();
			ps = (PreparedStatement) con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public void updateUser(User u) {
		
		String sql = "update user set user_id=?, password=?, ngaysinh=?, gioitinh=?, email=?, sdt=?, diachi=?, role=? where username=?";
		try {
			Connection con = DBConnect.getConn();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ps.setInt(1, u.getUser_id());
			ps.setString(2, u.getPassword());
			ps.setDate(3, u.getNgaysinh());
			ps.setString(4, u.getGioitinh());
			ps.setString(5, u.getEmail());
			ps.setString(6, u.getSdt());
			ps.setString(7, u.getDiachi());
			ps.setString(8, u.getRole());
			ps.setString(9, u.getUsername());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public User getUser(String name){
		
		String sql = "select * from user where username='" + name + "'";
		User u = new User();
		try {
			Connection con = DBConnect.getConn();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int user_id= rs.getInt("userid");
				String username = rs.getString("username");
				String password = rs.getString("password");
				Date ngaysinh = rs.getDate("ngaysinh");
				String gioitinh = rs.getString("gioitinh");
				String email = rs.getString("email");
				String sdt = rs.getString("sdt");
				String diachi = rs.getString("diachi");
				String role = rs.getString("role");
				u = new User(user_id, username, password, ngaysinh, gioitinh, email, sdt, diachi, role);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}

    
}
