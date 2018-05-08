<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value='/'/>resources/plugins/fullcalendar/ko.js"></script>
<script>
$(function () {		
//일정 읽기, 전체일정 불러오기
  var schedule = (function(){
	  var position = {'0':'비공개'};
	  
	  var initSchedules = function(){
		  $.ajax({
			method: "POST",
			url : "<c:url value='/getSchedules'/>",
			dataType : "json",
			success : function(data){
				var events = new Array();
				for(i in data){										
				  events.push({
								id : data[i].sch_num,
							    title : data[i].sch_title,
						        start : $.fullCalendar.moment(data[i].sch_sdate),         
						        end : $.fullCalendar.moment(data[i].sch_edate),
						        description : data[i].sch_content						        
						        //allDay : true
				  });				    										
				}
			$('#calendar').fullCalendar('addEventSource',events);
			}
		  });  
	  };
	  var initPublic = function(){
		  var create_public = document.querySelector("#create_public");/* document.getElementById("create_public"); */
		  var mod_public = document.getElementById("mod_public");
		  var option;
		  $.ajax({
				 method: "get",
				 url : "<c:url value='/getPosition'/>",
				 dataType : "json",
				 success : function(data){						 
					 for(i in data){							 							 
						 position[String(data[i].pst_num)]= data[i].pst_name;
						 option = document.createElement("option");
						 option.text = data[i].pst_name;
						 option.value = data[i].pst_num;
						 create_public.appendChild(option);		 	 							 
						 option = document.createElement("option");
						 option.text = data[i].pst_name;
						 option.value = data[i].pst_num;
						 mod_public.appendChild(option);
					 }
				 }
	      });
	  };
	  initPublic();
	  initSchedules();
	  return {
		  getPosition : function(pst_num){
			  var string_pst_num = String(pst_num);
			  return position[string_pst_num];
		  },
		  deleteSchedule : function(eventData){			  
			  var req;			  
			  req = new XMLHttpRequest();			  
			  req.onreadystatechange = function(){
				if(req.readyState === XMLHttpRequest.DONE){//4
					$("#modal-default").modal('hide');
				  if(req.status === 200){					
					$("#calendar").fullCalendar('removeEvents',eventData.sch_num);					
				  } else {
					alert("Error loading page");
				  }
				}  
			  };
			  var url = "<c:url value='/deleteSchedule'/>";
			  req.open('POST',url,true);
			  req.setRequestHeader('Content-Type','application/json');			  
			  req.send(JSON.stringify(eventData));			  
		  },	
		  getSchedule : function(sch_num, callbackFunc){
			  $.ajax({
					method: "get",
					url : "<c:url value='/getSchedule?sch_num="+sch_num+"'/>",
					dataType : "json",
				    success : function(data){
				    	callbackFunc(data);													 																					
					}
			  });
		  }		  
	  };
  })();	  	  

var modalModal = (function(schedule){	
	var eventData;
	var mySchedule = schedule;
	var myModal=document.getElementById('modal-default');
	var myModifyBtn=document.getElementById('modifyBtn');
	var myDeleteBtn=document.getElementById('deleteBtn');
	//시간계산 후 모달에 넣기
	var setValueForTime = function(sdate,now,edate){
		if(now<sdate){
  			$("#sch_time").html('일정 시작전');
  			$("#sch_time_bar").css("width","0%");
  		 } else if(now>edate){
  			$("#sch_time").html('일정 끝');
  			$("#sch_time_bar").css("width","100%");
  		 } else {
  			var allMinutes = moment.duration(edate.diff(sdate)).as('minutes');
  			var pastMinutes = moment.duration(moment().diff(sdate)).as('minutes');
  			var remainHours = Math.round(moment.duration(edate.diff(now)).as('hours'));
  			var percentage = Math.ceil((pastMinutes/allMinutes)*100);

  			$("#sch_time_bar").css("width", percentage+"%");
	  		$("#sch_time").html(remainHours + ' 시간이 남았습니다.');					  		
  		 }
	};	
	return {	
		setValue : function(data){
			eventData = data;
			var sdate = moment(data.sch_sdate);
			var edate = moment(data.sch_edate);
			var now = moment();
				 
			$("#pst_name").html(data.pst_name);
		    $("#pst_name").append(" "+data.emp_name);
			$("#sch_title").html(data.sch_title);
			setValueForTime(sdate,now,edate);																					
			$("#sch_public").html(schedule.getPosition(String(data.sch_public)));
		  	$("#sch_date").html(sdate.format('LLL')+'~'+edate.format('LLL'));				  		 
		  	$("#sch_place").html(data.sch_place);
		  	$("#sch_content").html(data.sch_content);												 						 							 						
			if(data.sf_orgfilename){
		  		$("#sf_orgfilename").html(data.sf_orgfilename);							 
		  		$("#sf_size").html(data.sf_size+" byte"+'/ 52242880 byte');
		  		percentage = Math.floor((data.sf_size/52242880)*100);
		  		$("#sf_orgfilename_bar").css("width",percentage+"%");
	  		} else {
	  			$("#sf_orgfilename").html('파일이 없어요.'); 					
	  			$("#sf_size").html('0 '+'/ 5000000 byte'); 					
	  		}						
		},
		deleteSchedule : function(){
			$.ajax({
				 method : 'get',
				 url : "<c:url value='/accessAuth?sch_num="+eventData.sch_num+"'/>",
				 dataType : "json",
				 success : function(data){
					 if(data.result){
						 mySchedule.deleteSchedule(eventData);	 
					 } else {
						 alert('삭제 권한이 없습니다.');
					 }					 		 
				 }
			});
		},
		viewModal : function(){
			return $(myModal).modal();
		},		
		setModifyForm : function(){
			$.ajax({
				 method : 'get',
				 url : "<c:url value='/accessAuth?sch_num="+eventData.sch_num+"'/>",
				 dataType : "json",
				 success : function(data){
					 console.log(data.result);
					if(data.result){
						//console.log(eventData);
						$("#sch_num").val(eventData.sch_num);
						$("#modTitle").val(eventData.sch_title);
						$("#modPlace").val(eventData.sch_place);					
						$("#daterangepicker_start_mod").val(moment(eventData.sch_sdate).format('YYYY/MM/DD HH:mm'));
						$("#daterangepicker_end_mod").val(moment(eventData.sch_edate).format('YYYY/MM/DD HH:mm'));
						$("#modContent").val(eventData.sch_content);
						$("#mod_public").val(eventData.sch_public);
						if(eventData.sf_orgfilename){
							$("#mod_orgfilename").html(eventData.sf_orgfilename);	
						} else {
							$("#mod_orgfilename").html('파일이 없어요.');
						}								
						document.getElementById("modifySchedule").style.display='block';
						document.getElementById("createSchedule").style.display='none';
						$(myModal).modal("hide");	
						defaultModal();	
					} else {
						alert('수정권한이 없습니다.');
					}		 
			 	 }
			});
		},
		downloadFile : function(){			
			console.log(eventData.sf_orgfilename);
			if(eventData.sf_orgfilename != null){
				location.href = "<c:url value='/file?sch_num="+eventData.sch_num+"'/>";	
			} else {
				alert('파일이 없습니다.');
			}
		}
	};		
})(schedule);
	  
	//Daterangepicker
	  $('#daterangepicker_start,#daterangepicker_end,#daterangepicker_start_mod,#daterangepicker_end_mod').daterangepicker({
		  timePicker24Hour: true,
		  singleDatePicker: true,
		  timePicker: true,
		  autoclose: true,
		  timePickerIncrement: 30, 
		  locale:{
			  format: 'YYYY/MM/DD HH:mm',
			  applyLabel : '작성',
			  cancelLabel: '취소'
		  }		   
	  });	    	 
    /* initialize the external events
     -----------------------------------------------------------------*/
    function init_events(ele) {
      ele.each(function () {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        }

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject)

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex        : 1070,
          revert        : true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        })

      })
    }

    init_events($('#external-events div.external-event'))

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()
        
    $('#calendar').fullCalendar({
      header    : {
        left  : 'prev,next today',
        center: 'title',
        right : 'month,agendaWeek,agendaDay'
      },
      buttonText: {     
      },
      locale:'ko',    
      //Random default events        
      eventClick : function(event){
    	  			schedule.getSchedule(event.id,modalModal.setValue);
					modalModal.viewModal();
	  },
	  eventRender : function(event,element){
        	$(element).popover({
        		title : event.title,
        		content : '<p>'+event.start.format('MM월 DD일 A hh시 mm분')+'</p><p>'+event.end.format('MM월 DD일 A hh시 mm분')+'</p><p>'+event.description+'</p>',
        		html : true,
        		trigger: 'hover',
                placement: 'top',
                container: 'body'
        	});
      },
      eventMouseover : function(){
    	  $(this).css("cursor","pointer");
      }      
    });
    
    var defaultModal = function(){
		$("div.nav-tabs-custom > ul.nav.nav-tabs").find("li.active").removeClass("active");
		$("div.nav-tabs-custom > ul.nav.nav-tabs li:nth-child(1)").addClass("active");
		$("div.nav-tabs-custom > div.tab-content").find("div.tab-pane.active").removeClass("active");
		$("div.nav-tabs-custom > div.tab-content > div:nth-child(1)").addClass("active");		
	};
  	document.getElementById("btnCreate").addEventListener('click',function(){
    	document.getElementById("modifySchedule").style.display='none';
		document.getElementById("createSchedule").style.display='block';
    });
  	document.getElementById("modifyFile").addEventListener('change',function(){	  		  		
        var x = document.getElementById("modifyFile").files[0].name;
  		document.getElementById("mod_orgfilename").innerHTML = x;
  	});
  	document.getElementById("closeModalBtn").addEventListener('click',defaultModal);
  	document.getElementById("deleteModalBtn").addEventListener('click',modalModal.deleteSchedule);
  	document.getElementById("modifyModalBtn").addEventListener('click',modalModal.setModifyForm);  	
  	document.getElementById("downloadBtn").addEventListener('click',modalModal.downloadFile);
  	//일정등록 유효성 검사 항목
  	document.getElementById("createForm").addEventListener('submit', function(evt){
  		var title = $("#cr8Title").val();
  		var place = $("#cr8Place").val();
  		var sdate = moment($("#daterangepicker_start").val());
  		var edate = moment($("#daterangepicker_end").val());  		
  		var result = moment.duration().subtract(sdate.diff(edate));
  		var swit = false;
  		//console.log(result);
  		if(title.length>15 || title.length<=0){
  			alert('일정제목은 최소 1자, 최대 15자로 작성해주세요.');
  			swit = true;
  		}
  		if(place.length>10 || place.length<=0){
  			alert('장소 이름은 최소 1자, 최대 10자로 작성해주세요.');
  			swit = true;  			
  		}
  		if(result._milliseconds<=0){
  			alert('시작일이 종료일보다 같거나 앞에 있습니다.');
  			swit = true;
  		}
  		if(swit){
  			evt.preventDefault();
  		}
  	});
  	/* function(){
		defaultModal();
		$("#modal-default").modal("hide");
	} */
});
</script>

  <!-- The Right Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
	<!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs" id="chatTabs">
      <li class="active"><a href="#control-sidebar-users-tab" data-toggle="tab"><i class="fa fa-users"></i></a></li>
      <li><a href="#control-sidebar-chatting-tab" data-toggle="tab"><i class="fa fa-commenting"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Contacts are loaded here -->
      <div class="tab-pane active" id="control-sidebar-users-tab">
	  <!-- <div class="direct-chat-contacts"> -->
	   <!--  <ul class="contacts-list"> -->
	    <ul class="control-sidebar-menu" id="userList">
		  <li>
		    <!-- <a href="#">				          
			  <i class="menu-icon fa fa-birthday-cake bg-red"></i>		    
			  <img class="contacts-list-img" src="https://vignette.wikia.nocookie.net/undertale/images/e/ef/Reunited.png/revision/latest?cb=20160211165705" alt="User Image">
			    <div class="contacts-list-info">
			      <span class="contacts-list-name">Count Dracula<small class="contacts-list-date pull-right">2/28/2015</small></span>
			      <span class="contacts-list-msg">How have you been? I was...</span>
			    </div>
			</a> -->
		  </li>
		  <!-- End Contact Item -->
		</ul>
		<!-- /.contatcts-list -->
	  </div>
	  <!-- /.direct-chat-pane -->
      
      <!-- Home tab content -->
      <div class="tab-pane direct-chat-primary" id="control-sidebar-chatting-tab">
        <!-- <h3 class="control-sidebar-heading">사람 이름</h3> -->
		
		<!-- Message. Default to the left -->
                    <div class="direct-chat-msg">
                      <div class="direct-chat-info clearfix">
                        <span class="direct-chat-name pull-left">Alexander Pierce</span>
                        <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
                      </div>
                      <!-- /.direct-chat-info -->
                      <img class="direct-chat-img" src="dist/img/user1-128x128.jpg" alt="">
                      <!-- /.direct-chat-img -->
                      <div class="direct-chat-text">
                        Is this template really for free? That's unbelievable!
                      </div>
                      <!-- /.direct-chat-text -->
                    </div>
                    <!-- /.direct-chat-msg -->
		
		<!-- Message to the right -->
                    <div class="direct-chat-msg right">
                      <div class="direct-chat-info clearfix">
                        <span class="direct-chat-name pull-right">Sarah Bullock</span>
                        <span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
                      </div>
                      <!-- /.direct-chat-info -->                      
                      <img class="direct-chat-img" src="dist/img/user3-128x128.jpg" alt="">
                      <!-- /.direct-chat-img -->
                      <div class="direct-chat-text">
                        You better believe it!
                      </div>
                      <!-- /.direct-chat-text -->
                    </div>
                    <!-- /.direct-chat-msg -->
		<!-- <div class="box-footer"> -->
	 <form action="#" method="post" id="realChat">
	 <div class="input-group">
	   <input type="text" name="message" placeholder="Type Message ..." class="form-control">
	   <span class="input-group-btn">
		 <button type="submit" class="btn btn-primary btn-flat" id="send1">전송</button>
	   </span>
	 </div>
	 </form>
   </div>
      <!-- </div> -->
      <!-- /.tab-pane -->
            
   </div>    
   <!-- Content of the sidebar goes here -->   
