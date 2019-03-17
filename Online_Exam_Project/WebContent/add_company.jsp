<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String psw=request.getParameter("psw");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","1234");
String query="insert into company_table(name,email,mobile,password) values(?,?,?,?)";
Statement st=conn.createStatement();
PreparedStatement ps= conn.prepareStatement(query);
ps.setString(1, name);
ps.setString(2,email);
ps.setString(3,mobile);
ps.setString(4,psw);
ps.executeUpdate();
%>
<h2>Company Added Successfully</h2>
<a href="welcome_admin.jsp"></a>
</body>
</html>