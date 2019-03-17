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
String uname=request.getParameter("uname");
String pass=request.getParameter("psw");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","1234");
String query="select * from company_table where password='"+pass+"' and email='"+uname+"'";
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery(query);
String un="";
String ps="";
String an="";
if(rs.next())
{
	an=rs.getString("name");
%>
<jsp:forward page="welcome_company.jsp">

<jsp:param value="<%=an %>" name="name"/>
</jsp:forward>
<%
	}
	else
	{
%>
<h4>Wrong Credentials</h4>
<jsp:include page="user.html"></jsp:include>
<%
	}

conn.close();
st.close();
rs.close();
%>

</body>
</html>