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
String res="";
String uname="";
String pass="";
res=request.getParameter("result");
int grade=(int)(Integer.parseInt(res)*100/25);
if(grade<50)
{
	grade=50;
}
uname=(String)session.getAttribute("uname");
pass=(String)session.getAttribute("pass");

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","1234");
String query="update user_table set marks=? where email='"+uname+"' and password='"+pass+"'";
String query2="update user_table set grade=? where email='"+uname+"' and password='"+pass+"'";
PreparedStatement ps=conn.prepareStatement(query);
PreparedStatement ps2=conn.prepareStatement(query2);
ps.setString(1,res);
ps2.setInt(1, grade);
ps.executeUpdate();
ps2.executeUpdate();
%>
<h3>Thank You </h3>
<h2>Your performance is as follow:</h2>
<h2>Marks Obtained = <%=res %></h2>
<h2>Grade obtained = <%=grade %>%</h2>
<p>Note:If Your Grade is Less than 50 You will Be Allotted 50% automatically</p>
</body>
</html>