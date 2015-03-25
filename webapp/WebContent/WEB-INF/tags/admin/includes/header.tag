<%@tag import="uk.ac.gre.entities.User"%>
<%@tag description="Header" pageEncoding="UTF-8" %>
<%@attribute name="index"%>
<nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath()%>/">Parking system</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> &nbsp;
<%
	User user = (User) session.getAttribute("admin");
	if (user != null) {
%>
	<a href="<%=request.getContextPath() %>/admin/handler/logout.jsp" class="btn btn-danger square-btn-adjust">Logout</a>
<%		
	}
%> 

 </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <a <%=Integer.parseInt(index)==1 ? "class='active-menu'" :"" %> href="<%=request.getContextPath()%>/admin/user.jsp">Customer</a>
                    </li>
                   <li>
                        <a <%=Integer.parseInt(index)==2 ? "class='active-menu'" :"" %> href="<%=request.getContextPath()%>/admin/user.jsp?type=0">Staff</a>
                    </li>
                    <li>
                        <a <%=Integer.parseInt(index)==3 ? "class='active-menu'" :"" %> href="<%=request.getContextPath()%>/admin/airport.jsp">Airport</a>
                    </li>
					  <li  >
                        <a <%=Integer.parseInt(index)==4 ? "class='active-menu'" :"" %> href="<%=request.getContextPath()%>/admin/carpark.jsp">Car park</a>
                    </li>	
                </ul>
               
            </div>
            
        </nav>  