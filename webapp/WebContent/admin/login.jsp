<%@page import="uk.ac.gre.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/admin/layouts" %>

<t:main pageTitle="Dashboard" index="0">
	<!--login modal-->
<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <h1 class="text-center">Airport parking system</h1>
      </div>
      <div class="modal-body">
          <form class="form col-md-12 center-block" action="handler/login.jsp">
            <div class="form-group">
              <input type="text" class="form-control input-lg" name="txtEmail" placeholder="Email">
            </div>
            <div class="form-group">
              <input type="password" class="form-control input-lg" name="txtPassword" placeholder="Password">
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-primary btn-lg btn-block">Sign In</button>
            </div>
          </form>
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
         
		  </div>	
      </div>
  </div>
  </div>
</div>
</t:main>
