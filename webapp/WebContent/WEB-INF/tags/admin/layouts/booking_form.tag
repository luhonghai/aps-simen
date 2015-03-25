<%@tag import="uk.ac.gre.remote.bean.CarParkBean"%>
<%@tag import="uk.ac.gre.remote.ICarPark"%>
<%@tag import="uk.ac.gre.remote.bean.AirPortBean"%>
<%@tag import="uk.ac.gre.utils.ClientUtility"%>
<%@tag import="uk.ac.gre.remote.IAirPort"%>
<%@tag import="uk.ac.gre.entities.*"%>
<%@tag import="java.util.List"%>
<%@tag description="User form" pageEncoding="UTF-8" %>
<%
	
%>
<div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                    	<h2>Car park booking</h2> 
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" id="dataModelForm">
				              <div class="form-group">
				                <label for="txtCarRegNo" class="col-sm-2 control-label">Car RegNo</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtCarRegNo"/>
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
				                <label class="col-sm-2 control-label">Packing type</label>
				                <label class="checkbox-inline">
				                  <input type="radio" name="type" value="0" checked>
				                  Default
				                </label>
				                <label class="checkbox-inline">
				                  <input type="radio" name="type" value="1">
				                  Family
				                </label>
				                <label class="checkbox-inline">
				                  <input type="radio" name="type" value="2">
				                  Disabled
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
				              <div class="form-group">
				              	<div class="col-sm-2"></div>
				              	<div class="col-xs-4">
				              	<button type="submit" class="btn btn-primary">Register</button>
				              	</div>
				              </div>
				            </form>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>