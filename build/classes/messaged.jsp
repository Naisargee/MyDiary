<%@ page import="MyPackage.Message" %>
<%@ page import="MyPackage.MessageStore" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	Message m=new Message(Integer.parseInt(request.getParameter("from_user_id")),Integer.parseInt(request.getParameter("to_user_id")),request.getParameter("post"));
	MessageStore.getMessageStore().addMessage(m);
	
	int u=Integer.parseInt(request.getParameter("from_user_id"));
	response.sendRedirect("profile.jsp?user_id="+u+"&prof_id="+request.getParameter("to_user_id"));
	
%>


</body>
</html>