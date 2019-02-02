<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Updated Search Page</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="https://www.w3schools.com/w3css/4/w3.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
		<script src="myScript.js"></script>
		<script type="text/javascript">
		function bookSearch3(){
			
			$(document).ready(function(){
				
					var search = $("#key").val();
					console.log(search);
					
					
					var typeWord = $('input[name=searchType]:checked').val();
					localStorage.setItem("search", search);
					localStorage.setItem("typeWord", typeWord);
					if (typeWord == "Title")
					{
						typeWord = "intitle";
					}
					else if(typeWord == "ISBN")
					{
						typeWord = "isbn";
					}
					else if(typeWord == "Author")
					{
						typeWord = "inauthor";
					}
					else if(typeWord == "Genre")
					{
						typeWord = "subject";
					}
					else{
						alert("Please enter something in the field first");
						return false;
					}
					
					if(search== '')
					{
						alert("Please enter something in the field first");
						return false;
					}
					else
					{
						
						var img = '';
						var title='';
						var author = '';
						var bookId = '';
						$.get("https://www.googleapis.com/books/v1/volumes?maxResults=12&q=+" + typeWord +":"+search, function(data){
							$("#result_responses").html("");
							
							if(data.items.length <= 12)
							{
								for(i = 0; i < data.items.length; i++)
								{
									var iDiv = document.createElement('div');
									iDiv.id = 'block'+i;
									iDiv.className = 'block';
									bookId = data.items[i].id;
									
									//localStorage.setItem('bookId', bookId);
									document.getElementById('result_responses').appendChild(iDiv);
									title = $('<a onclick="return link2('+i+');"><h5>' + data.items[i].volumeInfo.title + '</h5></a>');
									author = $('<h5>' + data.items[i].volumeInfo.authors + '</h5>');
									try{
										img = $('<img src="'+ data.items[i].volumeInfo.imageLinks.thumbnail+'"/>');
									}catch(ERR)
									{
										img = $('<img src="https://upload.wikimedia.org/wikipedia/en/d/d1/Image_not_available.png"/>');
									}
								
									img.appendTo('#block'+i);
									title.appendTo("#block"+i);
									author.appendTo("#block"+i);
									
								}
							}
							else
							{	
								for(i = 0; i < 12; i++)
								{
									var iDiv = document.createElement('div');
									iDiv.id = 'block'+i;
									iDiv.className = 'block';
									var bookId = data.items[i].id;
									
									document.getElementById('result_responses').appendChild(iDiv);
									title = $('<a onclick="return link('+i+');"><h5>' + data.items[i].volumeInfo.title + '</h5></a>');
									author = $('<h5>' + data.items[i].volumeInfo.authors + '</h5>');
									try{
										img = $('<img src="'+ data.items[i].volumeInfo.imageLinks.thumbnail+'"/>');
									}catch(ERR)
									{
										img = $('<img src="https://upload.wikimedia.org/wikipedia/en/d/d1/Image_not_available.png"/>');
									}
									
									img.appendTo('#block'+i);
									title.appendTo("#block"+i);
									author.appendTo("#block"+i);

								}
							}
						});
					}
				});
				//basically same function as above , change a little bit.
			return false;
		 }</script>
		 <script>
		 function link2(id)
		 {
		 	localStorage.setItem("idnum", id);
		 	window.location="UpdatedBookInfo.jsp";
		 	 return true;
		 }</script>
		<%session.setAttribute("have", "no");
		List<User> users= new ArrayList<User>();
		  session.setAttribute("newUser",users);%>
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
		</style>
	</head>
<body>
	<div id="outercontainer">
			<div style="width: 80px;">
			<a style="text-decoration:none;" href="homepage.jsp">
				<h1>LibraMate</h1>
			</a>
		</div>
		<form id="myform" onsubmit="return bookSearch3();">
			
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
			<div id="result_responses"></div>
		</div>
	</div>
</body>
</html>