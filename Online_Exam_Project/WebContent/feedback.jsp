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
String fd="";
fd=request.getParameter("feedback");
String bbb=(String)session.getAttribute("namer");
fd=fd+"\n\r"+"=>"+bbb;
if(!fd.equals("")){
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","1234");
String query="insert into tempfeedback_table(feedback) values(?)";
PreparedStatement ps= conn.prepareStatement(query);
ps.setString(1,fd);
ps.executeUpdate();
}
%>
<i><h1>Thank You For Your Valuable Feedback</h1></i>
<a href="welcome_user.jsp" style="color:red;"> Go to Home Page</a>
</body>
</html>