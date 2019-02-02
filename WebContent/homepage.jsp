<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.*" %>
<%@ page import="com.google.gson.reflect.*" %>
<%@ page import="java.io.*" %>
<%@ page import="user.User" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Homepage</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="https://www.w3schools.com/w3css/4/w3.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript">
		function search(){
			var input1 = document.getElementById("searchKeyWord");
			var input2 = $('input[name=searchType]:checked').val();
			localStorage.setItem("search",input1.value);
			localStorage.setItem("typeWord",input2);
			
		}
		
		</script>
		<style>
		
			#outercontainer {
				background-color:rgb(103,158,120);
				width:100%;
				left:auto;
				right:auto;
				height:1024px;
			}
			label {
			width: 220px;
			float: left;
			/*background-color: red;*/
			text-align: right;
			margin-right: 10px;
			font-size:20px;
			font-weight: bold;
			}
			#inner{
				background-color:rgb(76,155,214);
				width:100%;
				position:absolute;
				top:100px;
				bottom:-190px;
				line-height:center;
			}
			h1 {
				color:white;
				font-size:100px;
				text-align:center;
				-webkit-text-stroke-width: 2px;
				-webkit-text-stroke-color: black;
			}
			body, html
			{
			    margin:0px;
			    padding: 0px;
			}
			input {
				border:0;

			}
			.label-exception {
			width: auto;
			float: none;
			}
			.radio {
				position:relative;
				left:33%;
			}
			.form-row{
			margin-bottom: 10px;
			}
			

		</style>
	</head>
	<body>
		<%
			
			JsonParser parser= new JsonParser();
			String file = application.getRealPath("/") + "assignment3testing.json";
			/* String file = "/Users/zhixuli/eclipse-workspace/zhixul_CSCI201L_Assignment3/WebContent/Sample.json"; */
			Object object= parser.parse(new FileReader(file));
			JsonArray jArray = null;
			List<User> users= new ArrayList<User>();
			JsonObject jObject = (JsonObject) object;
			jArray = jObject.getAsJsonArray("users");
			Gson gson = new Gson();
			
			for(JsonElement item: jArray)
			{
	            User user = gson.fromJson(item, new TypeToken<User>() {}.getType());
	            users.add(user);
			}//convert json to java object
			
			session.setAttribute("userInfo", users);
		%>
		<%
			String textError = (String)request.getAttribute("textError");	
			if(textError == null)
			{
				textError = "";
			}
			String typeError = (String)request.getAttribute("typeError");	
			if(typeError == null)
			{
				typeError = "";
			}
		%>
		<div id="outercontainer">
			<div id="inner">
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<h1>LibraMate</h1>
				<form method="POST" name="myform"  action="Search" onsubmit="return search();">
				<div class="form-row">
						<center><input id="searchKeyWord" type ="text" name = "key" placeholder="Search" style="width:500px; height:30px;" /><button style="position:relative; left:-30px;"><i class="fa fa-search"></i></button>
						<font color="red"><strong><%= textError %></strong></font></center>
				</div>
					<div class="radio">
						<div class="form-row">
							<input type = "radio" name = "searchType" value = "Title" id="title" />
							<label style="margin-right:200px;" class="label-exception" for="title">Title</label>
						
							<input type = "radio" name = "searchType" value = "ISBN" id="isbn" />
							<label class="label-exception" for="isbn">ISBN</label><br/>
						</div>
						<div class="form-row">
							<input type = "radio" name = "searchType" value = "Author" id="author" />
							<label style="margin-right:173px;" class="label-exception" for="author">Author</label>
							<input type = "radio" name = "searchType" value = "Genre"  id="genre" />
							<label  class="label-exception" for="genre">Genre</label> <br/>
							<font color="red"><strong><%= typeError %></strong></font>
						</div>
					</div>

				</form>
				
				<center>	<button onclick="location.href = 'signup.jsp';" style="background-color:rgb(52,52,52); border:none; color:white; margin-bottom:10px; width:100px;">SIGN UP</button></center>
				<center>	<button onclick="location.href = 'logIn.jsp';" style="background-color:rgb(52,52,52); border:none; color:white; margin-bottom:10px; width:100px;">LOGIN</button></center>
				
			</div>
		</div>
	</body>
