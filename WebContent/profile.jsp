<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Your Profile</title>
		<script src="myScript.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="https://www.w3schools.com/w3css/4/w3.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
		<style type="text/css">
			.tab {
			    overflow: hidden;
			    border: 1px solid rgb(65,128,186);
			    background-color: rgb(65,128,186);
			    
			}
			/*#right .tab{
				width: 50%;
			}*/
			.tab2 {
			    overflow: hidden;
			    border: 1px solid rgb(65,128,186);
			    background-color: rgb(65,128,186);
			    width:50%;
			}
			.tab button {
			    background-color: inherit;
			    float: left;
			    border-bottom:none;
			    border-left:none;
			    border-right:none;
			    border-top:black 1px solid;
			    outline: none;
			    cursor: pointer;
			    padding: 14px 16px;
			    transition: 0.3s;
			    font-size: 17px;
			    width:50%;
			}
			/*#right .tab button{
				width: 50%;
			}*/
			.tab2 button {
			    background-color: inherit;
			    float: left;
			    border-bottom:none;
			    border-left:none;
			    border-right:none;
			    border-top:black 1px solid;
			    outline: none;
			    cursor: pointer;
			    padding: 14px 16px;
			    transition: 0.3s;
			    font-size: 17px;
			}
			.tab button.active {
			    background-color: rgb(40,85,131);
			}
			.tab2 button.active {
			    background-color: rgb(40,85,131);
			}
			.tabcontent {
			    display: none;
			    padding: 6px 12px;
			    /* border: 1px solid rgb(65,128,186); */
			    border-top: none;
			    margin:0px;
			}
			.tabcontent2{
			    display: none;
			    padding: 6px 12px;
			    border: 1px solid rgb(65,128,186);
			    border-top: none;
			    margin:0px;
			    background-color: steelblue;
			    height:500px;
			    overflow-y:scroll;
			}

			#inner::-webkit-scrollbar {
			    width: 1em;
			    padding:0px;	
			}
			.tabcontent2::-webkit-scrollbar {
			    width: 1em;
			    padding:0px;	
			}
			 
			#inner::-webkit-scrollbar-track {
			    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
			    border-radius:10px;
			    background:white;
			}
			.tabcontent2::-webkit-scrollbar-track {
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
			.tabcontent2::-webkit-scrollbar-thumb {
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
				position:relative;
				
			}
			#left {
				float:left;
				width:30%;
			}
			#right {
				float:left;
				width:70%;
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
			.white {
				-webkit-text-stroke-width: 0.8px;
				-webkit-text-stroke-color: black;
				color: white;
				

				margin:0;
				padding:0;
			}
			.logout {
				float:right;
				background-color:rgb(52,52,52); 
				border:none; 
				color:white; 
				margin-bottom:10px; 
				width:100px;
				height:40px;
				position:relative;
				top:-20px;
				left:-30px;
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
				overflow-x:hidden;
	
				}
			body, html
			{
			    margin:0px;
			    padding: 0px;
			}
		</style>
	</head>
	<body onload="performSearch()">
		<div id="outercontainer">
		<div style="width: 80px;">
			<a style="text-decoration:none;" href="homepage.jsp">
				<h1>LibraMate</h1>
			</a>
		</div>
		<form id="myform" action="SearchUser">
				<input type="text" name="key" id="key" style="width:600px; position:relative; left:400px; top:-35px;height:40px;">
				<button type="button"  onclick="location.href = 'updateSearchpg.jsp';" id="button" style="border-collapse:collapse; position:relative; left:360px; top:-35px;"><i class="fa fa-user"></i></button>
				
				<!-- <button style="height:100px; float:right; border-radius:50%;position:relative;
				top:-60px;" type="button" onclick= "location.href = 'userPage.jsp';" id="button2" > -->
				<img onclick="location.href = 'profile.jsp';" style="border:1px black solid; height:80px; border-radius:50%;float:right; position:relative;
				top:-65px;left:-20px;" src='<%= session.getAttribute("imgURL") %>' >
				
		</form>
			<div id="inner">
			<div id="left">
				<center><img style="margin-top:30px;border:1px black solid; height:300px; border-radius:50%;" src='<%= session.getAttribute("imgURL") %>' ></center>
				<div style="background-color:rgb(65,128,186); width:80%; margin:10%;" >
					<center><h2 class="white">@<%=session.getAttribute("username") %></h2></center>
					<div class="tab">
						  <button id="defaultOpen" style="width:50%;float:left;" class="tablinks" onclick="openCity(event, 'London')"><h2 class="white">Following</h2></button>
						  <button style="width:50%;float:left;" class="tablinks" onclick="openCity(event, 'Paris')"><h2 class="white">Followers</h2></button>
						  
					</div>
	
					<div id="London" class="tabcontent">
					  
					  <%	 String following[] = (String[])session.getAttribute("following");%>
					  	<% for(int i = 0; i < following.length; i++){ %>
					  	<h2 class="white" style="font-weight:bold;">@<%= following[i] %></h2>
					  	<%} %>

					  	
					</div>
					
					<div id="Paris" class="tabcontent">
					  	<%	 String follower[] = (String[])session.getAttribute("followers");%>
					  	<% for(int i = 0; i < follower.length; i++){ %>
					  	<h2 class="white" style="font-weight:bold;"> @<%= follower[i] %></h2>
					  	<%} %>
					</div>
					
					
					</div>
				
			</div>
			<div id="right">
				<h1 style="font-weight:bold;"> Your Library</h1>
				<button onclick="location.href = 'homepage.jsp';" class="logout">Logout</button>
				<div id="shu" style="background-color:steelblue; position:relative; top:40px;">
					<div class="tab2">
						  <button id="defaultoption2" style="width:200px;float:left;" class="tablinks" onclick="openCity2(event, '123')"><font style="font-size:25px;" class="white">Read</font></button>
						  <button style="width:200px;float:left;" class="tablinks" onclick="openCity2(event, '456')"><font style="font-size:25px;"class="white">Favorite</font></button>
						  
					</div>
					<div id="123" class="tabcontent2">
					  


					  	
					</div>
					
					<div id="456" class="tabcontent2">
					
					</div>
				</div>
			</div>
			</div>
		</div>
		
		<script>
		function openCity(evt, cityName) {
		    var i, tabcontent, tablinks;
		    tabcontent = document.getElementsByClassName("tabcontent");
		    for (i = 0; i < tabcontent.length; i++) {
		        tabcontent[i].style.display = "none";
		    }
		    tablinks = document.getElementsByClassName("tablinks");
		    for (i = 0; i < tablinks.length; i++) {
		        tablinks[i].className = tablinks[i].className.replace(" active", "");
		    }
		    document.getElementById(cityName).style.display = "block";
		    evt.currentTarget.className += " active";
		}
		document.getElementById("defaultOpen").click();
		</script>
		<script>
		function openCity2(evt, cityName) {
		    var i, tabcontent, tablinks;
		    tabcontent = document.getElementsByClassName("tabcontent2");
		    for (i = 0; i < tabcontent.length; i++) {
		        tabcontent[i].style.display = "none";
		    }
		    tablinks = document.getElementsByClassName("tablinks");
		    for (i = 0; i < tablinks.length; i++) {
		        tablinks[i].className = tablinks[i].className.replace(" active", "");
		    }
		    document.getElementById(cityName).style.display = "block";
		    evt.currentTarget.className += " active";
		}
		document.getElementById("defaultoption2").click();
		</script>
		<script>
		function performSearch()
		{
			$(document).ready(function(){
				$("#123").html("");
				$("#456").html("");
				<% String read[] = (String[]) session.getAttribute("read");

				 String fav[] = (String[]) session.getAttribute("fav");
				for(int i = 0; i < read.length; i++) {%>
				var search = '<%= read[i]%>';
				$.get("https://www.googleapis.com/books/v1/volumes?maxResults=12&q=+intitle:"+search, function(data){
						var i = <%= i%>
					
						var iDiv = document.createElement('div');
						iDiv.id = 'block'+i;
						iDiv.className = 'block';
						
							
						//localStorage.setItem('bookId', bookId);
						document.getElementById('123').appendChild(iDiv);
						title = $('<h5>' + data.items[0].volumeInfo.title + '</h5>');
						author = $('<h5>By ' + data.items[0].volumeInfo.authors + '</h5>');
						try{
							img = $('<img src="'+ data.items[0].volumeInfo.imageLinks.thumbnail+'"/>');
						}catch(ERR)
						{
							img = $('<img src="https://upload.wikimedia.org/wikipedia/en/d/d1/Image_not_available.png"/>');
						}
						//console.log(data.items[0].volumeInfo.title);
						img.appendTo('#block'+i);
						title.appendTo("#block"+i);
						author.appendTo("#block"+i);
							
						
				});
				<%}%>
				<%for(int i = 0; i < fav.length; i++) {%>
				var search = '<%= fav[i]%>';
				$.get("https://www.googleapis.com/books/v1/volumes?maxResults=12&q=+intitle:"+search, function(data){
						var i = <%= i%>
					
						var iDiv = document.createElement('div');
						iDiv.id = 'blockx'+i;
						iDiv.className = 'block';
						
							
						//localStorage.setItem('bookId', bookId);
						document.getElementById('456').appendChild(iDiv);
						title = $('<h5>' + data.items[0].volumeInfo.title + '</h5>');
						author = $('<h5>By ' + data.items[0].volumeInfo.authors + '</h5>');
						try{
							img = $('<img src="'+ data.items[0].volumeInfo.imageLinks.thumbnail+'"/>');
						}catch(ERR)
						{
							img = $('<img src="https://upload.wikimedia.org/wikipedia/en/d/d1/Image_not_available.png"/>');
						}
						//console.log(data.items[0].volumeInfo.title);
						img.appendTo('#blockx'+i);
						title.appendTo("#blockx"+i);
						author.appendTo("#blockx"+i);
							
						
				});
				<%}%>
			
		});
		}
</script>
	</body>
</html>