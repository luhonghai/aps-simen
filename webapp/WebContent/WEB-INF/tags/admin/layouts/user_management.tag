<%@tag import="java.text.SimpleDateFormat"%>
<%@tag import="uk.ac.gre.remote.bean.UserBean"%>
<%@tag import="uk.ac.gre.remote.IUser"%>
<%@tag import="uk.ac.gre.remote.bean.CarParkBean"%>
<%@tag import="uk.ac.gre.remote.ICarPark"%>
<%@tag import="uk.ac.gre.remote.bean.AirPortBean"%>
<%@tag import="uk.ac.gre.utils.ClientUtility"%>
<%@tag import="uk.ac.gre.remote.IAirPort"%>
<%@tag import="uk.ac.gre.entities.*"%>
<%@tag import="java.util.List"%>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/admin/layouts" %>
<%@tag description="User management" pageEncoding="UTF-8" %>
<%
	int type = User.TYPE_CUSTOMER;
	String pType = request.getParameter("type");
	if (pType != null && pType.length() > 0) {
		try {
			type = Integer.parseInt(pType);
		} catch (Exception ex) {}
	}
%>
<div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2><%=type == User.TYPE_CUSTOMER ? "Customer" : "Staff" %> management</h2>   
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                    	<div class="panel-heading">
                             <layout:user_form></layout:user_form>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables">
                                    <thead>
                                        <tr>
                                        	<th>ID</th>
                                            <th>First name</th>
                                            <th>Surname</th>
                                            <th>Email</th>
                                            <th>Gender</th>
                                            <th>DoB</th>
                                            <th>Phone</th>
                                            <th>Address</th>
                                            <th style="width:110px;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        IUser userBean = (IUser) ClientUtility.lookup(UserBean.class, IUser.class);
                                        List<User> users = userBean.findAll(type);
                                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                        if (users != null && users.size() > 0) {
                                        	for (User user : users) {
                                        %>
                                        	<tr>
                                        		<td><%=user.getId() %></td>
                                        		<td><%=user.getFirstName() %></td>
                                        		<td><%=user.getSurname() %></td>
                                        		<td><%=user.getEmail() %></td>
                                        		<td><%=user.isGender() ? "Male" : "Female" %></td>
                                        		<td><%=user.getDob() != null ? sdf.format(user.getDob()) : "" %></td>
                                        		<td><%=user.getPhone() %></td>
                                        		<td><%=user.getAddress() %></td>
                                        		<td colspan="2" style="width:110px;">
                                          		<button style="margin: 5px;" class="btn btn-edit btn-warning btn-xs pull-left" data-id="<%=user.getId()%>">Edit</button>
                                          		<button style="margin: 5px;" class="btn btn-delete btn-danger btn-xs pull-right" data-id="<%=user.getId()%>">Delete</button>
                                          		</td>
                                        	</tr>
                                        <%}} %>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
           
        </div>