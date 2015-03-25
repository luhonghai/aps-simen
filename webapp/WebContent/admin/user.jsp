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
<%
 String pType = request.getParameter("type");
 int index = 1;
 if (pType != null && pType.equalsIgnoreCase("0")) {
	 index = 2;
 }
%>
<t:main pageTitle="User management" index="<%=Integer.toString(index)%>">

	<layout:user_management></layout:user_management>
	<script>
		$(document).ready(function () {
			$('.btn-add').click(function(e) {
				$("#dataModelTitle").html("Add user");
				$("input[name=txtId]").val("-1");
   				$("input[name=txtFirstName]").val("");
   				$("input[name=txtSurname]").val("");
   				$("input[name=txtEmail]").val("");
   				$("input[name=txtPassword]").val("");
   				$("input[name=txtCPassword]").val("");
   				$("input[name=txtDob]").val("");
   				$("input[name=txtPhone]").val("");
   				$("textarea[name=txtAddress]").val("");
				$("#dataModelID").hide();
			});
       		$('.dataModelSave').click(function(e) {
       			if ($("input[name=txtPassword]").val() != $("input[name=txtCPassword]").val()) {
       				alert("Password not matched");
       				return false;
       			}
       			enableForm(false);
       			$.ajax({
       				type: "POST",
       			  	url: CONTEXT_PATH + "/rest/user/save",
	       			contentType: "application/json",
	       	        dataType: "json",
	       	        data: JSON.stringify({
	       	        	id : $("input[name=txtId]").val(),
	       	        	type: parseInt($("input[name=txtType]").val()),
	       	        	firstName: $("input[name=txtFirstName]").val(),
	       	        	surname : $("input[name=txtSurname]").val(),
	       	        	email: $("input[name=txtEmail]").val(),
	       	        	password: $("input[name=txtPassword]").val(),
	   					phone: $("input[name=txtPhone]").val(),
	   					address: $("textarea[name=txtAddress]").val(),
	   					gender: $('input:radio[name=gender]:nth(0)').is(':checked'),
	   					dob: Date.parse($("input[name=txtDob]").val())
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
       			  	url: CONTEXT_PATH + "/rest/user/find",
	       			contentType: "application/json",
	       	        dataType: "json",
	       	        data: {
	       	        	id: $(e.target).attr('data-id')
	       	        }
       			}).done(function(e) {
       				$("#dataModelID").show();
       				$("#dataModelTitle").html("Update information");
       				
       				$("input[name=txtId]").val(e.id);
       				
       				$("input[name=txtFirstName]").val(e.firstName);
       				$("input[name=txtSurname]").val(e.surname);
       				$("input[name=txtEmail]").val(e.email);
       				$("input[name=txtPassword]").val("");
       				$("input[name=txtCPassword]").val("");
       				if (typeof e.dob != 'undefined' && e.dob > 0) {
       					$("input[name=txtDob]").val(new Date(e.dob).customFormat("#DD#/#MM#/#YYYY#"));
       				}
       				$("input[name=txtPhone]").val(e.phone);
       				$("textarea[name=txtAddress]").val(e.address);
       				
       				if (e.gender) {
       					$('input:radio[name=gender]:nth(0)').prop('checked', true);
       				} else {
       					$('input:radio[name=gender]:nth(1)').prop('checked', true);
       				}
       				
       				$("#dataModal").modal('show');
       			}).error(function() {
       			  	alert("Could not load data");
       			});
       			return false;
       		});
       		$('.btn-delete').click(function(e) {
       			$.ajax({
       				type: "GET",
       			  	url: CONTEXT_PATH + "/rest/user/delete",
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