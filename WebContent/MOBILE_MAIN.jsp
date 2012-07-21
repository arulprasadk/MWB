<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="jquery.mobile-1.1.1.css" />
	<script src="jquery-1.7.2.min.js"></script>
	<script src="jquery.mobile-1.1.1.js"></script>
	<script>
	var countriesContainer;
	function loadCountries() {
		if(!localStorage.getItem("countriesContainer")) {
		
		$.ajax({ 
		url : "Countries.jsp",
		dataType : "json",
		success : function(response) {
			countriesContainer = response;
			localStorage.setItem("countriesContainer",countriesContainer)
		},
		error : function(xhr)
			{
				console.log(xhr)
			}
		});
		} else {
			countriesContainer = localStorage.getItem("countriesContainer");
			console.log('from cache' + countriesContainer);
		}
		var countries = countriesContainer.response;
		console.log(countries);
		for( i = 0 ; i < countries.length; i++)
		{
			$("#countries").append('<li id="countryList">'+ countries[i] + '</li>');
			$("#countries").listview("refresh");
		}

	}
	
		$().ready(function() {
			if(localStorage.getItem("userName"))
			{
				$.mobile.changePage("#homeScreen");	
			}
			$("#homeScreen").bind("pageshow", function () {loadCountries(); });
			$("#clickBtn").on("click", function() {
				$.ajax({ 
					url : "Authenticate.jsp",
					type : "GET",
					dataType : "json",
					data : {userName : $("#userName").val(), password : $("#password").val() },
					success : function(response) {
						if(response.authenticated == "true")
						{
							if($("#rememberMeOperation").prop("checked"))
							{
								localStorage.setItem("userName",$("#userName").val());
							}
							else
							{
								console.log("not checked");	
							}
							
							$.mobile.changePage("#homeScreen");	
						}
						else
						{
							$("#errMsg").html(response.msg);	
						}
					},
					error : function(xhr)
						{
							console.log('eeerrr')
						}
					});
				
				$("#countryList").live("click" , function () {
					var cities = countriesContainer[$(this).text()];
					$("#cities").html("");
					for( i = 0 ; i < cities.length; i++)
					{
						$("#cities").append('<li id="countryList' + i + '">'+ cities[i] + '</li>');
					}
					$("#cities").listview("refresh");
				});

			
			
			});
			
		});
	</script>
</head>
<body>
	<div data-role="page" id="mainPage" > 
		<div data-role="header"  data-theme="b"> 
			<P>Welcome to Sella</P>
			<div data-role="fieldcontain" id="errMsg">
			</div>
		</div>
		<div data-role="content" data-theme="e"> 
			<div data-role="fieldcontain">
				 <label> User Name :  </label>
				  <input type="text" id="userName"> <br> <br>
				  <label> Password :  </label>
				  <input type="password" id="password">
				   
			</div>
			<div data-role="button"  id="clickBtn">
					Login
			</div>
			<div data-role="controlgroup"  id="clickBtn">
				<label>Remember me  </label>
			  	<input id="rememberMeOperation" type="checkbox" id="userName" >
			</div>
		</div>
		<div data-role="footer"> Footer
		</div>
	</div>
	<div data-role="page" id="homeScreen" data-theme="d">
		<div data-role="collapsable-set">
			<div data-role="collapsible">
				<h3> Countries: </h3>
					<ul id="countries" data-role="listview" data-inset="true">
					</ul>
			</div>
		</div>
		<div data-role="collapsable-set">
			<div data-role="collapsible" data-theme="d">
				<h3> Cities: </h3>
				<ul id="cities" data-role="listview" data-inset="true"> </ul>
			</div>
		</div>
			
	</div>
	<div data-role="page"> Page 3</div>
</body>