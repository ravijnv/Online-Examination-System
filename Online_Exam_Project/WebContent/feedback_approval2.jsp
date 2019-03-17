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
String op=request.getParameter("opt");
String fod="";
int opp=Integer.parseInt(op);
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","1234");
String query="select * from tempfeedback_table where id='"+opp+"' ";
Statement st=conn.createStatement();
Statement st2=conn.createStatement();

String query3="delete  from tempfeedback_table where id='"+opp+"' ";
 ResultSet rs=st.executeQuery(query);
 if(rs.next()){
 fod=rs.getString("feedback");
 }
 String query2="";
 query2="insert into feedback_table(feedback) values(?)";
 PreparedStatement ps=conn.prepareStatement(query2);
 ps.setString(1,fod);
 ps.executeUpdate();
 st2.executeUpdate(query3);
%>
<h2> Feedback Successfully Added</h2>
<h3>Approve Another</h3>
<jsp:include page="feedback_approve.jsp"></jsp:include>
</body>
</html>