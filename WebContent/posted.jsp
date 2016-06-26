<%@ page import="MyPackage.Post" %>
<%@ page import="MyPackage.PostStore" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Posted</title>
</head> 
<body>

<%
	Post p=new Post(Integer.parseInt(request.getParameter("user")),request.getParameter("post"));
	PostStore.getPostStore().addPost(p);
	
	int u=Integer.parseInt(request.getParameter("user_id"));
	response.sendRedirect("myDiary.jsp?user_id="+u);
	
%>

<h3>Successfully posted
<%= request.getParameter("user") %>
</h3>
	
<h4>Thank u, For posting
<% if(p!=null)%>
</h4>
</body>
</html>