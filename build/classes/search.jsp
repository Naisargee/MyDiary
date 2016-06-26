<%@page import="MyPackage.UserStore" %>

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
int u=Integer.parseInt(request.getParameter("user_id")); //Parameters are passed in url using GET method from previos page
	int k=UserStore.getUserStore().getIdByName(request.getParameter("s_name"));
	if(k!=0)
		response.sendRedirect("profile.jsp?user_id="+u+"&prof_id="+k);
	else{
		//session.setAttribute("logIn","failed");
		response.sendRedirect("randomDiary.jsp?user_id="+u+"&search=failed");
	}
%>




</body>
</html>