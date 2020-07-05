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
<%@page import="java.lang.*"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compiling</title>
</head>
<body>

<%

// taking input file
String path2="C:\\Users\\ravindra kumar\\git\\Online-Examination-System\\Online_Exam_Project\\WebContent\\questions\\";
File f_new=new File(path2+"1\\input");
String[] inp_list=f_new.list();
f_new=new File(path2+"1\\output");
String[] out_list=f_new.list();
Scanner scan=new Scanner(System.in); 
String code=request.getParameter("code");
session.setAttribute((String)"code",code);
String lang=request.getParameter("lang");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam","root","1234");
String query="select * from file_counter";
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery(query);
rs.next();
int cnt=rs.getInt("counter");
query="truncate table file_counter";
st.executeUpdate(query);
query="insert into file_counter(counter) values(?)";
PreparedStatement ps=conn.prepareStatement(query);
ps.setInt(1,cnt+1);
ps.executeUpdate();
String cntt=Integer.toString(cnt);
String path="C:\\Users\\ravindra kumar\\git\\Online-Examination-System\\Online_Exam_Project\\WebContent\\";
if(lang.equals("g++")){
	
  File f=new File(path+"C++\\code_file"+cntt+".cpp");
 if(f.exists()){
	f.delete();
} 

try{
	

boolean c=f.createNewFile();

if(c){
	System.out.println("Created");
}
else{
	System.out.println("Failed");
}
}
catch (IOException e){
	System.out.println("Exception");
}
Writer fw = new BufferedWriter(new FileWriter(f));
fw.write(code);
fw.flush();
fw.close();  


// compiling
char ch='"';
File compiled_output=new File(path+"C++\\compiled_output"+cntt+".txt");
File executed_output =new File(path+"C++\\executed_output"+cntt+".txt");
if(compiled_output.exists()){
	compiled_output.delete();
}
if(executed_output.exists()){
	executed_output.delete();
}
try{
List<String>cmd_compile=new ArrayList<String>();
cmd_compile.add("g++");
cmd_compile.add("-o");

String temp=ch+(path+"C++\\code_file"+cntt)+ch;
cmd_compile.add(temp);
String temp2=ch+(path+"C++\\code_file"+cntt+".cpp")+ch;
cmd_compile.add(temp2);

Process proc = new ProcessBuilder(cmd_compile)
.redirectErrorStream(true)
.redirectOutput(compiled_output)
.start();
proc.waitFor();
}
catch(Exception e){
	System.out.println("Fsailed");
}
if(compiled_output.length()==0){
// executing
try{

//PrintStream o=new PrintStream(executed_output);
List<String>cmd_execute=new ArrayList<String>();

String temp=ch+(path+"C++\\code_file"+cntt+".exe")+ch;
cmd_execute.add(temp);
//cmd_execute.add("<");
String temp2=ch+(path2+ "1\\input\\1.txt")+ch;
//cmd_execute.add(temp2);
 Process proc2 = new ProcessBuilder(cmd_execute)
.redirectErrorStream(true)	 
.directory(new File(path+"C++\\"))
.redirectOutput(executed_output )
.start();
proc2.getOutputStream().close();

  if(proc2.waitFor(10,TimeUnit.SECONDS)){
	  try{
	  File ff=new File(path+"C++\\executed_output"+cntt+".txt");
	 // byte[] b1=Files.readAllBytes(ff);
	 // byte[] b2=Files.readAllBytes(new File(path2+"1\\output\\1.txt"));
	  
	   FileReader fr=new FileReader(ff); 
	   FileReader fr2=new FileReader(new File(path2+"1\\output\\1.txt"));
	  BufferedReader br=new BufferedReader(fr);
	  BufferedReader br2=new BufferedReader(fr2);
	  String ln="ki";  
	  String ln2="mm";
	  int flg=0;
	  //out.println(ln);
	  //Scanner scc=new Scanner(ff);
	  System.out.println("fgxfgg");
	  while((ln=br.readLine())!=null && (ln2=br2.readLine())!=null ){
	  	System.out.println(ln.length()+" bg "+ln2.length());
	  	 if(!ln.equals(ln2)){
	  		 flg=1;
	  		 break;
	  	 }
	  }
	  //System.out.println(ln "  m "+ln2);
	  ln2=br2.readLine();
	  if(ln==null && ln2==null && flg==0){
		  out.println("All Test Cases Passed Successfully");
		  %>
		  <form method="post"  action="index.html">
		  
		  <input type="submit" value="Go To Home Page"> 
		  </form>
		  <%
	  }
	  else{
		  out.println("Test case failed");
	  }
  }
  
  catch(Exception ee){
	  out.println("File read error");
  }
  }
  else{
	  out.println("Time Limit Exceeded");
  }

}
catch(Exception e){ 
	out.println("failed _execution ");
}
}	
else{
	out.println("Compile Failed");
	%>
	<br><br>
<%
FileReader fr2=new FileReader(compiled_output);
BufferedReader br2=new BufferedReader(fr2);
String ln2;
while((ln2=br2.readLine())!=null){
	out.println(ln2);
	%><br><%
}
}
}
else if(lang.equals("java")){
	 File f=new File(path+"Java\\code_file"+cntt+".java");
	 if(f.exists()){
		f.delete();
	} 

	try{
		

	boolean c=f.createNewFile();

	if(c){
		System.out.println("Created");
	}
	else{
		System.out.println("Failed");
	}
	}
	catch (IOException e){
		System.out.println("Exception");
	}
	Writer fw = new BufferedWriter(new FileWriter(f));
	fw.write(code);
	fw.flush();
	fw.close();  


	// compiling
    File compiled_output=new File(path+"Java\\compiled_output"+cntt+".txt");
    File executed_output =new File(path+"Java\\executed_output"+cntt+".txt");
     if(compiled_output.exists()){
    	compiled_output.delete();
    }
    if(executed_output.exists()){
    	executed_output.delete();
    } 
    try{
	List<String>cmd_compile=new ArrayList<String>();
	cmd_compile.add("javac");
	char ch='"';
	String temp=ch+(path+"Java\\code_file.java")+ch;
	cmd_compile.add(temp);
	
	
	Process proc = new ProcessBuilder(cmd_compile)
	.redirectErrorStream(true)
	.directory(new File(path+"Java\\"))
	.redirectErrorStream(true)
	.redirectOutput(compiled_output)
	.start();
	proc.getOutputStream().close();
    proc.waitFor(); 
    }
    catch(Exception e){
    	out.println("Compilation Failed");
    }
	// executing
	if(compiled_output.length()==0){
		try{
	//File executed_output =new File(path+"Java\\executed_output.txt");
	List<String>cmd_execute=new ArrayList<String>();
    char ch='"';
    cmd_execute.add("java");
	String temp="Solution";
	cmd_execute.add(temp);
	 Process proc2 = new ProcessBuilder(cmd_execute)
	.redirectErrorStream(true)
	.directory(new File(path+"Java\\"))
	.redirectOutput(executed_output)
	.start();
	proc2.getOutputStream().close();

	  if(proc2.waitFor(4,TimeUnit.SECONDS)){
		  try{
		  File ff=new File(path+"Java\\executed_output.txt");
		  FileReader fr=new FileReader(ff); 
		  BufferedReader br=new BufferedReader(fr);
		  String ln=br.readLine();  
		  //out.println(ln);
		  //Scanner scc=new Scanner(ff);
		  while(ln!=null){
		  	out.println(ln);
		  	//out.println(ln);
		  	%><br><% 
		  	ln=br.readLine();
		  }
	  }
	  
	  catch(Exception ee){
		  out.println("File read error");
	  }
	  }
	  else{
		  out.println("Time Limit Exceeded");
	  }
	  
		}
		catch(Exception eee){
			out.println("Exeution Failed Exception Occured");
		}

}
	else{
		out.println("Compile Failed");
		%>
		<br><br>
	<%
	FileReader fr2=new FileReader(compiled_output);
	BufferedReader br2=new BufferedReader(fr2);
	String ln2;
	while((ln2=br2.readLine())!=null){
		out.println(ln2);
		%><br><%
	}
	}
}
else{
	 File f=new File(path+"Python\\code_file"+cntt+".py");
	 if(f.exists()){
		f.delete();
	} 

	try{
		

	boolean c=f.createNewFile();

	if(c){
		System.out.println("Created");
	}
	else{
		System.out.println("Failed");
	}
	}
	catch (IOException e){
		System.out.println("Exception");
	}
	Writer fw = new BufferedWriter(new FileWriter(f));
	fw.write(code);
	fw.flush();
	fw.close();  


	// compiling
     File compiled_output=new File(path+"Python\\compiled_output"+cntt+".txt");
	if(compiled_output.exists()){
		compiled_output.delete();
	}
	try{
	List<String>cmd_compile=new ArrayList<String>();
	cmd_compile.add("python");
	
	char ch='"';
	String temp=ch+(path+"Python\\code_file"+cntt+".py")+ch;
	cmd_compile.add(temp);
	//File compiled_output=new File(path+"Python\\compiled_output.txt");
	Process proc = new ProcessBuilder(cmd_compile)
	.redirectErrorStream(true)
	.directory(new File(path))
	.redirectErrorStream(true)
	.redirectOutput(compiled_output)
	.start();
	proc.getOutputStream().close();
	if(proc.waitFor(10,TimeUnit.SECONDS)){
		FileReader fr=new FileReader(compiled_output);
		BufferedReader br=new BufferedReader(fr);
		String ln=br.readLine();
		if(ln.equals("Traceback (most recent call last):")){
			out.println("Compile Error");
			%><br><br><% 
			
		}
		out.println(ln);
		%><br><%
		while((ln=br.readLine())!=null){
			out.println(ln);
			%><br><%
		}
	}
	else{
		out.println("Time Limit Exceeded");
	}
	}
	catch(Exception e){
		out.println("Exception Occured");
	}

}
%>
</body>
</html>