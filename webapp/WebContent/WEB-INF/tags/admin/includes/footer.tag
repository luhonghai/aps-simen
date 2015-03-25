<%@tag description="Footer" pageEncoding="UTF-8" %>
<footer id="footer">
	
        <script>
            $(document).ready(function () {
                $('#dataTables').dataTable();
                $('.datepicker-input').datepicker({
                	autoclose: true
                });
            });
    </script>
         <!-- CUSTOM SCRIPTS -->
    <script src="<%=request.getContextPath() %>/admin/assets/js/custom.js"></script>
</footer>

