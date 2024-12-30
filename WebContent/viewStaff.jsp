<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.shashi.beans.UserBean, com.shashi.service.UserService, com.shashi.service.impl.UserServiceImpl, java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<title>View Staff</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style>
    body {
        background-color: #F4F7F6;
    }
    .container{
		display : flex ;
         justify-content: center;
         align-items: center;
          flex-direction: column;
          }
     .tab{
        margin: 20px auto;
        padding: 20px;
        background-color: #FFE5CC;
        border-radius: 8px;
        width: 80%;
        text-align: center;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
         .tab  h2{
    font-weight: bold;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px auto;
        
         
    }
     td, th {
        border: 1px solid #000;
        padding: 8px !important;
        text-align: center !important;
        
    }
    th {
        background-color: #4CAF50;
        color: white;
        font-size : 18px;
    }
    td{
    font-size : 14px;
    }
    
   
    
    
</style>
</head>
<body>
    <!-- Header -->
    	<jsp:include page="header.jsp" />
    <div class="container" style="display : flex ;
         justify-content: center;align-items: center; flex-direction: column;">
        <h2 style="color: green; ">Admin Management Panel</h2>
 

    <div class="tab">
        <h2>Staff List</h2>
        <%
            UserService userService = new UserServiceImpl();
            List<UserBean> staffList = userService.getAllStaff();
        %>
        <table>
            <tr>
                <th >Email</th>
                <th >Name</th>
                <th >Phone Number</th>
                <th >Address</th>
                <th >Pincode</th>
                <th >Role</th>
                <th >Position</th>
            </tr>
            <%
                for (UserBean user : staffList) {
            %>
            <tr >
                <td ><%= user.getEmail() %></td>
                <td ><%= user.getName() %></td>
                <td ><%= user.getMobile() %></td>
                <td ><%= user.getAddress() %></td>
                <td ><%= user.getPinCode() %></td>
                <td ><%= user.getRole() %></td>
                <td ><%= user.getPosition() %></td>
            </tr>
            <%
                }
            %>
        </table>
         <br>
        <a href="manageStaff.jsp" class="btn btn-default" style="width: 100%; margin-top: 20px;background-color: #d43f3a;    color: #fff;
        ">Back to Manage Staff</a>
    
    </div>
   </div>
    
    	<%@ include file="footer.html"%>
</body>
</html>
