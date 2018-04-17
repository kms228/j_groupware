<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value='/'/>resources/plugins/fullcalendar/ko.js"></script>
<script>
  $(function () {
	  
	  //모달 메소드 객체
	  var modalScheduler = {
		viewSchedule : function(event){
			if(event.url){    		  
				window.open(event.url);
				return false;
			}
	    }
	  };
	  
	  //일정 읽기.
	  $.ajax({
		 method: "POST",
		 url : "<c:url value='/getSchedules'/>",
		 dataType : "json",
		 success : function(data){
			var events = new Array();
				for(i in data){					
				    events.push({				    	
				            title          : data[i].sch_title,
				            start          : data[i].sch_sdate,
				            end            : data[i].sch_edate,
				            description	   : data[i].sch_content,
				            url            : "<c:url value='/getSchedule?sch_num="+data[i].sch_num+"'/>"
				            /* backgroundColor: '#3c8dbc',
				            borderColor    : '#3c8dbc' */
					});				    										
				}
				$('#calendar').fullCalendar('addEventSource',events);
		 }
	  });	  
	  
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
      eventClick: modalScheduler.viewSchedule,
            
      /* eventRender: function(event, $el, view) {    	      	  
          $el.popover({            
        	  title: event.title,            
            content: event.description,                                   
            trigger: 'hover',
            placement: 'top',
            container: 'body'
          });
        }, */
        eventRender : function(event,element){
        	$(element).popover({
        		title : event.title,
        		content : '<p>'+event.start.format('MM월 DD일 a hh:mm')+'</p><p>'+event.end.format('MM월 DD일 a hh:mm')+'</p><p>'+event.description+'</p>',
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
              <div class="modal-body">
                <p>One fine body&hellip;</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-outline">Save changes</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->