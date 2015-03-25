<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="uk.ac.gre.restful.CarParkService"%>
<%@page import="java.util.List"%>
<%@page import="uk.ac.gre.entities.CarPark"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login - Airport parking system</title>
<meta charset="utf-8">
<link rel="stylesheet"	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css" media="all">

<script type="text/javascript" src="//code.jquery.com/jquery-2.1.3.min.js" ></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/cufon-yui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/cufon-replace.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Cabin_400.font.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tabs.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.jqtransform.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/atooltip.jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/script.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<style type="text/css">
	.main, .tabs ul.nav a, .content, .button1, .box1, .top { behavior:url(js/PIE.htc)}
</style>
<![endif]-->
<!--[if lt IE 7]>
	<div style=' clear: both; text-align:center; position: relative;'>
		<a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/images/upgrade.jpg" border="0"  alt="" /></a>
	</div>
<![endif]-->
</head>

<body id="page6">
<div class="main">
<!--header -->
	<header>
		<div class="wrapper">
			<h1><a href="<%=request.getContextPath()%>/index.jsp" id="logo">Airport parking</a></h1>
			<span id="slogan">Airport parking system</span>
			<nav id="top_nav">
				<ul>
					<li><a href="<%=request.getContextPath()%>/index.jsp" class="nav1">Home</a></li>
					<li><a href="#" class="nav2">Sitemap</a></li>
					<li><a href="<%=request.getContextPath()%>/contacts.jsp" class="nav3">Contact</a></li>
				</ul>
			</nav>
		</div>
		<nav>
			<ul id="menu">
				<li  id="menu_active"><a href="<%=request.getContextPath()%>/index.jsp"><span><span>Book</span></span></a></li>
				<li class="end"><a href="<%=request.getContextPath()%>/contacts.jsp"><span><span>Contacts</span></span></a></li>
			</ul>
		</nav>
	</header>
<!-- / header -->
<!--content -->
	<!--content -->
		<section id="content">
			<div class="for_banners">
				<article class="col1">
					<div class="tabs">
						<ul class="nav">
							<li class="selected"><a href="#Login">Login</a></li>
							<li class="end"><a href="#Register">Register</a></li>
						</ul>
						<div class="content">
							<div class="tab-content" id="Login">
								<form id="form_3" action="<%=request.getContextPath() %>/handler/login.jsp" method="post">
									<div>
										<div class="wrapper" style="padding: 10px; text-align: center;width: 100%;font-weight: bold;">
											Login to Airport parking system
										</div>
										<div class="row">
											<span class="left">Email</span> <input
												type="text" name="txtEmail" class="input"/>
										</div>
										<div class="row">
											<span class="left">Password</span> <input type="password"
												name="txtPassword" class="input"/>
										</div>
										<div class="wrapper">
											<span class="right relative"><a href="#"
												class="button1"
												onClick="document.getElementById('form_3').submit()"><strong>Login</strong></a></span>
										</div>
									</div>
								</form>
							</div>
							<div class="tab-content" id="Register">
								<form id="form_2" action="<%=request.getContextPath() %>/handler/register.jsp"  method="post">
									<div>
										<div class="wrapper" style="padding: 10px; text-align: center;width: 100%;font-weight: bold;">
											Register now!
										</div>
										<div class="row">
											<span class="left">First name</span> <input
												type="text" name="txtFirstName" class="input"/>
										</div>
										<div class="row">
											<span class="left">Surname</span> <input
												type="text" name="txtSurname" class="input"/>
										</div>
										<div class="row">
											<span class="left">Email</span> <input
												type="text" name="txtEmail" class="input"/>
										</div>
										<div class="row">
											<span class="left">Password</span> <input type="password"
												name="txtPassword" class="input"/>
										</div>
										<div class="row" style="padding: 0 60px;">
											<input type="radio" name="rdGender" value="male" checked>
											<span style="width: 50px;">Male</span>
											<input type="radio" name="rdGender" value="female">
											<span style="width: 50px;">Female</span>
												
										</div>
										<div class="row">
											<span class="left">Date of birth</span> <input type="text"
												name="txtDob" class="input1 date-picker-input"/>
										</div>
										<div class="row">
											<span class="left">Phone</span> <input type="text"
												name="txtPhone" class="input"/>
										</div>
										<div class="row">
											<span class="left">Address</span> <input type="text"
												name="txtAddress" class="input">
										</div>
										<div class="wrapper">
											<span class="right relative"><a href="#"
												class="button1"
												onClick="document.getElementById('form_2').submit()"><strong>Register</strong></a></span>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</article>
			</div>
		</section>
			<!--footer -->
			<footer>
				<div class="wrapper" style="text-align: center;">
					&copy; 2015 Airport parking system
				</div>
			</footer>
			<!--footer end-->
		</div>
<script type="text/javascript"> Cufon.now(); </script>
<script>
	jQuery(document).ready(function($) {
		tabs.init();
		//$('#form_3, #form_2').jqTransform({imgPath:'jqtransformplugin/img/'});
		$('.date-picker-input').datepicker({
			dateFormat: 'mm/dd/yy'
		});
	});
	
</script>
</body>
</html>