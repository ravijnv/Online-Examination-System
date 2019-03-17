<%@page import="org.apache.catalina.util.SessionConfig"%>
<%@page import="javax.websocket.Session"%>
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
<style type="text/css">
.a {

margin:55px;
 font-family:verdana;
 padding:45px;
 font-size:20px;
 }
 .b {
margin-left:45px;
 font-family:verdana;
 padding:25px;
 font-size:20px;
 
 }
 </style>
 
</head>
<body>
<% 
int id=(int)session.getAttribute("id");
if(id>25)
{
	%>
	<jsp:forward page="result.jsp">
	<jsp:param value='<%=session.getAttribute("corr")%>' name="result"/>
	
	</jsp:forward>
	<% 
}
%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","1234");
String query="select * from question_table where id='"+id+"'";
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery(query);
String q="null";
String o1="null";
String o2="null";
String o3="null";
String o4="";
int sn=0;
int right=0;
if(rs.next())
{
	sn=rs.getInt("id");
	q=rs.getString("question");
	o1=rs.getString("option1");
	o2=rs.getString("option2");
	o3=rs.getString("option3");
	o4=rs.getString("option4");
	right=Integer.parseInt(rs.getString("right_option"));
}


 rs.close();
 st.close();
 conn.close();
%>
<div>
<pre class="a">
<%out.println(id); %>
<% out.println(q); %>
</pre></div>
<br><br>
<form class="b" action="ques1.jsp">
<input class="b" type="radio" name="ans"value="1"><% out.println(o1); %>
<br><br>
<input class="b" type="radio" name="ans"value="2"><% out.println(o2); %>
<br><br>
<input class="b" type="radio" name="ans"value="3" ><% out.println(o3); %>
<br><br>
<input class="b" type="radio" name="ans"value="4" ><% out.println(o4); %>
<button type="submit"style="width:65px;color:blue;background:yellow;height:30px;">NEXT</button>
</form>
<% 
int stu=5;
int corr=0;
String g="";
g=request.getParameter("ans");
if(g!=null){
	stu=Integer.parseInt(g);
}
else{
	stu=5;
}


if(stu==right)
{
	corr=(int)session.getAttribute("corr");
	++corr;
	session.setAttribute("corr", corr);
}
session.setAttribute("id",++id);

%>
</body>
</html>