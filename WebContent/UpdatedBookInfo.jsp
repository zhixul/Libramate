<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="https://www.w3schools.com/w3css/4/w3.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
		<script src="myScript.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Info Page</title>

		<style type="text/css">
			.dropbtn {
    				background-color: black;
			    color: white;
			    padding: 16px;
			    font-size: 16px;
			    border: none;
			    cursor: pointer;
			    height:40px;
			    width:160px;
			}
			
			.dropbtn:hover, .dropbtn:focus {
			    background-color: darkgrey;
			}
			
			.dropdown {
			    position: relative;
			    top:580px;
			    left:50px;
			    display: inline-block;
			}
			
			.dropdown-content {
			    display: none;
			    position: absolute;
			    background-color: #f1f1f1;
			    min-width: 160px;
			    overflow: auto;
			    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
			    z-index: 1;
			}
			
			.dropdown-content a {
			    color: black;
			    padding: 12px 16px;
			    text-decoration: none;
			    display: block;
			    background-color:grey;
			    font-weight:bold
			}
			
			.dropdown a:hover {background-color: #ddd}
			
			.show {display:block;}
			#inner::-webkit-scrollbar {
			    width: 1em;
			    padding:0px;
			}
			 
			#inner::-webkit-scrollbar-track {
			    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
			    background:white;
			    border-radius:5px;
			}
			.star-ratings-sprite {
			  background: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/2605/star-rating-sprite.png") repeat-x;
			  font-size: 0;
			  height: 21px;
			  line-height: 0;
			  overflow: hidden;
			  text-indent: -999em;
			  width: 110px;
			  margin: 0 auto;
			  position:relative;
			  top:20px;
			  left:-427px;
			  }
			  .star-ratings-sprite-rating {
			    background: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/2605/star-rating-sprite.png") repeat-x;
			    background-position: 0 100%;
			    float: left;
			    height: 21px;
			    display:block;
			  
			  }
			 
			#inner::-webkit-scrollbar-thumb {
			  background-color: darkgrey;
			  outline: 1px solid slategrey;
			  border-radius:5px;
			}
			.img1{
				width:300px;
				height:500px;
			}
			
			.left{
				width:20%;
				margin:2.5%;
				float:left;
			}
			.right {
				width:70%;
				margin:2.5%;
				float:left;
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
			h2 {
				-webkit-text-stroke-width: 0.8px;
				-webkit-text-stroke-color: black;
				color: white;
				position:relative;
				top:20px;
				left:20px;
				margin:0;
				font-size:35px;
			}
			h3 {
				-webkit-text-stroke-width: 0.8px;
				-webkit-text-stroke-color: black;
				color: white;
				position:relative;
				top:20px;
				left:20px;
				margin:0;
				font-size:30px;
			}
			.text{
				position:relative;
				top:20px;
				left:20px;
				margin-bottom:20px;
			}
			#outercontainer {
				background-color:rgb(103,158,120);
				width:auto;
				height:900px;
			}
			#inner{
				background-color:rgb(76,155,214);
				width:100%;
				position:absolute;
				top:100px;
				height:900px;
				line-height:center;
				overflow-y: scroll;
	
				}
			body, html
			{
			    margin:0px;
			    padding: 0px;
			}
			
		</style>
	</head>
	<body onload="return loadResult();">
		<div id="outercontainer">
		<div style="width: 80px;">
			<a style="text-decoration:none;" href="homepage.jsp">
				<h1>LibraMate</h1>
			</a>
		</div>
	<form id="myform" onsubmit="return bookSearch2();">
			
				<input type="text" id="key" style="width:600px; position:relative; left:400px; top:-35px;height:40px;">
				<button type="button" onclick="location.href = 'updateSearchpg2.jsp';" id="button" style="position:relative; left:355px; top:-35px;"><i class="fa fa-book fa-fw"></i></button>
				<input style="margin-left:-30px;" class="radio" type = "radio" name = "searchType" value = "Title" id="title" />
				
				<label style="margin-right:130px;" class="label-exception" for="title">Title</label>
				<input class="radio" type = "radio" name = "searchType" value = "ISBN" id="isbn" />
				<label class="label-exception" for="isbn">ISBN </label><br/>
				<input style="margin-left: 616px; " class="radio" type = "radio" name = "searchType" value = "Author" id="author" />
				<label style="margin-right:112px;" class="label-exception" for="author">Author</label>
				<input class="radio" type = "radio" name = "searchType" value = "Genre"  id="genre" />
				<label class="label-exception" for="genre">Genre</label> <br/>
				<img onclick="location.href = 'profile.jsp';"style="border:1px black solid; height:80px; border-radius:50%;float:right; position:relative;
				top:-125.5px;left:-20px;" src='<%= session.getAttribute("imgURL") %>' >
		</form>



		<div id="inner">
			<div id="result_responses1"></div>

			<div id = "leftside" class="left">
				<div class="dropdown">
				<button onclick="myFunction()" class="dropbtn" style="color:white;maring-top:-20px;padding:0;">Add to Library <i class="fa fa-caret-down"></i></button>
				  <div id="myDropdown" class="dropdown-content">
				    <a onclick="return addRead();">Read</a>
				    <a onclick="return addFavorite();">Favrotie</a>
				  </div>
				</div>
			</div>
			<div id="right" class="right">
			
			</div>
		</div>
	</div>
		<script>
		/* When the user clicks on the button, 
		toggle between hiding and showing the dropdown content */
		function myFunction() {
		    document.getElementById("myDropdown").classList.toggle("show");
		}
		
		// Close the dropdown if the user clicks outside of it
		window.onclick = function(event) {
		  if (!event.target.matches('.dropbtn')) {
		
		    var dropdowns = document.getElementsByClassName("dropdown-content");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
		  }
		}
		</script>
		<script>
		function addRead(){
			
			var bookName = localStorage.getItem("bookName");
			var xhttp = new XMLHttpRequest();
			xhttp.open("GET" , "addRead?bookname="+bookName, false); 
			
			xhttp.send();
		}
		function addFavorite(){
			var bookName = localStorage.getItem("bookName");
			var xhttp = new XMLHttpRequest();
			xhttp.open("GET" , "addFav?bookname="+bookName, false); 
			
			xhttp.send();
		}
		</script>
	</body>
</html>