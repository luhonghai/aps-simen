function updatePrice() {
			var ad = $("input[name=txtArrivalDate]").val();
			var dd = $("input[name=txtDepartureDate]").val();
			if (ad.length == 0 || dd.length == 0) {
				$("#txtPrice").html("Price: 0");
			} else {
				var oneDay = 24*60*60*1000; 
				var firstDate = new Date(ad);
				var secondDate = new Date(dd);
	
				var diffDays = Math.round((secondDate.getTime() - firstDate.getTime())/(oneDay));
				if (diffDays >= 0) {
					var price = $( "select[name=selCarpark] option:selected" ).attr("data-price");
					var code = $("#selPrice").val();
					$.ajax({
				        type: "GET",
				        url: "rest/currency/exchange",
				        data: {
				        	amount: (diffDays + 1) * parseFloat(price),
				        	code: code
				        },
				        contentType: "application/json",
			   	        dataType: "json",
				    }).done(function( data ) {
				    	$("#txtPrice").html("Price: " + data);
				    }).error(function() {
				    	$("#txtPrice").html("Price: 0");
				    });
				} else {
					alert('Invalid date range');
				}
			}
		}

jQuery(document).ready(function($) {
		// initiate tool tip
		$('.normaltip').aToolTip();
		
		
		$("input[name=txtArrivalDate]").on('input', function() {
			updatePrice();
		});
		$("input[name=txtDepartureDate]").on('input', function() {
			updatePrice();
		});
		$("#selPrice").on("change", function() {
			updatePrice();
		});
});
