<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html style="height: auto; width: 100%;">
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
<!-- Sparkline 
<script src="<c:url value='/'/>resources/plugins/sparkline/jquery.sparkline.min.js"></script>
-->
<!-- jvectormap
<script src="<c:url value='/'/>resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<c:url value='/'/>resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
 -->
<!-- jQuery Knob Chart -->
<script src="<c:url value='/'/>resources/plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
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
<!--  <script src="<c:url value='/'/>resources/dist/js/pages/dashboard.js"></script>-->
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

<!-- jstree -->
<script src="<c:url value='/'/>resources/js/jstree.min.js"></script>


<link rel="stylesheet" href="<c:url value='/'/>resources/css/login.css">
<!-- datatables selector -->
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/select/1.2.5/js/dataTables.select.min.js"></script>
<!-- datatable button -->
<script src=https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js></script>
<!-- datatable pdf/print/copy/excel -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script> 
<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script> 
<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>

<!--  messaging -->
<script src='<c:url value='/'/>resources/dist/js/sockjs.js'></script>
<script src="<c:url value='/'/>resources/dist/js/stomp.min.js"></script>
<script src="<c:url value='/'/>resources/dist/js/websocket.js"></script>
<script src="<c:url value='/'/>resources/dist/js/indexedDB.js"></script>

	
  <link rel="stylesheet" href="<c:url value='/'/>resources/css/common.css">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<c:url value='/'/>resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <%-- <link rel="stylesheet" href="<c:url value='/'/>resources/dist/css/AdminLTE.min.css"> --%>
  <link rel="stylesheet" href="<c:url value='/'/>resources/dist/css/AdminLTE.css">
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

  

 <link rel="stylesheet" href="<c:url value='/'/>resources/css/style.min.css">

  <!-- DataTables selector -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.5/css/select.dataTables.min.css">
  <!-- DataTables button -->
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
 
	
</head>

