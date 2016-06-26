<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="MyPackage.User" %>
<%@page import="MyPackage.UserStore" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Successful</title>
</head>
<body>

<%
	InputStream inputStream = null;
	Part filePart = request.getPart("photo");
	if (filePart != null) {
    	System.out.println(filePart.getName());
    	System.out.println(filePart.getSize());
    	System.out.println(filePart.getContentType());
    	inputStream = filePart.getInputStream();
	}
	User user=new User(request.getParameter("name"),request.getParameter("password"),request.getParameter("description"));
%>

<h4><% if(user!=null) { %>
 	<% if(user.validate==0){%> 
	<%=user.validate %>,Thank u, For Registration.
	<% int k=user.getId();
		//response.sendRedirect("home.jsp?user_id="+k); %>
	<% response.sendRedirect("index.jsp?signUp="+"successful"); %>
	<%} %>
 	<% if(user.validate==1){%> 
	User Alredy Exists...
	<% response.sendRedirect("index.jsp?signUp="+"failed"); %>
	<%} %>
<%} %>
</h4>


</body>
</html>