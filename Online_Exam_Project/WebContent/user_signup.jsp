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
String uname=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
long mob=0;
int pass=0;
if(mobile!=null){
mob=Long.parseLong(mobile);}

String pas=request.getParameter("pass");
if(pas!=null){
pass=Integer.parseInt(pas);	
}
String qualify=request.getParameter("qualify");
String sub=request.getParameter("subject");
String grad=request.getParameter("grade");
int grade=0;
if(grad!=null)
{
	grade=Integer.parseInt(grad);
}
String psw=request.getParameter("psw");

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","1234");
String query="insert into user_table(name,email,mobile,pass_year,qualify,subject,grade,password) values(?,?,?,?,?,?,?,?)";
PreparedStatement ps=conn.prepareStatement(query);
ps.setString(1,uname);
ps.setString(2,email);
ps.setLong(3,mob);
ps.setInt(4,pass);
ps.setString(5,qualify);
ps.setString(6,sub);
ps.setInt(7,grade);
ps.setString(8,psw);
ps.executeUpdate();
%>
<h2>You Have successfully Signed Up</h2>
<a href="user.html">Go to Login Page</a>
</body>
</html>