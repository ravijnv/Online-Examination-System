2<%@page import="java.sql.PreparedStatement"%>
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
<body style="margin-left:185px;">
<%
String nme=request.getParameter("name");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","1234");
String query="select * from feedback_table";
Statement st=conn.createStatement();
 ResultSet rs=st.executeQuery(query);
%>
<h2>WELCOME <%=nme %></h2><br><br><br>
<%session.setAttribute("id",1); 
session.setAttribute("corr", 0);
%>
<a href="ques1.jsp" style="font-family:sans-serif;font-size: 22px;color:red;"> Give Test</a><br><br>
<a href="feedback.html" style="font-family:sans-serif;font-size: 22px;color:red;"> Give Feedback</a><br><br><br>
<i><h4 style="color:#22355">Users review</h4></i>

<fieldset style="font-family:sans-serif;color:blue;width:700px;height:350px;"><marquee direction="up" height="90%" scrolldelay="100" truespeed>
<%
while(rs.next())
{
	String fdd="";
	fdd=rs.getString("feedback");
%>
<%=fdd %>
<br><br>
<%
}%>
</marquee></fieldset>
</body>
</html>