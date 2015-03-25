<%@tag description="User form" pageEncoding="UTF-8" %>
<%@tag import="uk.ac.gre.entities.*"%>
<%
	int type = User.TYPE_CUSTOMER;
	String pType = request.getParameter("type");
	if (pType != null && pType.length() > 0) {
		try {
			type = Integer.parseInt(pType);
		} catch (Exception ex) {}
	}
%>
<% if (type == User.TYPE_STAFF) { %>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-add"
	data-toggle="modal" data-target="#dataModal">
	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>Add new
</button>
<% } %>
<!-- Modal -->
<div class="modal fade" id="dataModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="dataModelTitle"></h4>
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
								<input type="hidden" name="txtType" value="<%=type%>"/>
				                <label for="txtFirstName" class="col-sm-2 control-label">First Name</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtFirstName"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtSurname" class="col-sm-2 control-label">Surname</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtSurname"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtEmail" class="col-sm-2 control-label">Email</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtEmail"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtPassword" class="col-sm-2 control-label">Password</label>
				                <div class="col-xs-4">
				                  <input type="password" class="form-control" name="txtPassword"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtCPassword" class="col-sm-2 control-label">Confirm Password</label>
				                <div class="col-xs-4">
				                  <input type="password" class="form-control" name="txtCPassword"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label class="col-sm-2 control-label">Gender</label>
				                <label class="checkbox-inline">
				                  <input type="radio" name="gender" value="male" checked>
				                  Male
				                </label>
				                <label class="checkbox-inline">
				                  <input type="radio" name="gender" value="female">
				                  Female
				                </label>
				              </div>
				              <div class="form-group">
				                <label for="txtDob" class="col-sm-2 control-label">DoB</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control datepicker-input" name="txtDob" id="txtDob"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtPhone" class="col-sm-2 control-label">Phone</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtPhone"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label for="txtAddress" class="col-sm-2 control-label">Address</label>
				                <div class="col-xs-4">
				                  <textarea class="form-control" name="txtAddress"></textarea>
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
