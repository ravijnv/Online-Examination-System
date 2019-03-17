<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
a {
text-decoration:none;
color:red;

}


</style>

</head>
<body>
<%
String name=request.getParameter("name");
%>
<h2 style="font-family:cursive">Welcome <%=name %></h2>
<a href="delete_user.jsp">DELETE USER</a>
<br><br>
<a href="delete_company.jsp">DELETE COMPANY</a>
<br><br>
<a href="add_company.html">ADD COMPANY</a>
<br><br>
<a href="show_company.jsp">SHOW COMPANY</a>
<br><br>
<a href="show_user.jsp">SHOW USER</a>
<br><br>
<a href="feedback_approve.jsp">APPROVE FEEDBACK/REVIEW</a>
<br><br>
</body>
</html>