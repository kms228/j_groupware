<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- jQuery 2.2.3 -->
<script src="<c:url value='/'/>resources/plugins/jQuery/jquery-2.2.3.min.js" type="text/javascript"></script>
 
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="<c:url value='/'/>resources/js/jquery.ztree.core.min.js"></script>
<script src="<c:url value='/'/>resources/js/jquery.ztree.excheck.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<c:url value='/'/>resources/bootstrap/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script> -->
<%-- <script src="<c:url value='/'/>resources/plugins/morris/morris.min.js"></script> --%>
<!-- Sparkline -->
<script src="<c:url value='/'/>resources/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="<c:url value='/'/>resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<c:url value='/'/>resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="<c:url value='/'/>resources/plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="<c:url value='/'/>resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="<c:url value='/'/>resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="<c:url value='/'/>resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="<c:url value='/'/>resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<c:url value='/'/>resources/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/'/>resources/dist/js/app.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<%-- <script src="<c:url value='/'/>resources/dist/js/pages/dashboard.js"></script> --%>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value='/'/>resources/dist/js/demo.js"></script>
<script src="<c:url value='/'/>resources/js/ckeditor.js"></script>
<!-- fullCalendar -->
<script src="<c:url value='/'/>resources/plugins/fullcalendar/fullcalendar.js"></script>
<!-- bootstrap time picker -->
<script src="<c:url value="/"/>resources/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- DataTables -->
<script src="<c:url value="/"/>resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<c:url value="/"/>resources/plugins/datatables/dataTables.bootstrap.min.js"></script>




  <link rel="stylesheet" href="<c:url value='/resources/css/common.css'/>"/>
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<c:url value='/'/>resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<c:url value='/'/>resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<c:url value='/'/>resources/dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<c:url value='/'/>resources/plugins/iCheck/flat/blue.css">
  <!-- Morris chart -->
  <%-- <link rel="stylesheet" href="<c:url value='/'/>resources/plugins/morris/morris.css"> --%>
  <!-- jvectormap -->
  <link rel="stylesheet" href="<c:url value='/'/>resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="<c:url value='/'/>resources/plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="<c:url value='/'/>resources/plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="<c:url value='/'/>resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <!-- fullCalendar -->  
  <link rel="stylesheet" href="<c:url value='/'/>resources/plugins/fullcalendar/fullcalendar.print.css" media="print">
  <link rel="stylesheet" href="<c:url value='/'/>resources/plugins/fullcalendar/fullcalendar.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="<c:url value="/"/>resources/plugins/timepicker/bootstrap-timepicker.min.css">
   <!-- DataTables -->
  <link rel="stylesheet" href="<c:url value="/"/>resources/plugins/datatables/dataTables.bootstrap.css">
  
 <link rel="stylesheet" href="<c:url value='/'/>resources/css/zTreeStyle.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div id="wrapper">
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="body">
		<div id="side">
			<tiles:insertAttribute name="side"/>
		</div>
		<div id="main">
			<tiles:insertAttribute name="main"/>
		</div>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
</body>
<script>
$(function () {
    //Date range picker
    $('#reservation, #reservation2, #reservation3').daterangepicker({
    	"locale": {
	        "format": "YYYY/MM/DD",
	        "separator": " - ",
	        "applyLabel": "저장",
	        "cancelLabel": "취소",
	        "fromLabel": "From",
	        "toLabel": "To",
	        "customRangeLabel": "Custom",
	        "weekLabel": "W",
	        "daysOfWeek": ["일","월","화","수","목","금","토"],
	        "monthNames": ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	        "firstDay": 1
	    }
	}, function(start, end, label) {
	  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
    });
   
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
    
    //DataTable
    $("#example1, #table1, #table2, #table3, #table4").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
      
  });

</script>
</html>