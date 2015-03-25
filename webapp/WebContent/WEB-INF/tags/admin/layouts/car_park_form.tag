<%@tag import="uk.ac.gre.remote.bean.CarParkBean"%>
<%@tag import="uk.ac.gre.remote.ICarPark"%>
<%@tag import="uk.ac.gre.remote.bean.AirPortBean"%>
<%@tag import="uk.ac.gre.utils.ClientUtility"%>
<%@tag import="uk.ac.gre.remote.IAirPort"%>
<%@tag import="uk.ac.gre.entities.*"%>
<%@tag import="java.util.List"%>
<%@tag description="Car park form" pageEncoding="UTF-8" %>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-add"
	data-toggle="modal" data-target="#dataModal">
	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>Add new </button>

<!-- Modal -->
<div class="modal fade" id="dataModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="dataModelTitle">Add new car park</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" id="dataModelForm">
					<div class="form-group" id="dataModelID" style="display: none">
						<label for="txtId" class="col-sm-2 control-label">ID</label>
						<div class="col-xs-4">
							<input type="text" class="form-control" name="txtId" value="-1" />
						</div>
					</div>
					<div class="form-group">
				                <label for="txtName" class="col-sm-2 control-label">Name</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtName" placeholder="Name" />
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtPhone" class="col-sm-2 control-label">Phone</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtPhone" placeholder="Phone number"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtCapacity" class="col-sm-2 control-label">Capacity</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" data-bind="value:replyNumber" name="txtCapacity"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtPrice" class="col-sm-2 control-label">Price</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" data-bind="value:replyNumber" name="txtPrice"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="selAirPort" class="col-sm-2 control-label">Airport</label>
				                <div class="col-xs-4">
				                  <select name="selAirPort">
				                  <%
				                  IAirPort airportBean = (IAirPort) ClientUtility.lookup(AirPortBean.class, IAirPort.class);
                                  List<AirPort> airPorts = airportBean.findAll();
				                  if (airPorts != null && airPorts.size() > 0) {
				                	  for (AirPort airPort : airPorts) {%>
				                  	<option value="<%=airPort.getId()%>"><%=airPort.getName() %></option>
				                  <% }} %>
				                  </select>
				                </div>
				              </div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary dataModelSave">Save</button>
			</div>
		</div>
	</div>
</div>