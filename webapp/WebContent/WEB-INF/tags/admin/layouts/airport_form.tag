<%@tag description="Air port form" pageEncoding="UTF-8"%>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-add"
	data-toggle="modal" data-target="#dataModal">
	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>Add
	new
</button>

<!-- Modal -->
<div class="modal fade" id="dataModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="dataModelTitle">Add new airport</h4>
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
							<input type="text" class="form-control" name="txtName"
								placeholder="Name" />
						</div>
					</div>
					<div class="form-group">
						<label for="txtLocation" class="col-sm-2 control-label">Location</label>
						<div class="col-xs-4">
							<textarea class="form-control" name="txtLocation"
								placeholder="Location"></textarea>
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
