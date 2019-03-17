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
<body><%
String ques=request.getParameter("question");
String op1=request.getParameter("option1");
String op2=request.getParameter("option2");
String op3=request.getParameter("option3");
String op4=request.getParameter("option4");
String corect=request.getParameter("correct");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","1234");
String query="insert into question_table(question,option1,option2,option3,option4,right_option) values(?,?,?,?,?,?)";
PreparedStatement ps=conn.prepareStatement(query);
ps.setString(1,ques);
ps.setString(2,op1);
ps.setString(3,op2);
ps.setString(4,op3);
ps.setString(5,op4);
ps.setInt(6,Integer.parseInt(corect));
ps.executeUpdate();
ps.close();
conn.close();
%>
<h2>Question Added Successfully</h2><br>
<h2>Add Another Question</h2><br>
<jsp:include page="add_question.html"></jsp:include>
<a href="admin.html">GO TO HOME</a>
</body>
</html>