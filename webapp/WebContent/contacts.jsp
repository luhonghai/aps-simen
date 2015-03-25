<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Contacts</title>
<meta charset="utf-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css" media="all">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.5.2.js" ></script>
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
				<li><a href="<%=request.getContextPath()%>/index.jsp"><span><span>Book</span></span></a></li>
				<li id="menu_active" class="end"><a href="<%=request.getContextPath()%>/contacts.jsp"><span><span>Contacts</span></span></a></li>
			</ul>
		</nav>
	</header>
<!-- / header -->
<!--content -->
	<section id="content">
		<div class="wrapper pad1">
			<article class="col1">
				<div class="box1">
							<h2 class="top">Contact Us</h2>
							<div class="pad">
								<div class="wrapper pad_bot1">
									<p class="cols pad_bot2"><strong>Country:<br>
										City:<br>
										Address:<br>
										Email:</strong></p>
									<p class="color1 pad_bot2">UK<br>
										London SE10 9LS<br>
										30 Park Row<br>
										<a href="mailto:">contacts@aps.com</a></p>
								</div>
							</div>
							
						</div>
					</article>
					<article class="col2">
						<h3 class="pad_top1">Contact Form</h3>
						<form id="ContactForm">
							<div>
								<div  class="wrapper">
									<span>Name:</span>
									<input type="text" class="input" >
								</div>
								<div  class="wrapper">
									<span>Email:</span>
									<input type="text" class="input" >								
								</div>
								<div  class="textarea_box">
									<span>Message:</span>
									<textarea name="textarea" cols="1" rows="1"></textarea>								
								</div>
								<a href="#" class="button1" onClick="document.getElementById('ContactForm').submit()"><strong>Send</strong></a>
								<a href="#" class="button1" onClick="document.getElementById('ContactForm').reset()"><strong>Clear</strong></a>
							</div>
						</form>
					</article>
				</div>
			</section>
			<!--content end-->
			<!--footer -->
			<footer>
				<div class="wrapper" style="text-align: center;">
					&copy; 2015 Airport parking system
				</div>
			</footer>
			<!--footer end-->
		</div>
<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>