<!--
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
Hello World!!
</body>
</html>

 -->
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script type="text/javascript" src="js/main.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
	<title>Niya_Book</title>
	<script type="text/javascript"></script>
	<style>
		.mark{
			opacity:0.7;
		}
	</style>	
	
</head>

<body  style="background-image: url('images/featured47@wdd2x.jpg');">

<div class="container">

	<div class=row>
		<div class="col-md-12 text-center"><h1>Welcome To MyDiary</h1></div>
	</div>
	<div class="row">
		<hr style="color:#000;">
		<hr>
	</div>
	<div class="row">
		<div class="col-md-6 text-left mark h2">Sign Up</div>
		<div class="col-md-6 text-right mark h2"><h2>Log In</h2></div>
	</div>
	<div class="row">
		<br>
	</div>
	<div class=row>
		<div class="col-md-6">
				<form method="post" action="account_created.jsp" class="form-horizontal">
					<div class="form-group">
						<label  for="inputName" class="col-md-2 control-label">Name</label>
						<div class="col-md-6"><input type="text" name="name" class="form-control" id="inputName" placeholder="Name" required></div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-md-2 control-label">Password</label>
						<div class="col-md-6"><input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password" required></div>
					</div>
					<div class="form-group">
						<label for="inputDescription" class="col-md-2 control-label">Description</label>
						<div class="col-md-6"><input type="text" name="description" class="form-control" id="inputDescription" placeholder="Description About Yourself" size="50" ></div>
					</div>
<!--  					<div class="form-group"> 
 						<label class="col-md-2 control-label">Profile Picture</label>
						<div class="col-md-6"><input type="file" name="prof_pic"  class="form-control"></div>
 					</div>
 -->					
					<div class="col-md-6 col-sm-offset-2" id="signUpSuccess"><font color="green">Successfully Signed Up !!Please LogIn.</font></div>
					
					<div class="col-md-6 col-sm-offset-2" id="signUpFailed"><font color="red">User Already Exist !!</font></div>
					<br>
					<div class="col-md-6 col-sm-offset-2"><input type="submit" value="sign up"></div>
					
				</form>
		</div>
		
		<script type="text/javascript"> document.getElementById("signUpFailed").style.display="none"; </script>
		<script type="text/javascript"> document.getElementById("signUpSuccess").style.display="none"; </script>
		<%if(request.getParameter("signUp")!=null && request.getParameter("signUp").equals("successful")) {
			%><script type="text/javascript"> document.getElementById("signUpSuccess").style.display="block"; </script><%
		 } 	%>			
		 <%if(request.getParameter("signUp")!=null && request.getParameter("signUp").equals("failed")) {
			%><script type="text/javascript"> document.getElementById("signUpFailed").style.display="block"; </script><%
		 } 	%>	

		<div class="col-md-6">
				<form method="post" action="verifyLogIn.jsp" class="form-horizontal">
					<div class="form-group">
						<label  for="inputName" class="col-md-2 col-sm-offset-4 control-label">Name</label>
						<div class="col-md-6"><input type="text" name="name" class="form-control" id="inputName" placeholder="Name" required></div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-md-2 col-sm-offset-4 control-label">Password</label>
						<div class="col-md-6"><input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password" required></div>
					</div>
					
					<div class="col-md-6 col-sm-offset-6" id="errorLogIn"><font color=red>Incorrect Username or Password.</font></div>
					
					<br>
					<div class="col-md-6 col-sm-offset-6"><input type="submit" value="log in"></div>

				</form>

		</div>

		<script type="text/javascript"> document.getElementById("errorLogIn").style.display="none"; </script>
		<%if(request.getParameter("logIn")!=null && request.getParameter("logIn").equals("failed")) {
			%><script type="text/javascript"> document.getElementById("errorLogIn").style.display="block"; </script><%
		 } 	%>	

	</div>

	<div class="row">
		<br><br>
		<hr>
		<hr>
	</div>

</div>
</body>
</html>