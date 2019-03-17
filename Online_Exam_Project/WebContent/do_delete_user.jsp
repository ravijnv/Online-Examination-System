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
int id=Integer.parseInt(request.getParameter("usr"));
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","1234");
String query="delete from user_table where id='"+id+"'";
Statement st=conn.createStatement();
st.executeUpdate(query);
String query2="ALTER TABLE `user_table` DROP `id`";
String query3="ALTER TABLE `user_table` AUTO_INCREMENT = 1";
String query4="ALTER TABLE `user_table` ADD `id` int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST";
st.executeUpdate(query2);
st.executeUpdate(query3);
st.executeUpdate(query4);
%>
<h3>User<%=id %> Deleted Successfully</h3>
<jsp:include page="delete_user.jsp"></jsp:include>
</body>
</html>