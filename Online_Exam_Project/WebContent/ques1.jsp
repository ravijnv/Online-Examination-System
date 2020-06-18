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
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
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
  background-color: #f1f1f1;
  padding: 20px 10px;
}

.header a {
  float: left;
  color: black;
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
var countDownDate = new Date("July 5, 2021 15:37:25").getTime();

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
<div class="column" style="background-color:#bbb;">
  <h2 style="text-align:center;">Collecting Coins</h2><br>
 <p style="word-spacing:10px;text-align:center; font-family:Baskerville;font-size:30px;"> 
<pre>time limit per test 2 seconds<br><br>
memory limit per test 256 megabytes<br><br><br>

Polycarp has three sisters: Alice, Barbara, and Cerene. 
They're collecting coins. Currently, Alice has a coins,
 Barbara has b coins and Cerene has c coins. Recently 
 Polycarp has returned from the trip around the world
 and brought n coins.

He wants to distribute all these n coins between his 
sisters in such a way that the number of coins Alice 
has is equal to the number of coins Barbara has and 
is equal to the number of coins Cerene has. In other
 words, if Polycarp gives A coins to Alice, B coins 
to Barbara and C coins to Cerene (A+B+C=n), then a+A=b+B=c+C.

Note that A, B or C (the number of coins Polycarp 
gives to Alice, Barbara and Cerene correspondingly) can be 0.

Your task is to find out if it is possible to distribute
 all n coins between sisters in a way described above.

You have to answer t independent test cases.

Input
The first line of the input contains one integer t 
 the number of test cases.

The next t lines describe test cases. Each test case
is given on a new line and consists of four space-separated
integers a,b,c and n (1â‰¤a,b,c,nâ‰¤108) â€” the number
 of coins Alice has, the number of coins Barbara has, the
number of coins Cerene has and the number of coins Polycarp has.

Output
For each test case, print "YES" if Polycarp can distribute all
 n coins between his sisters and "NO" otherwise.

Example
input
5
5 3 2 8
100 101 102 105
3 2 1 100000000
10 20 15 14
101 101 101 3
output
YES
YES
NO
NO
YES


	
<pre></pre> </p> </div>
  <div class="column" style="background-color:#aaa;">
    <div id=lang_select>
	<select>
	<option value="cpp">C++</option>
	<option value="java">JAVA</option>
	<option value="python">PYTHON</option>
	</select>
	
	</div>
    <div id="editor">function foo(items) {
    var x = "All this is syntax highlighted";
    return x;
}</div>
<div>
<button type="submit" style="float:right;cursor:pointer;">Submit</button>

</div>
  </div>
</div>
<script src="ace-builds\src-noconflict\ace.js" type="text/javascript" charset="utf-8"></script>
<script>
    var editor = ace.edit("editor");
	editor.resize()
    editor.setTheme("ace/theme/monokai");
    editor.session.setMode("ace/mode/c_cpp");
	editor.setOptions({
	maxLines:25,
	minLines:25,
    autoScrollEditorIntoView: true,
    copyWithEmptySelection: true,
});
document.getElementById('editor').style.fontSize='18px';
</script>
</body>
</html>
