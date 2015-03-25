<%@page import="uk.ac.gre.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/admin/layouts" %>
<%
	User user = (User) session.getAttribute("admin");
	if (user == null) {
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
	}
%>
<t:main pageTitle="Airport management" index="3">
	<layout:airport_management></layout:airport_management>
	<script>
		$(document).ready(function () {
			$('.btn-add').click(function(e) {
				$("#dataModelTitle").html("Add new airport");
				$("input[name=txtId]").val("-1");
   				$("input[name=txtName]").val("");
   				$("textarea[name=txtLocation]").val("");
				$("#dataModelID").hide();
			});
       		$('.dataModelSave').click(function(e) {
       			enableForm(false);
       			$.ajax({
       				type: "POST",
       			  	url: CONTEXT_PATH + "/rest/airport/save",
	       			contentType: "application/json",
	       	        dataType: "json",
	       	        data: JSON.stringify({
	       	        	id : $("input[name=txtId]").val(),
	       	        	name : $("input[name=txtName]").val(),
	       	        	location: $("textarea[name=txtLocation]").val()
	       	        })
       			}).done(function(e) {
       				location.reload();
       			}).error(function() {
       				location.reload();
       			});
       			
       			return false;
       		});
       		$('.btn-edit').click(function(e) {
       			$.ajax({
       				type: "GET",
       			  	url: CONTEXT_PATH + "/rest/airport/find",
	       			contentType: "application/json",
	       	        dataType: "json",
	       	        data: {
	       	        	id: $(e.target).attr('data-id')
	       	        }
       			}).done(function(e) {
       				$("input[name=txtId]").val(e.id);
       				$("#dataModelID").show();
       				$("#dataModelTitle").html("Update airport");
       				$("input[name=txtName]").val(e.name);
       				$("textarea[name=txtLocation]").val(e.location);
       				
       				$("#dataModal").modal('show');
       			}).error(function() {
       			  	alert("Could not load data");
       			});
       			return false;
       		});
       		$('.btn-delete').click(function(e) {
       			$.ajax({
       				type: "GET",
       			  	url: CONTEXT_PATH + "/rest/airport/delete",
	       	        data: {
	       	        	id: $(e.target).attr('data-id')
	       	        }
       			}).done(function(e) {
       				location.reload();
       			}).error(function() {
       				location.reload();
       			});
       			return false;
       		});
    	});
	</script>
</t:main>