<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="MyPackage.PostStore" %>
<%@page import="MyPackage.MessageStore" %>
<%@page import="MyPackage.UserStore" %>
<%@page import="MyPackage.Post" %>
<%@page import="MyPackage.Message" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<title>Niya_Book</title>
	<style>
	
	tr{
		opacity:0.8;
	}
	
	</style>
</head>
<body style="background-image: url('images/full01.jpg');">

<%
 	int u=Integer.parseInt(request.getParameter("user_id")); //Parameters are passed in url using GET method from previos page
 	int pi=Integer.parseInt(request.getParameter("prof_id"));
 %>
 

<div class="container">
		<div class="text-center button" onClick="location.href='index.jsp'">
 			 <button>LogOut</button>
 		</div>
		<div class="row"><div class="col-md-12 text-center"><h2><%=UserStore.getUserStore().getNameById(pi)%>'s Diary</h2></div></div>
		
		
		<div class="row"><div class="col-md-12 text-center"><h4>
		
		<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">
  			Your Chat With <%=UserStore.getUserStore().getNameById(pi)%>
		</button>
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    			<div class="modal-content">
      				<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        					<h4 class="modal-title" id="myModalLabel">Your Chat With <%=UserStore.getUserStore().getNameById(pi)%></h4>
      				</div>
      				<div class="modal-body h6"><%
        				ArrayList<Message> m = null;
						m=MessageStore.getMessageStore().viewMessage(u,pi);  %>
						<div class="row text-center">
							<table class="table table-striped table-hover">
							<% 
								if(m!=null){for(Message x : m) {
							%>
							<tr style="line-height:20px">
								<td  class="text-left"><%=UserStore.getUserStore().getNameById(x.getFromuser())%>
								<td class="text-left"><%= x.getMsg() %></td>
							</tr>			
							<%}} %>
							</table>		
						</div>
      				</div>
      			<div class="modal-footer">
      				<form method="post" action="messaged.jsp?from_user_id=<%=u%>&to_user_id=<%=pi%>">
    					<small>Drop a Message</small>
    					<textarea rows="5" cols="50" name="post"></textarea><br><br>
        				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        				<button type="button submit" class="btn btn-primary">Leave Message</button>
        			</form>
      			</div>
    			</div>
  			</div>
		</div>
		
		</h4></div></div>
		
		
		<div class="row">
			<hr>
			<hr>
		</div>
		<br>
		<% 
		ArrayList<Post> p = null;
		p=PostStore.getPostStore().viewPost(pi);  %>
		
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