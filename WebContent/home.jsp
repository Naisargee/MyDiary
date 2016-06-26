<!-- -Below All @page import tabs are used to import java classes. Here MyPackage is package in which my classes are  
	User,Post,UserPost,PostStore are my classes......
-->

<%@page import="MyPackage.User" %>
<%@page import="MyPackage.UserStore" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/main.js"></script>
	<title>Niya_Book</title>
</head>
<body style="background-image: url('images/full01.jpg');">
 
 <%
 	int u=Integer.parseInt(request.getParameter("user_id")); //Parameters are passed in url using GET method from previos page
 %>
 
 
 <div class="container-fluid">
 	<div class="text-center button" onClick="location.href='index.jsp'">
 		 <button>LogOut</button>
 		<!--  <span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>  -->
 	</div>
 	<div class="row">
 		<div class="col-md-12 text-center"><h2><%=UserStore.getUserStore().getNameById(u) %> 's Diary !!</h2></div>
 	</div>
 	<div class="row">
		<hr>
		<hr>
	</div>
	<div class="text-center" style="opacity:0.8">
		<form method="post" action="posted.jsp?user_id=<%=u%>">
		 <div class="row">
			<div class="col-md-12"><h4>How was your day today ??</h4></div>
		</div>

		<div class="row">
			<div><textarea rows="14" cols="150" name="post"></textarea><br><br></div>
		</div>
<!-- 		<div class="row">
			<div class="col-md-6 text-right"><h4>Want to Attach any file ? </h4><br></div>
			<div class="col-md-6 text-left"><input type="file"></h4></div>
		</div>
 -->	
		<div class="row">
			<div><input type="submit" value="Write"></div>
		</div>	
		<input type="hidden" name=user value=<%=u %>>
		</form>
	</div>
	<div class="row">
		<hr>
		<hr>
	</div>	
	<div class="row">
 		<div class="col-md-4 text-center button" onClick="location.href='randomDiary.jsp?user_id=<%=u%>'">
 			 <button>Random Diaries</button>
 		</div>
 		<div class="col-md-4 text-center button" onClick="location.href='home.jsp?user_id=<%=u%>'">
 			 <button>Home</button>
 		</div>
 		<div class="col-md-4 text-center button" onClick="location.href='myDiary.jsp?user_id=<%=u%>'">
 			 <button>My Diary Entries</button>
 		</div>
 	</div>
 
 </div>
</body>
</html>