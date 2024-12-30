<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page
    import="java.util.*, com.shashi.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin - Manage Staff</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
    body {
        background-color: #F4F7F6;
    }
   

    .tab {
        margin: 20px auto;
        padding: 20px;
        background-color: #FFFFFF;
        border-radius: 8px;
        width: 60%;
        text-align: center;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    .tab button {
        margin: 10px 0;
        width: 80%;
        height: 40px;
        border-radius: 5px;
        background-color: #4CAF50;
        color: white;
        border: none;
        font-size: 16px;
        cursor: pointer;
    }

    .tab button:hover {
        background-color: #45a049;
    }
    .tab  h2{
    font-weight: bold;
    }
</style>
</head>
<body>
    <%
        // Kiểm tra quyền admin
        String userType = (String) session.getAttribute("usertype");
        String userName = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (userType == null || !userType.equals("admin")) {
            response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");
        } else if (userName == null || password == null) {
            response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
        }
    %>

    <jsp:include page="header.jsp" />

    <div class="container" style ="display: flex;justify-content: center;">
        <div class="tab">
            <h2>Manage Staff</h2>
            <form>
                <!-- Chuyển đến trang hiển thị danh sách nhân viên -->
                <button type="submit" formaction="viewStaff.jsp">View All Staff</button>
                <br>
                <!-- Chuyển đến trang thêm nhân viên -->
                <button type="submit" formaction="addStaff.jsp">Add Staff</button>
                <br>
                <!-- Chuyển đến trang cập nhật thông tin nhân viên -->
                <button type="submit" formaction="updateStaff.jsp">Update Staff</button>
                <br>
                <!-- Chuyển đến trang xóa nhân viên -->
                <button type="submit" formaction="deleteStaff.jsp">Delete Staff</button>
            </form>
        </div>
    </div>

    <jsp:include page="footer.html" />
</body>
</html>
