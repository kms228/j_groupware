<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value='/'/>resources/plugins/fullcalendar/ko.js"></script>
<script>
$(function () {	  
//일정 읽기, 전체일정 불러오기
  var schedule = (function(){
	  return {
		  getSchedules : function(){
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
		  }
	  };
  })();	  	  
var modalModal = (function(){
	var myModal;
	return {			  
		getModal : function(modalId){
			myModal = document.getElementById(modalId);
		},
		setValue : function(sch_num){
			  $.ajax({
					 method: "get",
					 url : "<c:url value='/getSchedule?sch_num="+sch_num+"'/>",
					 dataType : "json",
					 success : function(data){
						 $("#sch_title").html(data.sch_title);
						 $("#sch_content").html(data.sch_content);
						 $("#sf_orgfilename").html(data.sf_orgfilename);
						 console.log(data);
						 //var obj = JSON.parse(data);
						 //console.log("obj : "+obj.sf_orgfilename);
							 						 
						 if(data.sf_orgfilename){
				  			$("#sf_orgfilename").html(data.sf_orgfilename);							 
				  			$("#sf_size").html(data.sf_size+" byte");
			  			 } else {
			  				$("#sf_orgfilename").html('파일이 없어요.'); 					
			  				$("#sf_size").html('0 byte'); 					
			  			 }
					 }
		      });
		},
		viewModal : function(){
			return $(myModal).modal();
		}
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
      //events : [],
      editable  : true,
      droppable : true, // this allows things to be dropped onto the calendar !!!
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
      }
    });
  	//일정 불러오기
    schedule.getSchedules();
  	modalModal.getModal('modal-info');
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
                  <select class="form-control" name="sch_public">
                  	<option value="0">비공개</option>
                    <option value="7">사원</option>
                    <option value="6">주임</option>
                    <option value="5">대리</option>
                    <option value="4">과장</option>
                    <option value="3">차장</option>
                    <option value="2">부장</option>
                    <option value="1">사장</option>
                  </select>                  
                  <label for="inputFile">첨부파일</label>
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
  
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-info">
	Launch Info Modal
  </button>
  
  <div class="modal modal-info fade" id="modal-info">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Info Modal</h4>
              </div>
              
              <!-- 일정이름 -->
              <div class="info-box bg-blue">
  				<span class="info-box-icon"><i class="fa fa-comments-o"></i></span>
  				<div class="info-box-content">
    			  <span class="info-box-text">일정이름</span>
    			  <span class="info-box-number" id="sch_title">XXXXX</span>
    			  <!-- The progress section is optional -->
    			  <div class="progress">
      				<div class="progress-bar" style="width: 70%"></div>
    			  </div>
    			  <span class="progress-description">
      			  70% Increase in 30 Days
    			  </span>
  			    </div>
  			  <!-- /.info-box-content -->
			  </div>
			  <!-- /.info-box -->
			  
			  <!-- 장소 -->
			  <!-- small box -->
          	  <div class="small-box bg-blue">
            	<div class="inner">
                  <h3>장소<!-- <sup style="font-size: 20px">%</sup> --></h3>

              	  <p id="sch_place">XXXXXXXX</p>
            	</div>
                <div class="icon">
                <i class="fa fa-globe"></i>
            	</div>
            	<!-- <a href="#" class="small-box-footer">0 <i class="fa fa-arrow-circle-right"></i></a> -->
          	  </div>
			  
			  <!-- 시작일 ~ 종료일 -->
			  <div class="info-box bg-blue">
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
			  			  			  
			  <!-- 공개여부 -->
			  <!-- small box -->
          	  <div class="small-box bg-blue">
            	<div class="inner">
                  <h3>공개제한<!-- <sup style="font-size: 20px">%</sup> --></h3>

              	  <p id=sch_public>사원</p>
            	</div>
                <div class="icon">
                <i class="fa fa-lock"></i>
            	</div>
            	<!-- <a href="#" class="small-box-footer">0 <i class="fa fa-arrow-circle-right"></i></a> -->
          	  </div>
          	  
          	  <!-- 첨부파일 -->
			  <div class="info-box bg-blue">
  				<span class="info-box-icon"><i class="fa fa-file-o"></i></span>
  				<div class="info-box-content">
    			  <span class="info-box-text">파일</span>
    			  <span class="info-box-number" id="sf_orgfilename">File Name</span>
    			  <!-- The progress section is optional -->
    			  <div class="progress">
      				<div class="progress-bar" style="width: 70%"></div>
    			  </div>
    			  <span class="progress-description" id="sf_size">
      			  xxxxxxx KB
    			  </span>
  			    </div>
  			  <!-- /.info-box-content -->
			  </div>
			  <!-- /.info-box -->
          	  
          	  <!-- 내용 -->
          	  <div class="box box-primary collapsed-box">
                <div class="box-header with-border">
                  <h3 class="box-title">내용</h3>

                  <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                    </button>
                  </div>
              	  <!-- /.box-tools -->
            	</div>
            	<!-- /.box-header -->
                <div class="box-body">
                  <p class="text-muted" id="sch_content">
                	불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라
					불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라불라					
				  </p>
                </div>
              <!-- /.box-body -->
              </div>
              <!-- /.box -->          	  			 
          	  
			  <!-- 
			  <div class="info-box">
  			  Apply any bg-* class to to the icon to color it
  				<span class="info-box-icon bg-red"><i class="fa fa-lock"></i></span>
  				<div class="info-box-content">  				
    			  <span class="info-box-text">공개여부</span>
    			  <span class="info-box-number">5</span>
  				</div>  				
			  </div> -->
			  <!-- /.info-box -->			  			  			  			  
              
              <!-- <div class="modal-body">
                <p>One fine body&hellip;</p>
              </div> -->
              <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-outline">수정</button>
                <button type="button" class="btn btn-outline">삭제</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        
        