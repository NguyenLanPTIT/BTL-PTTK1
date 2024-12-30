package com.shashi.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.shashi.service.*;
import com.shashi.service.impl.*;
import com.shashi.beans.UserBean;

/**
 * Servlet implementation class AddStaffSrv
 */
@WebServlet("/AddStaffSrv")
public class AddStaffSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddStaffSrv() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Lấy dữ liệu từ form
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String pincode = request.getParameter("pincode");
		String password = request.getParameter("password");
		String position = request.getParameter("position");
		String role = "staff"; // Fixed value for role
		System.out.println("add staff servlet ");
		// Tạo đối tượng UserBean từ dữ liệu
		UserBean user = new UserBean(name, Long.parseLong(mobile), email, address, Integer.parseInt(pincode), password,
				role, position);

		// Gọi phương thức addStaff của UserService
		UserService userService = new UserServiceImpl();
		boolean success = userService.addStaff(user);

		if (!success) {
			// Nếu thêm không thành công, trả về thông báo lỗi
			request.setAttribute("errorMessage", "Email already exists. Please enter a different email.");
			RequestDispatcher rd = request.getRequestDispatcher("addStaff.jsp");
			rd.forward(request, response);
		} else {
			// Nếu thành công, chuyển hướng về trang quản lý nhân viên
			response.sendRedirect("adminManageStaff.jsp?message=Staff added successfully.");
		}
	}

}
