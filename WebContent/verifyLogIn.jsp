<%@ page import="MyPackage.UserStore" %>


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

	int k=UserStore.getUserStore().verifyUser(request.getParameter("name"), request.getParameter("password"));
	if(k!=0)
		response.sendRedirect("home.jsp?user_id="+k);
	else{
		//session.setAttribute("logIn","failed");
		response.sendRedirect("index.jsp?logIn="+"failed");
	}
%>


</body>
</html>