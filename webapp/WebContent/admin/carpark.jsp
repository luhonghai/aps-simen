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
<t:main pageTitle="Car park management" index="4">
	<layout:car_park_management></layout:car_park_management>
	<script>
		$(document).ready(function () {
			$('.btn-add').click(function(e) {
				$("#dataModelTitle").html("Add car park");
				$("input[name=txtId]").val("-1");
   				$("input[name=txtName]").val("");
   				$("input[name=txtPhone]").val("");
   				$("input[name=txtCapacity]").val("");
   				$("input[name=txtPrice]").val("");
				$("#dataModelID").hide();
			});
       		$('.dataModelSave').click(function(e) {
       			enableForm(false);
       			$.ajax({
       				type: "POST",
       			  	url: CONTEXT_PATH + "/rest/carpark/save",
	       			contentType: "application/json",
	       	        dataType: "json",
	       	        data: JSON.stringify({
	       	        	id : $("input[name=txtId]").val(),
	       	        	name : $("input[name=txtName]").val(),
	   					phone: $("input[name=txtPhone]").val(),
	   					capacity: parseInt($("input[name=txtCapacity]").val()),
	   					price: parseFloat($("input[name=txtPrice]").val()),
	   					airportId: parseInt($("select[name=selAirPort]").val()),
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
       			  	url: CONTEXT_PATH + "/rest/carpark/find",
	       			contentType: "application/json",
	       	        dataType: "json",
	       	        data: {
	       	        	id: $(e.target).attr('data-id')
	       	        }
       			}).done(function(e) {
       				$("#dataModelID").show();
       				$("#dataModelTitle").html("Update car park");
       				
       				$("input[name=txtId]").val(e.id);
       				$("input[name=txtName]").val(e.name);
       				$("input[name=txtPhone]").val(e.phone);
       				$("input[name=txtCapacity]").val(e.capacity);
       				$("input[name=txtPrice]").val(e.price);
       				$("select[name=selAirPort]").val(e.airportId);
       				
       				$("#dataModal").modal('show');
       			}).error(function() {
       			  	alert("Could not load data");
       			});
       			return false;
       		});
       		$('.btn-delete').click(function(e) {
       			$.ajax({
       				type: "GET",
       			  	url: CONTEXT_PATH + "/rest/carpark/delete",
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