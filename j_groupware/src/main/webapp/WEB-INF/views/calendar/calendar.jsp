<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value='/'/>resources/plugins/fullcalendar/ko.js"></script>
<script>
$(function () {
//일정 읽기, 전체일정 불러오기
  var schedule = (function(){
	  var position = {'0':'비공개'};
	  return {
		  initSchedules : function(){
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
							        description : data[i].sch_content,
					  });				    										
					}
				$('#calendar').fullCalendar('addEventSource',events);
				}
			  });  
		  },
		  initPublic : function(){
			  var selectPublic = document.getElementById("selectPublic");
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
							 selectPublic.add(option);							 	 
						 }
					 }
		      });
		  },
		  /* 
		  getSchedule : function(sch_num){
			  console.log(sch_num);
			  $.ajax({
					 method: "get",
					 url : "<c:url value='/getSchedule?sch_num="+sch_num+"'/>",
					 dataType : "json",
					 async : false,
					 success : function(data){
						 console.log(data.sch_title+':'+data.sch_sdate);
					 }
		      });
		  },
		   */
		  getPosition : function(pst_num){
			  var string_pst_num = String(pst_num);
			  return position[string_pst_num];
		  },
		  		  
	  };
  })();	  	  
var modalModal = (function(){
	var myModal,now,sdate,edate;
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
  			//console.log('남은시간 :'+remainHours);
  			//console.log('지난시간(분): '+pastMinutes+'전체시간(분):'+allMinutes);
  			var percentage = Math.ceil((pastMinutes/allMinutes)*100);

  			$("#sch_time_bar").css("width", percentage+"%");
	  		$("#sch_time").html(remainHours + ' 시간이 남았습니다.');					  		
  		 }
	};
	return {			  
		initModal : function(modalId){
			myModal = document.getElementById(modalId);
		},
		setValue : function(sch_num){			
			  $.ajax({
					 method: "get",
					 url : "<c:url value='/getSchedule?sch_num="+sch_num+"'/>",
					 dataType : "json",
					 success : function(data){
						 sdate = moment(data.sch_sdate);
						 edate = moment(data.sch_edate);
						 now = moment();
						 
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
					 }
		      });
		},
		viewModal : function(){
			return $(myModal).modal();
		},		
	};		
})();	  	  	  	
	  
	//Daterangepicker
	  $('#daterangepicker_start').daterangepicker({
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
	  $('#daterangepicker_end').daterangepicker({
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
					modalModal.viewModal();
					modalModal.setValue(event.id);
	  },
	  eventRender : function(event,element){
        	$(element).popover({
        		title : event.title,
        		content : '<p>'+event.start.format('YYYY/MM/DD A hh:mm')+'</p><p>'+event.end.format('YYYY/MM/DD A hh:mm')+'</p><p>'+event.description+'</p>',
        		html : true,
        		trigger: 'hover',
                placement: 'top',
                container: 'body'
        	});
      },
      eventMouseover : function(){
    	  $(this).css("cursor","pointer");
      }
      //events : [],
      //editable  : true
      //droppable : true, // this allows things to be dropped onto the calendar !!!
      /* 
      drop      : function (date, allDay) { // this function is called when something is dropped

        // retrieve the dropped element's stored Event Object
        var originalEventObject = $(this).data('eventObject')

        // we need to copy it, so that multiple events don't have a reference to the same object
        var copiedEventObject = $.extend({}, originalEventObject)

        // assign it the date that was reported
        copiedEventObject.start           = date
        copiedEventObject.allDay          = allDay
        copiedEventObject.backgroundColor = $(this).css('background-color')
        copiedEventObject.borderColor     = $(this).css('border-color')

        // render the event on the calendar
        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true)

        // is the "remove after drop" checkbox checked?
        if ($('#drop-remove').is(':checked')) {
          // if so, remove the element from the "Draggable Events" list
          $(this).remove()
        }
      } */
    });
  	//일정 불러오기
    schedule.initSchedules();
  	schedule.initPublic();
  	modalModal.initModal('modal-default');
  });
</script>

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
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">일정등록</h3>
            </div>
            <div class="box-body">
              <!-- <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                <button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>
                <ul class="fc-color-picker" id="color-chooser">
                  <li><a class="text-aqua" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-blue" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-light-blue" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-teal" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-yellow" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-orange" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-green" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-lime" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-red" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-purple" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-fuchsia" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-muted" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-navy" href="#"><i class="fa fa-square"></i></a></li>
                </ul>
              </div> -->
                                                     
              <!-- text input -->
              <div class="form-group">
              	<form method="post" action="<c:url value='/'/>schedule" enctype="multipart/form-data">
              	<input type="hidden" name="emp_num" value="3">
                <label>일정이름</label>
                <input type="text" name="sch_title" class="form-control" placeholder="Enter ...">
                <label>장소</label>
                <input type="text" name="sch_place" class="form-control" placeholder="Enter ...">           
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
                  <select class="form-control" name="sch_public" id="selectPublic">
                  	<option value="0">비공개</option>                    
                  </select>                  
                  <label for="inputFile">첨부파일(5MB 이하)</label>
                  <input type="file" id="inputFile" name="file1">
                                                                     
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
              <li class="active"><a href="#tab_1" data-toggle="tab">작성자</a></li>
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
    			    <span class="info-box-number" id="">XXXXX</span>    			  
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
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary">수정</button>                                                                         
                <button type="button" class="btn btn-primary">삭제</button>
              </div>                                          
            </div>
            <!-- /.modal-content -->            
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
