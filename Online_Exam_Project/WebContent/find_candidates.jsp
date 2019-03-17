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
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","1234");
String query="";
Statement st=conn.createStatement();
String  g1="";
String  g2="";
String  q="";
String  sub="";
String  p1="";
String  p2="";
String stt="";
String stt2="";
int id=0;
String mob="";
g1=request.getParameter("grade1");
g2=request.getParameter("grade2");
q=request.getParameter("qualify");
sub=request.getParameter("subject");
p1=request.getParameter("pass1");
p2=request.getParameter("pass2");
%>
<table style="border:1px solid red;padding:25px;margin:25px;background:black;color:white;">
<tr style="border:none;padding:25px;margin:25px;">
<th style="border:none;padding:25px;margin:25px;">ID</th>
<th style="border:none;padding:25px;margin:25px;">Name</th>
<th style="border:none;padding:25px;margin:25px;">Email</th>
<th style="border:none;padding:25px;margin:25px;">mobile</th>
</tr>
<%
if(g1.equals("no") && g2.equals("no") && q.equals("no") && sub.equals("no") && p1.equals("no") && p2.equals("no"))
{
	query="select * from user_table";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
 if(!g1.equals("no") && !g2.equals("no") && q.equals("no") && sub.equals("no") && p1.equals("no") && p2.equals("no"))
{
	int gg1=Integer.parseInt(g1);
	int gg2=Integer.parseInt(g2);
	query="select * from user_table where grade >= '"+gg1+"' and grade <= '"+gg2+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
if(g1.equals("no") && g2.equals("no") && !q.equals("no") && sub.equals("no") && p1.equals("no") && p2.equals("no"))
{
	
	query="select * from user_table where qualify = '"+q+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
 if(g1.equals("no") && g2.equals("no") && q.equals("no") && !sub.equals("no") && p1.equals("no") && p2.equals("no"))
{
	
	query="select * from user_table where subject = '"+sub+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
 if(g1.equals("no") && g2.equals("no") && q.equals("no") && sub.equals("no") && !p1.equals("no") && !p2.equals("no"))
{
	int pp1=Integer.parseInt(p1);
	int pp2=Integer.parseInt(p2);
	query="select * from user_table where pass_year >= '"+pp1+"' and pass_year<='"+pp2+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
if(!g1.equals("no") && !g2.equals("no") && !q.equals("no") && sub.equals("no") && p1.equals("no") && p2.equals("no"))
{
	int gg1=Integer.parseInt(g1);
	int gg2=Integer.parseInt(g2);
	query="select * from user_table where  grade>= '"+gg1+"' and grade<='"+gg2+"' and qualify ='"+q+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
if(!g1.equals("no") && !g2.equals("no") && q.equals("no") && !sub.equals("no") && p1.equals("no") && p2.equals("no"))
{
	int gg1=Integer.parseInt(g1);
	int gg2=Integer.parseInt(g2);
	query="select * from user_table where  grade>= '"+gg1+"' and grade<='"+gg2+"' and subject ='"+sub+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
if(!g1.equals("no") && !g2.equals("no") && q.equals("no") && sub.equals("no") && !p1.equals("no") && !p2.equals("no"))
{
	int gg1=Integer.parseInt(g1);
	int gg2=Integer.parseInt(g2);
	int pp1=Integer.parseInt(p1);
	int pp2=Integer.parseInt(p2);
	query="select * from user_table where  grade>= '"+gg1+"' and grade<='"+gg2+"' and pass_year >='"+pp1+"' and pass_year <='"+pp2+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
if(g1.equals("no") && g2.equals("no") &&! q.equals("no") && sub.equals("no") && !p1.equals("no") && !p2.equals("no"))
{
	int gg1=Integer.parseInt(g1);
	int gg2=Integer.parseInt(g2);
	int pp1=Integer.parseInt(p1);
	int pp2=Integer.parseInt(p2);
	query="select * from user_table where  qualify='"+q+"' and pass_year >='"+pp1+"' and pass_year <='"+pp2+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
if(g1.equals("no") && g2.equals("no") &&! q.equals("no") && !sub.equals("no") && p1.equals("no") && p2.equals("no"))
{
	int gg1=Integer.parseInt(g1);
	int gg2=Integer.parseInt(g2);
	int pp1=Integer.parseInt(p1);
	int pp2=Integer.parseInt(p2);
	query="select * from user_table where  qualify='"+q+"' and subject='"+sub+"' ";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
if(g1.equals("no") && g2.equals("no") && q.equals("no") && !sub.equals("no") && !p1.equals("no") && !p2.equals("no"))
{

	int pp1=Integer.parseInt(p1);
	int pp2=Integer.parseInt(p2);
	query="select * from user_table where subject='"+sub+"' and pass_year >= '"+pp1+"' and pass_year <='"+pp2+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
if(!g1.equals("no") && !g2.equals("no") && !q.equals("no") && sub.equals("no") && !p1.equals("no") && !p2.equals("no"))
{
	int gg1=Integer.parseInt(g1);
	int gg2=Integer.parseInt(g2);
	int pp1=Integer.parseInt(p1);
	int pp2=Integer.parseInt(p2);
	query="select * from user_table where  grade>= '"+gg1+"' and grade<='"+gg2+"' and pass_year >='"+pp1+"' and pass_year <='"+pp2+"' and qualify='"+q+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
if(!g1.equals("no") && !g2.equals("no") && q.equals("no") && !sub.equals("no") && !p1.equals("no") && !p2.equals("no"))
{
	int gg1=Integer.parseInt(g1);
	int gg2=Integer.parseInt(g2);
	int pp1=Integer.parseInt(p1);
	int pp2=Integer.parseInt(p2);
	query="select * from user_table where  grade>= '"+gg1+"' and grade<='"+gg2+"' and pass_year >='"+pp1+"' and pass_year <='"+pp2+"' and  subject='"+sub+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
if(!g1.equals("no") && !g2.equals("no") && !q.equals("no") && !sub.equals("no") && p1.equals("no") && p2.equals("no"))
{
	int gg1=Integer.parseInt(g1);
	int gg2=Integer.parseInt(g2);
	int pp1=Integer.parseInt(p1);
	int pp2=Integer.parseInt(p2);
	query="select * from user_table where  grade>= '"+gg1+"' and grade<='"+gg2+"' and qualify ='"+q+"'and  subject='"+sub+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
if(g1.equals("no") && g2.equals("no") && !q.equals("no") && !sub.equals("no") && !p1.equals("no") && !p2.equals("no"))
{
	int pp1=Integer.parseInt(p1);
	int pp2=Integer.parseInt(p2);
	query="select * from user_table where  qualify='"+q+"' and pass_year >='"+pp1+"' and pass_year <='"+pp2+"' and  subject='"+sub+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>
<%
if(!g1.equals("no") && !g2.equals("no") && !q.equals("no") && !sub.equals("no") && !p1.equals("no") && !p2.equals("no"))
{
	int pp1=Integer.parseInt(p1);
	int pp2=Integer.parseInt(p2);
	int gg1=Integer.parseInt(g1);
	int gg2=Integer.parseInt(g2);
	query="select * from user_table where  qualify='"+q+"' and pass_year >='"+pp1+"' and pass_year <='"+pp2+"' and  subject='"+sub+"' and grade >= '"+gg1+"' and grade <='"+gg2+"'";	
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
		stt=rs.getString("name");
		stt2=rs.getString("email");
		id=rs.getInt("id");
		mob=rs.getString("mobile");
		%>
	<tr style="border:none;padding:25px;margin:25px;">
	<td style="border:none;padding:25px;margin:25px;"><%=id %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=stt2 %></td>
	<td style="border:none;padding:25px;margin:25px;"><%=mob %></td>
		</tr>
<%
}
}
%>

</table>
</body>
</html>