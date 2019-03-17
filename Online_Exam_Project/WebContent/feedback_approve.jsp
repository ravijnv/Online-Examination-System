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
<table width="100%">
<tr>
<th>S.N</th>
<th>Feedback</th>
</tr>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","1234");
String query="select * from tempfeedback_table";
Statement st=conn.createStatement();
 ResultSet rs=st.executeQuery(query);
while(rs.next())
{
	int id=rs.getInt("id");
	String fgd=rs.getString("feedback");
%>

<tr>
<td><%= id%></td>
<td><%= fgd%></td>
</tr>
<%
}
%>
</table>
<h2>Enter The Serial Number Of Feedback You Want to Approve</h2>
<form action="feedback_approval2.jsp">
<input type="text" name="opt">
<input type="submit">

</form>
</body>
</html>