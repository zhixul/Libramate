/**
 * 
 */
function firstSearch()
 {
	 $(document).ready(function(){
			
			var search = localStorage.getItem("search");
			var typeWord = localStorage.getItem("typeWord");
			
			//get the parameter from user
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
			//change the word to keyword in api
			
			if(search== '' || typeWord == '')
			{
				alert("Please enter something in the field first");
				return false;
				//return an error msg
			}
			else
			{
				
				var img = '';
				var title='';
				var author = '';
				var bookId = '';
				$.get("https://www.googleapis.com/books/v1/volumes?maxResults=12&q=+" + typeWord +":"+search, function(data){
					$("#result_responses").html("");//clear the content first
					
					if(data.items.length <= 12)
					{
						for(i = 0; i < data.items.length; i++)
						{
							var iDiv = document.createElement('div');
							iDiv.id = 'block'+i;
							iDiv.className = 'block';
							//new a div tag 
							
							document.getElementById('result_responses').appendChild(iDiv);
							title = $('<a onclick="return link('+i+');"><h5>' + data.items[i].volumeInfo.title + '</h5></a>');
							author = $('<h5>by ' + data.items[i].volumeInfo.authors + '</h5>');
							try{
								img = $('<img src="'+ data.items[i].volumeInfo.imageLinks.thumbnail+'"/>');
							}catch(ERR)
							{
								img = $('<img src="https://upload.wikimedia.org/wikipedia/en/d/d1/Image_not_available.png"/>');
							}
							//push the elements out of there
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
							bookId = data.items[i].id;
							//console.log(bookId);
							document.getElementById('result_responses').appendChild(iDiv);
							title = $('<a onclick="return link('+i+');"><h5>' + data.items[i].volumeInfo.title + '</h5></a>');
							author = $('<h5>by' + data.items[i].volumeInfo.authors + '</h5>');
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
		
	//localStorage.clear();
	return false;
 
 }

 function bookSearch(){
	
	$(document).ready(function(){
		
			var search = $("#key").val();
			
			
			
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
 }
 
 function link(id)
 {
	 //find out which link the user clicks
	 
	 localStorage.setItem("idnum", id);
	 window.location="info.jsp";
	 return true;
 }

 
 function loadResult()
 {

	 
	 $(document).ready(function(){
		 	var num = localStorage.getItem("idnum");
			var search = localStorage.getItem("search");
			var typeWord = localStorage.getItem("typeWord");
			//get  user input
			
			
			
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
			 var publisher = '';
			 var img = '';
			 var author = '';
			 
			 var description = ''
			 var rating = '';

				
				
			$.get("https://www.googleapis.com/books/v1/volumes?maxResults=12&q=+" + typeWord +":"+search, function(data){
					$("#result_responses1").html("");
					

						for(i = 0; i < 12; i++)
						{
							
							if(i ==num)
							{
								localStorage.setItem("bookName",data.items[i].volumeInfo.title);
								
								publisher = $('<h3>Publisher: <span style="color:black;">' + data.items[i].volumeInfo.publisher + '</span></h3>');
								
								rating = $('<h3>Rating:</h3><br />' + "<div class='star-ratings-sprite'><span style='width: " + data.items[i].volumeInfo.averageRating/5.0*100 + "%'class='star-ratings-sprite-rating'></span></div>");
								description = $('<h3>Description: </h3><br/><p class="text">' + data.items[i].volumeInfo.description + '</p>');
								title = $('<h1>' + data.items[i].volumeInfo.title + '</h1>');
								author = $('<h2>by ' + data.items[i].volumeInfo.authors + '</h2>');
								try{
									img = $('<img class = "img1" src="'+ data.items[i].volumeInfo.imageLinks.thumbnail+'"/>');
								}catch(ERR)
								{
									img = $('<img class = "img1" src="https://upload.wikimedia.org/wikipedia/en/d/d1/Image_not_available.png"/>');
								}
								img.appendTo('#leftside');
								title.appendTo("#right");
								author.appendTo("#right");
								publisher.appendTo("#right");
								description.appendTo("#right");
								rating.appendTo("#right");
							}
						}
						
						
						  


			});	
			
		});
		
	
	 
 }
 function bookSearch2(){
		
		$(document).ready(function(){
			
				var search = $("#key").val();
				localStorage.setItem("search", search);
				
				
				//var typeWord = document.getElementsByName('searchType')[0].value;
				var typeWord = $('input[name=searchType]:checked').val();
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
				else
				{
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
						$("#result_responses1").html("");
						$("#leftside").html("");
						$("#right").html("");
						
						if(data.items.length <= 12)
						{
							for(i = 0; i < data.items.length; i++)
							{
								var iDiv = document.createElement('div');
								iDiv.id = 'block'+i;
								iDiv.className = 'block';
								bookId = data.items[i].id;
								
									
								document.getElementById('result_responses1').appendChild(iDiv);
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
						else
						{
							for(i = 0; i < 12; i++)
							{
								var iDiv = document.createElement('div');
								iDiv.id = 'block'+i;
								iDiv.className = 'block';
								var bookId = data.items[i].id;
								
								document.getElementById('result_responses1').appendChild(iDiv);
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
			
		return false;
	 }