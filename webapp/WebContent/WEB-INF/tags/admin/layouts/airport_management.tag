<%@tag import="uk.ac.gre.remote.bean.CarParkBean"%>
<%@tag import="uk.ac.gre.remote.ICarPark"%>
<%@tag import="uk.ac.gre.remote.bean.AirPortBean"%>
<%@tag import="uk.ac.gre.utils.ClientUtility"%>
<%@tag import="uk.ac.gre.remote.IAirPort"%>
<%@tag import="uk.ac.gre.entities.*"%>
<%@tag import="java.util.List"%>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/admin/layouts" %>

<%@tag description="Airport management" pageEncoding="UTF-8" %>

<div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Airport management</h2>   
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             <layout:airport_form></layout:airport_form>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Location</th>
                                            <th style="width:110px;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        IAirPort airportBean = (IAirPort) ClientUtility.lookup(AirPortBean.class, IAirPort.class);
                                        List<AirPort> airports = airportBean.findAll();
                                        if (airports != null && airports.size() > 0) {
                                        	for (AirPort airPort : airports) {
                                        %>
                                         <tr>
                                          	<td><%= airPort.getName() %></td>
                                          	<td><%= airPort.getLocation() %></td>
                                          	<td colspan="2" style="width:110px;">
                                          		<button style="margin: 5px;" class="btn btn-edit btn-warning btn-xs pull-left" data-id="<%=airPort.getId()%>">Edit</button>
                                          		<button style="margin: 5px;" class="btn btn-delete btn-danger btn-xs pull-right" data-id="<%=airPort.getId()%>">Delete</button>
                                          	</td>
                                          </tr>
                                        <%}
                                        	}%>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
           
        </div>