</aside>
<!-- The sidebar's background -->
<!-- This div must placed right after the sidebar for it to work-->
<div class="control-sidebar-bg"></div>


<button class="btn btn-default" data-toggle="control-sidebar" id="toggle_Right_Sidebar">Toggle Right Sidebar</button>
<!-- Content Wrapper. Contains page content -->  
  <div>  
  
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Calendar
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="<c:url value='/'/>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Calendar</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">
          
          <!-- /. box -->
          <div class="box box-primary" id="modifySchedule" style="display:none;">
            <div class="box-header with-border">
              <h3 class="box-title">일정수정</h3>
              
              <!-- tools box -->
              <div class="pull-right box-tools">
                <!-- button with a dropdown -->
                <div class="btn-group">
                  <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-bars"></i></button>
                  <ul class="dropdown-menu pull-right" role="menu">
                    <li><button class="btn btn-block btn-default" id="btnCreate">일정등록으로 전환</button></li>                    
                  </ul>
                </div>
              </div>
              <!-- /. tools -->
              
            </div>
            <div class="box-body">
                                                                  
              <!-- text input -->
              <div class="form-group">
              	<form method="post" action="<c:url value='/updateSchedule'/>" enctype="multipart/form-data">
              	<input type="hidden" name="sch_num" id="sch_num" value="">
              	<!-- <input type="hidden" name="emp_num" id="emp_num" value="3"> -->
                <label>일정이름</label>
                <input type="text" name="sch_title" class="form-control" placeholder="Enter ..." id="modTitle">
                <label>장소</label>
                <input type="text" name="sch_place" class="form-control" placeholder="Enter ..." id="modPlace">           
              <!-- Date -->
                <label>시작일:</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" name="sch_sdate" class="form-control pull-right" id="daterangepicker_start_mod">
                </div>
                <label>종료일:</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" name="sch_edate" class="form-control pull-right" id="daterangepicker_end_mod">
                </div>
                
                <label>내용</label>
                <textarea class="form-control" rows="7" placeholder="Enter ..." name="sch_content" id="modContent"></textarea>
                <label>공개여부</label>
                  <select class="form-control" name="sch_public" id="mod_public">
                  	<option value="0">비공개</option>                    
                  </select>                  
                  
				<label>첨부파일(50MB 이하)</label>                  
                  <div class="form-group">
                    <div class="btn btn-default btn-file">
                      <i class="fa fa-paperclip"></i> 파일첨부
                      <input type="file" name="file1" id="modifyFile">
                    </div>                    
                      <p class="help-block" id="mod_orgfilename">파일 없음</p>                                                                    			          			  
                  </div>                                                                                 
                  <input type="submit" class="btn btn-primary" value="일정 수정">                  
                  </form>                                                                              
              </div>                                                  
              <!-- /.form group -->
                            
              <!-- /input-group -->
            </div>
          </div>
          
          
          <!-- /. box -->
          <div class="box box-primary" id="createSchedule">
            <div class="box-header with-border">
              <h3 class="box-title">일정등록</h3>
            </div>
            <div class="box-body">
                                                                  
              <!-- text input -->
              <div class="form-group">
              	<form method="post" action="<c:url value='/'/>schedule" enctype="multipart/form-data" id="createForm">
              	<!-- <input type="hidden" name="emp_num" value="3"> -->
                <label>일정이름</label>
                <input type="text" name="sch_title" class="form-control" placeholder="Enter ..." id="cr8Title">
                <label>장소</label>
                <input type="text" name="sch_place" class="form-control" placeholder="Enter ..." id="cr8Place">           
              <!-- Date -->
                <label>시작일:</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" name="sch_sdate" class="form-control pull-right" id="daterangepicker_start">
                </div>
                <label>종료일:</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" name="sch_edate" class="form-control pull-right" id="daterangepicker_end">
                </div>
                
                <label>내용</label>
                <textarea class="form-control" rows="7" placeholder="Enter ..." name="sch_content"></textarea>
                <label>공개여부</label>
                  <select class="form-control" name="sch_public" id="create_public">
                  	<option value="0">비공개</option>
                  </select>           
                  <label for="inputFile">첨부파일(50MB 이하)</label>
                  <input type="file" id="inputFile" name="file1" >                                          
                                                                     
                  <br>
                  <input type="submit" class="btn btn-primary" value="일정 등록">
                  </form>                                                             
              </div>                                                  
              <!-- /.form group -->
                            
              <!-- /input-group -->
            </div>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-body no-padding">
              <!-- THE CALENDAR -->
              <div id="calendar"></div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>

  <div class="modal fade" id="modal-default">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">상세내용</h4>
              </div>
              
              <!-- Custom Tabs -->
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active" id="activeClass"><a href="#tab_1" data-toggle="tab">작성자</a></li>
              <li><a href="#tab_2" data-toggle="tab">일정이름</a></li>
              <li><a href="#tab_3" data-toggle="tab">공개여부</a></li>                            
              <li><a href="#tab_4" data-toggle="tab">장소</a></li>
              <li><a href="#tab_5" data-toggle="tab">파일</a></li>
              <li><a href="#tab_6" data-toggle="tab">시작일과 종료일</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
			    <!-- 작성자 -->
                <div class="info-box bg-aqua">
  				  <span class="info-box-icon"><i class="glyphicon glyphicon-user"></i></span>
  				  <div class="info-box-content">
    			    <span class="info-box-text">작성자</span>    			  
    			    <span class="info-box-number" id="pst_name">XXXXX</span>    			  
  			      </div>
  			    <!-- /.info-box-content -->
			    </div>
			    <!-- /.info-box -->

              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_2">                
                <!-- 일정이름 -->
                <div class="info-box bg-aqua">
  				  <span class="info-box-icon"><i class="fa fa-heart-o"></i></span>
  				  <div class="info-box-content">
    			    <span class="info-box-text">일정이름</span>    			  
    			    <span class="info-box-number" id="sch_title">XXXXX</span>    			  
  			      </div>
  			      <!-- /.info-box-content -->
			    </div>
			    <!-- /.info-box -->                  
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_3">              
                <!-- 공개여부 -->
                <div class="info-box bg-aqua">
  				  <span class="info-box-icon"><i class="fa fa-lock"></i></span>
  				  <div class="info-box-content">
    			    <span class="info-box-text">공개여부</span>    			  
    			    <span class="info-box-number" id="sch_public">XXX</span>    			  
  			      </div>
  			      <!-- /.info-box-content -->
			    </div>
			    <!-- /.info-box -->                                                                 
              </div>
              <!-- /.tab-pane -->
              
              <div class="tab-pane" id="tab_4">              
                <!-- 장소 -->
                <div class="info-box bg-aqua">
  				  <span class="info-box-icon"><i class="fa fa-globe"></i></span>
  				  <div class="info-box-content">
    			    <span class="info-box-text">장소</span>    			  
    			    <span class="info-box-number" id="sch_place">XXXXX</span>    			  
  			      </div>
  			    <!-- /.info-box-content -->
			    </div>
			    <!-- /.info-box -->              
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_5">
              <!-- 첨부파일 -->
			  <div class="info-box bg-aqua">
  				<span class="info-box-icon"><i class="fa fa-file-o"></i></span>
  				<div class="info-box-content">
  				  <button type="button" class="btn btn-primary pull-right" id="downloadBtn">다운로드</button>
    			  <span class="info-box-text">파일</span>
    			  <span class="info-box-number" id="sf_orgfilename">File Name</span>
    			  <!-- The progress section is optional -->
    			  <div class="progress">
      				<div class="progress-bar" style="width: 0%" id="sf_orgfilename_bar"></div>
    			  </div>
    			  <span class="progress-description" id="sf_size">
      			  xxxxxxx KB
    			  </span>
  			    </div>
  			  <!-- /.info-box-content -->
			  </div>
			  <!-- /.info-box -->
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_6">
                <!-- 시작일 ~ 종료일 -->
			    <div class="info-box bg-aqua">
  				  <span class="info-box-icon"><i class="fa fa-calendar"></i></span>
  				  <div class="info-box-content">
    			    <span class="info-box-text">시작일과 종료일</span>
    			    <span class="info-box-number" id="sch_date">20XX/X월/X일 ~ 20XX/X월/X일</span>
    			    <!-- The progress section is optional -->
    			    <div class="progress">
      				  <div class="progress-bar" style="width: 70%" id="sch_time_bar"></div>
    			    </div>
    			    <span class="progress-description" id="sch_time">
      			    XX%가 지난 현재 남은 시간 XX Hours
    			    </span>    			      			     			  
  			      </div>
  			    <!-- /.info-box-content -->
			    </div>
			    <!-- /.info-box -->
              </div>
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- nav-tabs-custom -->  
                                     			   			  			  			  						  			  			  			            	            	            	  
          	  <!-- 내용 -->          	           	  			           	  			  
              <div class="modal-body">
                <p class="lead" id="sch_content">XXXX</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal" id="closeModalBtn">닫기</button>
                <button type="button" class="btn btn-primary" id="modifyModalBtn">수정하기</button>                                                                         
                <button type="button" class="btn btn-primary" id="deleteModalBtn">삭제</button>
              </div>                                          
            </div>
            <!-- /.modal-content -->            
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->