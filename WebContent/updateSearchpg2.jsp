<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Search by User</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="https://www.w3schools.com/w3css/4/w3.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
		<script src="myScript.js"></script>
		
		<style type="text/css">
			#inner::-webkit-scrollbar {
			    width: 1em;
			    padding:0px;	
			}
			 
			#inner::-webkit-scrollbar-track {
			    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
			    border-radius:10px;
			    background:white;
			}
			#result_responses img {
				height:200px;
			}
			#inner::-webkit-scrollbar-thumb {
			  background-color: darkgrey;
			  outline: 1px solid slategrey;
			  border-radius:10px;
			}
			.block {
				width:20%;
				margin:2.5%;
				height:300px;
				float:left;
				text-align: center;
			}
			.label-exception {
				width: auto;
				float: none;
				position:relative;
				left:400px;
				top:-56px;
				}
			.radio {
				position:relative;
				top:-56px;
				left:400px;
			}
			.form-row{
				margin-bottom: 10px;
			}
			h1 {
				-webkit-text-stroke-width: 0.8px;
				-webkit-text-stroke-color: black;
				color: white;
				position:relative;
				top:20px;
				left:20px;
				margin:0;
				font-size:50px;
	
			}
			#outercontainer {
				background-color:rgb(103,158,120);
				width:auto;
				height:1024px;
			}
			#inner{
				
				background-color:rgb(76,155,214);
				width:100%;
				position:absolute;
				top:100px;
				height:830px;
				line-height:center;
				overflow-y: scroll;
	
				}
			body, html
			{
			    margin:0px;
			    padding: 0px;
			}
			.white {
				-webkit-text-stroke-width: 0.8px;
				-webkit-text-stroke-color: black;
				color: white;
				

				margin:0;
				
			}
		</style>
	</head>
<body>
	<div id="outercontainer">
			<div style="width: 80px;">
			<a style="text-decoration:none;" href="homepage.jsp">
				<h1>LibraMate</h1>
			</a>
		</div>
		<form id="myform2" action="SearchUser">
				<input type="text" id="key" name="key" style="width:600px; position:relative; left:400px; top:-35px;height:40px;">
				<button type="button"  onclick="location.href = 'updateSearchpg.jsp';" id="button2" style="border-collapse:collapse; position:relative; left:360px; top:-35px;"><i class="fa fa-user"></i></button>
				
				<!-- <button style="height:100px; float:right; border-radius:50%;position:relative;
				top:-60px;" type="button" onclick= "location.href = 'userPage.jsp';" id="button2" > -->
				<img onclick="location.href = 'profile.jsp';" style="border:1px black solid; height:80px; border-radius:50%;float:right; position:relative;
				top:-65px;left:-20px;" src='<%= session.getAttribute("imgURL") %>' >
				
		</form>
		<div id="inner">
			<div id="result_responses">
			
				<% String have = (String) session.getAttribute("have");
				List<User> usesList = new ArrayList<User>();
				usesList = (ArrayList<User>)session.getAttribute("newUser"); 
				if(usesList.size() == 0 && have =="yes")
				{%>
					<center><h2 class="white" style="padding-top:100px; font-size:100px;">No User Found!</h2></center>
				
				
				<%}for(int i = 0; i < usesList.size(); i++){ %>
					<div class="block">
					<% if(usesList.get(i).getUsername().equals((String)session.getAttribute("username"))){ %>
						<a href="profile.jsp"><img style="border-radius:50%; border:1px black solid;"src="<%=usesList.get(i).getImageURL() %>" /></a>
						<%}else{ %>
						<a onclick="return chosenuser(<%=i%>)"><img style="border-radius:50%; border:1px black solid;"src="<%=usesList.get(i).getImageURL() %>" /></a>
							<%} %>
						<h3 class="white">@<%=usesList.get(i).getUsername() %></h3>
					</div>
				<%} %>
			  
			</div>
		</div>
	</div>
	<script>
		<%-- function searchUser()
		{
			var xhttp = new XMLHttpRequest();
			
			xhttp.open("GET" , "SearchUser?key=" + document.getElementById("key").value, false); 
			
			xhttp.send();
			  <% 
			  	//= new ArrayList<User>();
			  
			 
			  List<User> newUsers = (ArrayList<User>)session.getAttribute("newUser");
			  	if(newUsers.size() == 0){
			  %>
			  document.getElementById("result_responses").innerHTML="<h1>No User Found</h1>";
			  <%}else{ 
			  		for(User s1 : newUsers){%>
		  		var iDiv = document.createElement('div');
		  		var i = 0;
				iDiv.id = 'blocky'+i;
				iDiv.className = 'block';
				document.getElementById('result_responses').appendChild(iDiv);
			  	document.getElementById('blocky'+i).innerHTML = "<img src="+'<%= s1.getImageURL() %>'+'/>';
			  	
			  	document.getElementById('blocky'+i).innerHTML = "<h2>" <%=s1.getUsername() %>"</h2>"
			  	
			  	i++;
			  <%} }%>

			return false;

		} --%>
		function chosenuser(id)
		{
			var xhttp = new XMLHttpRequest();
			xhttp.open("GET" , "userSelect?userID=" + id, false); 
			xhttp.send();
			
			window.location="otherusers.jsp";
		}
		</script>
</body>
</html>