<body class="skin-blue sidebar-mini" style="height: auto; width: 100%">
<div id="wrapper" style="height: auto;">
	<div id="header" class="main-header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="body" style="height: auto;">
		 <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar" style="height:auto;">
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i><span>결재</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="<c:url value='/'/>signnew"><i class="fa fa-circle-o"></i>새문서작성</a></li>
            <li><a href="<c:url value='/nowlist'/>"><i class="fa fa-circle-o"></i>진행결재문서</a></li>
             <li><a href="<c:url value='/signlist'/>"><i class="fa fa-circle-o"></i>결재문서함</a></li>
             <li><a href="<c:url value='/oklist'/>"><i class="fa fa-circle-o"></i>완료문서함</a></li>
          </ul>
        </li>
         <!-- ------------------------------------------------------민수-------------------------------------------------- -->
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>근태</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">

            <li><a href="<c:url value='/requestWork/${emp_num }'/>"><i class="fa fa-circle-o"></i> 근태 신청</a></li>
            <li><a href="<c:url value='/requestWorkList'/>"><i class="fa fa-circle-o"></i> 신청 내역</a></li>
            <li><a href="<c:url value='/responseWorkList'/>"><i class="fa fa-circle-o"></i> 결재 요청 내역</a></li>
            <li><a href="<c:url value='/work'/>"><i class="fa fa-circle-o"></i> 근태 현황 보기</a></li>
            <li><a href="<c:url value='/setWork'/>"><i class="fa fa-circle-o"></i> (관리자)근태 설정</a></li>
            <li><a href="<c:url value='/workList'/>"><i class="fa fa-circle-o"></i> (관리자)전체 리스트</a></li>
          </ul>
        </li>
        <!-- 
        <li class="treeview">
          <a href="#">
            <i class="fa fa-edit"></i> <span>Forms</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/forms/general.html"><i class="fa fa-circle-o"></i> General Elements</a></li>
            <li><a href="pages/forms/advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
            <li><a href="pages/forms/editors.html"><i class="fa fa-circle-o"></i> Editors</a></li>
          </ul>
        </li>
         -->
        <li class="treeview">
          <a href="#">
            <i class="fa fa-table"></i> <span>사원관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<c:url value='/emplist'/>"><i class="fa fa-circle-o"></i>재직자 리스트</a></li>
            <li><a href="<c:url value='/retirelist'/>"><i class="fa fa-circle-o"></i>퇴직자 리스트</a></li>
	        <c:choose>
	            	<c:when test="${ACNT_LEVEL=='0'}">
	            		<li><a href="<c:url value='/join'/>"><i class="fa fa-circle-o"></i>(관리자)사원추가</a></li>
	            	</c:when>
	            	
	            <c:otherwise>
	            	<li><i class="fa fa-circle-o"></i></li>
	            </c:otherwise>
	        </c:choose>    
          </ul>
        </li>
        <li>
          <a href="<c:url value='/'/>calendar">
            <i class="fa fa-calendar"></i> <span>일정</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-red"></small>
              <small class="label pull-right bg-blue"></small>
            </span>
          </a>
        </li>
        <!-- <li>
          <a href="pages/mailbox/mailbox.html">
            <i class="fa fa-envelope"></i> <span>Mailbox</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-yellow">12</small>
              <small class="label pull-right bg-green">16</small>
              <small class="label pull-right bg-red">5</small>
            </span>
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-folder"></i> <span>Examples</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/examples/invoice.html"><i class="fa fa-circle-o"></i> Invoice</a></li>
            <li><a href="pages/examples/profile.html"><i class="fa fa-circle-o"></i> Profile</a></li>
            <li><a href="pages/examples/login.html"><i class="fa fa-circle-o"></i> Login</a></li>
            <li><a href="pages/examples/register.html"><i class="fa fa-circle-o"></i> Register</a></li>
            <li><a href="pages/examples/lockscreen.html"><i class="fa fa-circle-o"></i> Lockscreen</a></li>
            <li><a href="pages/examples/404.html"><i class="fa fa-circle-o"></i> 404 Error</a></li>
            <li><a href="pages/examples/500.html"><i class="fa fa-circle-o"></i> 500 Error</a></li>
            <li><a href="pages/examples/blank.html"><i class="fa fa-circle-o"></i> Blank Page</a></li>
            <li><a href="pages/examples/pace.html"><i class="fa fa-circle-o"></i> Pace Page</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-share"></i> <span>Multilevel</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
            <li>
              <a href="#"><i class="fa fa-circle-o"></i> Level One
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Level Two
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                  </a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
          </ul>
        </li>
        <li><a href="documentation/index.html"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
        <li class="header">LABELS</li>
        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li> -->
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  
    <!-- The Right Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
	<!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active" id="userTab"><a href="#" id="userAnchor"><i class="fa fa-users"></i></a></li>
      <li id="chatTab"><a href="#" id="chatAnchor" ><i class="fa fa-commenting"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Contacts are loaded here -->
      <div class="tab-pane active" id="control-sidebar-users-tab">
	  <!-- <div class="direct-chat-contacts"> -->
	   <!--  <ul class="contacts-list"> -->
	    <ul class="control-sidebar-menu" id="userList">
		  <!-- <li>
		    <a href="#">				          
			  <i class="menu-icon fa fa-birthday-cake bg-red"></i>		    
			  <img class="contacts-list-img" src="https://vignette.wikia.nocookie.net/undertale/images/e/ef/Reunited.png/revision/latest?cb=20160211165705" alt="User Image">
			    <div class="contacts-list-info">
			      <span class="contacts-list-name">Count Dracula<small class="contacts-list-date pull-right">2/28/2015</small></span>
			      <span class="contacts-list-msg">How have you been? I was...</span>
			    </div>
			</a>
		  </li> -->
		  <!-- End Contact Item -->
		</ul>
		<!-- /.contatcts-list -->
	  </div>
	  <!-- /.direct-chat-pane -->
 
      <div class="tab-pane direct-chat-primary" id="control-sidebar-chatting-tab">
      	<div class="box-body" id="chatContents" style="overflow:auto; height:700px;">      	      	
        <!-- <h3 class="control-sidebar-heading">사람 이름</h3> -->		
						  
		</div>              
		<!-- box body -->
		
		<div class="box-footer" style="background-color:#222d32;">
              <form action="#" method="post" id="realChat">
                <div class="input-group">
                  <input type="text" name="message" placeholder="Type Message ..." class="form-control" id="chatContent">
                      <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary btn-flat" id="send1">전송</button>
                      </span>
                </div>
              </form>
        </div>
        <!-- /.box-footer-->		                	   
      </div>
      <!-- /.tab-pane -->            
   </div>    
   <!-- Content of the sidebar goes here -->   
