<%@page import="MyPackage.Post" %>
<%@page import="MyPackage.PostStore" %>
<%@page import="MyPackage.UserStore" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<title>Niya_Book</title>
	
	<style>
	
	tr{
		opacity:0.9;
	}
	
	</style>
	
</head>
<body  style="background-image: url('images/featured47@wdd2x1.jpg');">
 <%
 	int u=Integer.parseInt(request.getParameter("user_id")); //Parameters are passed in url using GET method from previos page
 %>

	<div class="container-fluid">
		<div class="text-center button" onClick="location.href='index.jsp'">
 			 <button>LogOut</button>
 		</div>
		<div class="row"><div class="col-md-12 text-center"><h2>Random Diaries</h2></div></div>
		<br><br>
		<div class="row class="text-center""><div class="col-md-12 text-center">
		
		<form method="post" action="search.jsp?user_id=<%=u%>" class="form-horizontal">
			
			<label for="inputName" class="col-md-2 col-sm-offset-2 text-right control-label">Who's Diary ? :</label>
			<div class="col-md-4 "><input type="text" name="s_name" id="inputName" class="form-control" placeholder="I would like to search for..." required></div><br><br>
			<input type="submit" value="Search"> 
			<div id="signUpFailed"><font color="red">No such User !!</font></div>
			
		</form>
		
		</div></div>
		
		<script type="text/javascript"> document.getElementById("signUpFailed").style.display="none"; </script>
		 <%if(request.getParameter("search")!=null && request.getParameter("search").equals("failed")) {
			%><script type="text/javascript"> document.getElementById("signUpFailed").style.display="block"; </script><%
		 } 	%>
		
		
		
		<div class="row">
			<hr>
			<hr>
		</div>
		
		<br>
		
		<div class="row text-center">
			<table class="table table-condensed table-hover">
				<%
					ArrayList<Post> p = null;
					p=PostStore.getPostStore().viewAllPost();
					int color=1;
					if(p!=null){for(Post x : p) {
					String k=UserStore.getUserStore().getNameById(x.getByUser());
					if(x.getByUser()!=u){
				%>
				
				<tr class="<% if(color==1){%>active<%}else if(color==2) {%>success<%}else if(color==3){%>info<%}else {}%>" style="line-height:20px">
				<form method="post" action="profile.jsp?user_id=<%=u%>">
				 
				<td class="text-left col-md-2">
					<button type="button submit" class="btn btn-link btn-block  edit-record">
  						<%=k%>
					</button>					
				</td>
				<td class="text-left">
					<%= x.getPost() %>
				</td>
					<input type="hidden" name=prof_id value=<%=x.getByUser() %>>
				</form>
			
				</tr>
				<%if(color<3)color++;else color=1;}} }%>
			</table>				
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
	<br><br>

	</div>
	
	
	
</body>
</html>

