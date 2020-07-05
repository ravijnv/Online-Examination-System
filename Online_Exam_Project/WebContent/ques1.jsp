<%@page import="org.apache.catalina.util.SessionConfig"%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.button {
  background-color: #1c2ac7;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
html {
    overflow: scroll;
    overflow-x: hidden;
}
::-webkit-scrollbar {
    width: 0px;  /* Remove scrollbar space */
    background: transparent;  /* Optional: just make scrollbar invisible */
}
/* Optional: show position indicator in red */
::-webkit-scrollbar-thumb {
    background: #FF0000;
}
* {
  box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
#editor { 
        
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
		width : 100%;
		height:100%;
    }
    #question { 
        
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
		width : 100%;
		height:550px;
		overflow:auto;
    }
.column {
  float: left;
  width: 50%;
  padding: 10px;
  overflow:scroll;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
  overflow:scroll;
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
 
  }
}
.header {
  overflow: hidden;
  background-color: black;
  padding: 5px 10px;
}

.header a {
  float: left;
  color: white;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}

.header a.logo {
  font-size: 25px;
  font-weight: bold;
}

.header a:hover {
  background-color: #ddd;
  color: black;
}



.header-right {
  float: center;
}

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  
  .header-right {
    float: none;
  }
}
body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}
#demo {
float:right;
text-align: center;
  font-size: 20px;
  margin-top: 0px;
  color: white;

}
</style>
</head>
<body>

<div class="header">
<a href="#">Leaderboard</a>
<a href="#">My Submission</a>
<p id="demo" ></p>
<script>
// Set the date we're counting down to
var countDownDate = new Date("July 24, 2020 11:55:00").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();
    
  // Find the distance between now and the count down date
  var distance = countDownDate - now;
    
  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
  // Output the result in an element with id="demo"
  document.getElementById("demo").innerHTML = hours + "h "
  + minutes + "m " + seconds + "s ";
    
  // If the count down is over, write some text 
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "EXPIRED";
  }
}, 1000);
</script>
</div>

<div class="row">
<div class="column" style="background-color:white;"><div id="question">
<%
String code=(String)session.getAttribute("code");
if(code==null){
	code="// write your code here";
}
code.replaceAll("\n",",");
System.out.println(code);
String path="C:\\Users\\ravindra kumar\\git\\Online-Examination-System\\Online_Exam_Project\\WebContent\\questions\\";
File ques=new File(path+"1\\statement");
String [] lst=ques.list();
String title =  lst[0];
%>
  <h2 style="text-align:center;font-family:Times New Roman;"><%=title%></h2><br>
 <p style="text-align:center;font-family:Times New Roman;font-size:20px;" ><b> time limit per test 2 seconds</b></p><br>
<p style="text-align:justify;font-family:Areal;font-size:20px;word-spacing:10px;line-height:1.3">
<%
File f=new File(path+"1\\statement\\"+title);
FileReader fr=new FileReader(f);
BufferedReader br=new BufferedReader(fr);
String ln;
while((ln=br.readLine())!=null){
	out.println(ln);
	%><br><%
}

%>

<b>Sample Test :</b><br><br>
<b>input</b><br>
<% File ff=new File(path+"1\\sample_input.txt");
FileReader ffr=new FileReader(ff);
BufferedReader bfr=new BufferedReader(ffr);
while((ln=bfr.readLine())!=null){
	out.println(ln);
	%><br><%
}
%>
<b>output</b><br>
<% File fff=new File(path+"1\\sample_output.txt");
FileReader fffr=new FileReader(fff);
BufferedReader bffr=new BufferedReader(fffr);
while((ln=bffr.readLine())!=null){
	out.println(ln);
	%><br><%
}
%>



	
 </p></div> </div>
  <div class="column" style="background-color:#aaa;">
    <div id=lang_select>
	<select onchange="check(this);" form="myform" name="lang">
	<option value="g++">C++</option>
	<option value="java">JAVA</option>
	<option value="py3">PYTHON</option>
	</select>
	
	</div>
    <div id="editor">
  
    
</div>
<div>
<button class="button"  type="submit" form ="myform" style="float:right;cursor:pointer;" onsubmit="setter()">Submit</button>

</div>
  </div>
</div>
<form id="myform"  action="compile.jsp" method="post">
<input type="hidden" name="code" method="post"style="display:none;">
</form>

<script src="ace-builds\src-noconflict\ace.js" type="text/javascript" charset="utf-8"></script>
<script>
    var def='#include bits/stdc++.h>\n using namespce std; \n int main{ \n cout<< "hello world"<<endl; \n }';
    
    var editor = ace.edit("editor");
	editor.resize()
    editor.setTheme("ace/theme/monokai");
    editor.session.setMode("ace/mode/c_cpp");
	editor.setOptions({
	maxLines:22,
	minLines:22,
    autoScrollEditorIntoView: true,
    copyWithEmptySelection: true,
});
	var input = $('input[name="code"]');
    editor.getSession().on("change", function () {
    input.val(editor.getSession().getValue());
    //editor.getSession.setValue(input.val());
    });
    
document.getElementById('editor').style.fontSize='18px';
function check(elem){
	  var lang = elem.options[elem.selectedIndex].value;
	  if(lang=="g++"){
	    editor.session.setMode("ace/mode/c_cpp");
	  }
	  if(lang=="py3"){
	    editor.session.setMode("ace/mode/python");
	  }
	  if(lang=="java"){
	    editor.session.setMode("ace/mode/java");
	  }
	}

	//editor.setValue(v);
	

</script>
</body>
</html>
