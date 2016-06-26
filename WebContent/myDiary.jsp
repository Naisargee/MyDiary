<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="MyPackage.PostStore" %>
<%@page import="MyPackage.UserStore" %>
<%@page import="MyPackage.Post" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<title>Diary</title>
	
	<style>
	tr{
		opacity:0.8;
	}
	</style>

</head>

<body style="background-image: url('images/full01.jpg');">

<%
 	int u=Integer.parseInt(request.getParameter("user_id")); //Parameters are passed in url using GET method from previos page
 %>
 

<div class="container">
		<div class="text-center button" onClick="location.href='index.jsp'">
 			 <button>LogOut</button>
 		</div>
		<div class="row"><div class="col-md-12 text-center"><h2><%=UserStore.getUserStore().getNameById(u)%>'s Diary</h2><br></div></div>
		<% 
		ArrayList<Post> p = null;
		p=PostStore.getPostStore().viewPost(u);  %>
		
		<div class="row text-center">
			<table class="table table-condensed table-hover">
			<% 
			int color=1;
			if(p!=null){for(Post x : p) {
			%>
			<tr class="<% if(color==1){%>active<%}else if(color==2) {%>success<%}else if(color==3){%>info<%}%>" style="line-height:20px">
				<td class="text-left"><%= x.getPost() %></td>
			</tr>
			
			<%if(color<3)color++;else color=1;}} %>
			</table>		
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
		<br><br>

		</div>
		
</div>

</body>
</html>