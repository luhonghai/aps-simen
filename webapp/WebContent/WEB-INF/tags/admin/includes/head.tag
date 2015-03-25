<%@tag description="Head" pageEncoding="UTF-8" %>
<%@attribute name="pageTitle" required="true" %>
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%=pageTitle %></title>
	<!-- BOOTSTRAP STYLES-->
    <link href="<%=request.getContextPath() %>/admin/assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%=request.getContextPath() %>/admin/assets/css/font-awesome.css" rel="stylesheet" />
    <link href="<%=request.getContextPath() %>/admin/assets/css/bootstrap-datepicker3.min.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
   
        <!-- CUSTOM STYLES-->
    <link href="<%=request.getContextPath() %>/admin/assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="<%=request.getContextPath() %>/admin/assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="<%=request.getContextPath() %>/admin/assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="<%=request.getContextPath() %>/admin/assets/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/admin/assets/js/bootstrap-datepicker.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="<%=request.getContextPath() %>/admin/assets/js/jquery.metisMenu.js"></script>
     <!-- DATA TABLE SCRIPTS -->
    <script src="<%=request.getContextPath() %>/admin/assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="<%=request.getContextPath() %>/admin/assets/js/dataTables/dataTables.bootstrap.js"></script>
    <script>
    	var CONTEXT_PATH = '<%=request.getContextPath()%>';
    	Date.prototype.customFormat = function(formatString){
    	    var YYYY,YY,MMMM,MMM,MM,M,DDDD,DDD,DD,D,hhh,hh,h,mm,m,ss,s,ampm,AMPM,dMod,th;
    	    var dateObject = this;
    	    YY = ((YYYY=dateObject.getFullYear())+"").slice(-2);
    	    MM = (M=dateObject.getMonth()+1)<10?('0'+M):M;
    	    MMM = (MMMM=["January","February","March","April","May","June","July","August","September","October","November","December"][M-1]).substring(0,3);
    	    DD = (D=dateObject.getDate())<10?('0'+D):D;
    	    DDD = (DDDD=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"][dateObject.getDay()]).substring(0,3);
    	    th=(D>=10&&D<=20)?'th':((dMod=D%10)==1)?'st':(dMod==2)?'nd':(dMod==3)?'rd':'th';
    	    formatString = formatString.replace("#YYYY#",YYYY).replace("#YY#",YY).replace("#MMMM#",MMMM).replace("#MMM#",MMM).replace("#MM#",MM).replace("#M#",M).replace("#DDDD#",DDDD).replace("#DDD#",DDD).replace("#DD#",DD).replace("#D#",D).replace("#th#",th);

    	    h=(hhh=dateObject.getHours());
    	    if (h==0) h=24;
    	    if (h>12) h-=12;
    	    hh = h<10?('0'+h):h;
    	    AMPM=(ampm=hhh<12?'am':'pm').toUpperCase();
    	    mm=(m=dateObject.getMinutes())<10?('0'+m):m;
    	    ss=(s=dateObject.getSeconds())<10?('0'+s):s;
    	    return formatString.replace("#hhh#",hhh).replace("#hh#",hh).replace("#h#",h).replace("#mm#",mm).replace("#m#",m).replace("#ss#",ss).replace("#s#",s).replace("#ampm#",ampm).replace("#AMPM#",AMPM);
    	}
    	function enableForm(enable) {
    		if (enable) {
	    		$("input").prop("disabled", "disabled");
	   			$("textarea").prop("disabled", "disabled");
	   			$("button").prop("disabled", "disabled");
	   			$("radio").prop("disabled", "disabled");
	   			$("select").prop("disabled", "disabled");
    		} else {
    			$("input").prop("disabled", "");
	   			$("textarea").prop("disabled", "");
	   			$("button").prop("disabled", "");
	   			$("radio").prop("disabled", "");
	   			$("select").prop("disabled", "");
    		}
    	}
    </script>
</head>