</aside>
<!-- The sidebar's background -->
<!-- This div must placed right after the sidebar for it to work-->
<div class="control-sidebar-bg"></div>

<script>
	$("#userAnchor").click(function(){
		$("#chatTab").removeClass("active");
		$("#userTab").addClass("active");		
		$("#control-sidebar-chatting-tab").removeClass("active");
		$("#control-sidebar-users-tab").addClass("active");
		globalAcnt_id = '';
	});
	/* $("#chatAnchor").click(function(){
		$("#userTab").removeClass("active");
		$("#chatTab").addClass("active");
		$("#control-sidebar-users-tab").removeClass("active");
		$("#control-sidebar-chatting-tab").addClass("active");
	}); */
</script>
		<div id="main" class="content-wrapper" style="min-height: 921px;">
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
    $('#reservation, #reservation2, #reservation3, #reservation4').daterangepicker({
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
    $('#datepicker,#datepicker2,#datepicker3').datepicker({
      autoclose: true
    });

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false,
      showMeridian : false
    });
    
    //DataTable
    $("#example1, #table1, #table2, #table3, #table4").DataTable({
    	//버튼
    	dom:  "<'col-md-8'B>"
    		   + "<'col-md-4'lf>"
    		   + "<'col-md-12'tr>"
    		   + "<'col-md-5'i><'col-md-7'p>", 
    		
        buttons: [{extend:'selectAll',text:'모두선택'},
        	{extend:'selectNone',text:'모두해제'},
        	{extend:'copy',text:'복사'},
        	{extend:'excel',text:'엑셀파일'},
        	{extend:'pdf',text:'PDF파일'},
        	{extend:'print',text:'프린트'}],
        select: true,
        //셀렉트체크박스
    	 columnDefs: [ {
             orderable: false,
             className: 'select-checkbox',
             targets:   0
         } ],
         select: {
             style:    'multi',
             selector: 'td:first-child'
         },
         order: [[ 1, 'asc' ]],
        //갯수별보기 
    	lengthMenu : [ [  10,25, 50,100, -1 ], [  10,25, 50,100, "All" ] ],
    	//언어패치
    	language: {
    		
    		 "decimal":        "",
    		 "emptyTable":     "데이터가 없습니다.",
    		 "info":           "_START_ - _END_ (총  _TOTAL_ 개)",
    		 "infoEmpty":      "0개",
    		 "infoFiltered":   "(전체 _MAX_ 개 중 검색결과)",
    		 "infoPostFix":    "",
    		 "thousands":      ",",
    		 "lengthMenu":     " _MENU_ 개씩 보기",
    		 "loadingRecords": "로딩중...",
    		 "processing":     "처리중...",
    		 "search":         "검색:",
    		 "zeroRecords":    "검색된 데이터가 없습니다.",
    		 "paginate": {
    		     "first":      "첫 페이지",
    		     "last":       "마지막 페이지",
    		     "next":       "다음",
    		     "previous":   "이전"
    		 },
    		 "aria": {
    		     "sortAscending":  ": 오름차순 정렬",
    		     "sortDescending": ": 내림차순 정렬"
    		 },
    		 select: {
    	            rows: {
    	                _: " %d 개 선택",
    	                0: "선택값 없음",
    	                1: "1 개 선택"
    	            }
    	        }
        }
    });
    $("#signlisttable, #signnowtable").DataTable();
  });
</script>
</html>