package com.shashi.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shashi.beans.UserBean;
import com.shashi.constants.IUserConstants;
import com.shashi.service.UserService;
import com.shashi.utility.DBUtil;
import com.shashi.utility.MailMessage;

public class UserServiceImpl implements UserService {

	@Override
	public String registerUser(String userName, Long mobileNo, String emailId, String address, int pinCode,
			String password) {

		UserBean user = new UserBean(userName, mobileNo, emailId, address, pinCode, password);

		String status = registerUser(user);

		return status;
	}

	@Override
	public String registerUser(UserBean user) {

		String status = "User Registration Failed!";

		boolean isRegtd = isRegistered(user.getEmail());

		if (isRegtd) {
			status = "Email Id Already Registered!";
			return status;
		}
		Connection conn = DBUtil.provideConnection();
		PreparedStatement ps = null;
		if (conn != null) {
			System.out.println("Connected Successfully!");
		}

		try {

			ps = conn.prepareStatement("insert into " + IUserConstants.TABLE_USER + " values(?,?,?,?,?,?)");

			ps.setString(1, user.getEmail());
			ps.setString(2, user.getName());
			ps.setLong(3, user.getMobile());
			ps.setString(4, user.getAddress());
			ps.setInt(5, user.getPinCode());
			ps.setString(6, user.getPassword());

			int k = ps.executeUpdate();

			if (k > 0) {
				status = "User Registered Successfully!";
				MailMessage.registrationSuccess(user.getEmail(), user.getName().split(" ")[0]);
			}

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(ps);

		return status;
	}

	@Override
	public boolean isRegistered(String emailId) {
		boolean flag = false;

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from user where email=?");

			ps.setString(1, emailId);

			rs = ps.executeQuery();

			if (rs.next())
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);

		return flag;
	}

	@Override
	public String isValidCredential(String emailId, String password) {
		String status = "Login Denied! Incorrect Username or Password";

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from user where email=? and password=?");

			ps.setString(1, emailId);
			ps.setString(2, password);

			rs = ps.executeQuery();

			if (rs.next())
				status = "valid";

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);
		return status;
	}

	@Override
	public UserBean getUserDetails(String emailId, String password) {

		UserBean user = null;

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from user where email=? and password=?");
			ps.setString(1, emailId);
			ps.setString(2, password);
			rs = ps.executeQuery();

			if (rs.next()) {
				user = new UserBean();
				user.setName(rs.getString("name"));
				user.setMobile(rs.getLong("mobile"));
				user.setEmail(rs.getString("email"));
				user.setAddress(rs.getString("address"));
				user.setPinCode(rs.getInt("pincode"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				if(rs.getString("position")!=null) {
					user.setPosition(rs.getString("position"));
				}
				else user.setPosition("customer");
				return user;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);

		return user;
	}

	@Override
	public String getFName(String emailId) {
		String fname = "";

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select name from user where email=?");
			ps.setString(1, emailId);

			rs = ps.executeQuery();

			if (rs.next()) {
				fname = rs.getString(1);

				fname = fname.split(" ")[0];

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return fname;
	}

	@Override
	public String getUserAddr(String userId) {
		String userAddr = "";

		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select address from user where email=?");

			ps.setString(1, userId);

			rs = ps.executeQuery();

			if (rs.next())
				userAddr = rs.getString(1);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return userAddr;
	}
	@Override
	public boolean addStaff(UserBean user) {
	    if (!"staff".equals(user.getRole())) {
	        System.out.println("Only staff users can be added.");
	        return false;
	    }

	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    // Kiểm tra nếu email đã tồn tại trong cơ sở dữ liệu
	    String checkEmailSql = "SELECT * FROM user WHERE email = ?";
	    try {
	        ps = con.prepareStatement(checkEmailSql);
	        ps.setString(1, user.getEmail());
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            // Nếu email đã tồn tại
	            return false; // Trả về false để biết rằng email đã bị trùng
	        }

	        // Nếu email chưa tồn tại, thêm mới vào cơ sở dữ liệu
	        String insertSql = "INSERT INTO user ( name, mobile,email, address, pincode, password, role, position) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	        ps = con.prepareStatement(insertSql);
	        ps.setString(1, user.getEmail());
	        ps.setString(2, user.getName());
	        ps.setLong(3, user.getMobile());
	        ps.setString(4, user.getAddress());
	        ps.setInt(5, user.getPinCode());
	        ps.setString(6, user.getPassword());
	        ps.setString(7, user.getRole());
	        ps.setString(8, user.getPosition());

	        return ps.executeUpdate() > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}

	@Override
	public boolean updateStaff(UserBean user) {
	    if (!"staff".equals(user.getRole())) {
	        System.out.println("Only staff users can be updated.");
	        return false;
	    }
	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;

	    String sql = "UPDATE `user` SET name = ?, mobile = ?, address = ?, pincode = ?, password = ?, position = ? WHERE email = ? AND role = 'staff'";
	    try {
	        ps = con.prepareStatement(sql);

	        ps.setString(1, user.getName());
	        ps.setLong(2, user.getMobile());
	        ps.setString(3, user.getAddress());
	        ps.setInt(4, user.getPinCode());
	        ps.setString(5, user.getPassword());
	        ps.setString(6, user.getPosition());
	        ps.setString(7, user.getEmail());

	        return ps.executeUpdate() > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return false;
	}
	@Override
	public boolean deleteStaff(String email) {
	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;

	    String sql = "DELETE FROM `user` WHERE email = ? AND role = 'staff'";
	    try {
	        ps = con.prepareStatement(sql);

	        ps.setString(1, email);

	        return ps.executeUpdate() > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return false;
	}
	@Override
	public List<UserBean> getAllStaff() {
	    List<UserBean> staffList = new ArrayList<>();
	    Connection con = DBUtil.provideConnection();
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    String sql = "SELECT * FROM `user` WHERE role = 'staff'";
	    try {
	        ps = con.prepareStatement(sql);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            UserBean user = new UserBean();
	            user.setEmail(rs.getString("email"));
	            user.setName(rs.getString("name"));
	            user.setMobile(rs.getLong("mobile"));
	            user.setAddress(rs.getString("address"));
	            user.setPinCode(rs.getInt("pincode"));
	            user.setPassword(rs.getString("password"));
	            user.setRole(rs.getString("role"));
	            user.setPosition(rs.getString("position"));

	            staffList.add(user);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return staffList;
	}

}
