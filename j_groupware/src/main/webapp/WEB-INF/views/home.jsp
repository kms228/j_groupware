<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
(function(){	
	var view = (function(){
//		var myService;
		
		function pstColor(pst_num){
			var pstColorClass;
			switch (pst_num) {
				case 1:
					pstColorClass = "label label-danger";
					break;
				case 2:				
					pstColorClass = "label bg-orange";
					break;
				case 3:				
					pstColorClass = "label label-warning";
					break;
				case 4:				
					pstColorClass = "label label-info";
					break;
				case 5:				
					pstColorClass = "label bg-navy";
					break;
				case 6:				
					pstColorClass = "label bg-purple";
					break;				
				default:
					pstColorClass = "label bg-black";
				break;
			}
			return pstColorClass;			
		}
		
		return {
			setMyProfile : function(data){
				$(".widget-user-username").html(data.emp_name);
				$(".widget-user-desc").html(data.dept_name);
				var pstColorClass = pstColor(data.pst_num);
				//console.log(pstColorClass);
				//console.log(data.pst_name);
				$("#pst_num_name").append('<span class="'+ pstColorClass +'">'+ data.pst_name +'</span>');
				//$("#pst_num_name").append("<span class='label label-danger'>UI Design</span>");
				$('#emp_email').html(data.emp_email);
				$('#emp_phone').html(data.emp_phone);
			},
			setMySchedule : function(data){				
				$(".info-box.bg-aqua:eq("+0+")");
				var length = data.length;
				for(var i=0;i<length;i+=1){
					var scheduleBox = $(".info-box.bg-aqua:eq("+i+")");
					$(scheduleBox).empty().append('<span class="info-box-icon"><i class="fa fa-calendar"></i></span>'+
					'<div class="info-box-content"><span class="info-box-text">'+data[i].sch_title+'</span>'+
					'<span class="info-box-number" id="sch_date">'+moment(data[i].sch_sdate).format('YYYY년 MM월 DD일 HH시')+' ~ '+moment(data[i].sch_edate).format('YYYY년 MM월 DD일 HH시')+'</span>'+
					'<div class="progress"><div class="progress-bar" style="width: 100%" id="sch_time_bar"></div></div>'+
					'<span class="progress-description" id="sch_time">일정 진행중</span></div>');	      																												
				}
			},
			setMyWorkList : function(data){				
				for(i in data){					
					$("#WorkList").append('<tr><td>'+moment(data[i].wlist_start).format('MM월 DD일')+'</td><td>'+data[i].emp_name+'</td>'+
						'<td>'+moment(data[i].wlist_start).format('A HH시 mm분')+'</td><td>'+
						(data[i].wlist_end === null ? '-':moment(data[i].wlist_end).format('A HH시 mm분'))+'</td><td>-</td></tr>');					
					 /* 
					 <tr>
	                  <td>11-7-2014</td>
	                  <td>Kim min Soo</td>
	                  <td>09:00</td>
	                  <td>18:00</td>
	                  <!-- <td><span class="label label-success">Approved</span></td> -->
	                  <td>-</td>
	                </tr>
					 */
				}
			},
			
			setNoitcList : function(data){				
				for(i in data){					
					$("#NoitcList").append('<tr><td>'+moment(data[i].b_date).format('MM월 DD일')
							+'</td><td>'+data[i].b_title+'</td>'+'</td><td>'+
							+'</td><td>'+data[i].b_content+'</td>'+'</td><td>'+
							+'</td><td>'+data[i].b_writer+'</td>'+'</td><td>'+
							'</td><td>-</td></tr>');					
				}
			}
		}		
	})();
	
	var service = {
		getMyProfile : function(callbackFunc){
			$.ajax({
				method: "get",
				url : "<c:url value='/getMyProfile'/>",
				dataType : "json",
			    success : function(data){
			    	callbackFunc(data);													 																					
				}
		    });
		},
		getMySchedule : function(callbackFunc){
			$.ajax({
				method: "get",
				url : "<c:url value='/getMySchedule'/>",
				dataType : "json",
			    success : function(data){
			    	//console.log(data);			    	
			    	//console.log(data.length);			    	
			    	callbackFunc(data);													 																					
				}
		    });
		},
		getMyWorkList : function(callbackFunc){
			$.ajax({
				method: "get",
				url : "<c:url value='/getMyWorkList'/>",
				dataType : "json",
			    success : function(data){			    				    
			    	callbackFunc(data);													 																					
				}
		    });
		},
		getNoticList : function(callbackFunc){
			$.ajax({
				method: "get",
				url : "<c:url value='/getNboard'/>",
				dataType : "json",
			    success : function(data){			    				    
			    	callbackFunc(data);													 																					
				}
		    });
		}
	}
	
	service.getMyProfile(view.setMyProfile);
	service.getMySchedule(view.setMySchedule);
	service.getMyWorkList(view.setMyWorkList);
	service.getNoticList(view.setNoitcList);
	
}());
</script>
<section class="content">
	<div class="row">	
		<div class="col-md-4"><!-- <button onclick = "read('sin')">Read </button> -->													  
			
		  <!-- About Me Box -->
		  <div class="box">
            <div class="box-header">
              <h3 class="box-title">내 정보</h3>
            </div>
          <!-- Widget: user widget style 1 -->
          <div class="box box-widget widget-user-2" style="margin-bottom: 0px;">
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="widget-user-header bg-yellow">
              <div class="widget-user-image">
              	<i class="fa fa-user fa-5x" style="width:65px; float:left;"></i>
                <!-- <img class="img-circle" src="../dist/img/user7-128x128.jpg" alt="User Avatar"> -->
              </div>
              <!-- /.widget-user-image -->
              <h3 class="widget-user-username">사원이름</h3>
              <h5 class="widget-user-desc">부서이름</h5>
            </div>            
          </div>          
            <div class="box-body">
            
              <strong><i class="fa fa-pencil margin-r-5"></i> 직위</strong>

              <p id="pst_num_name">
                <!-- <span class="label label-danger">UI Design</span>
                <span class="label label-success">Coding</span>
                <span class="label label-info">Javascript</span>
                <span class="label label-warning">PHP</span>
                <span class="label label-primary">Node.js</span> -->
              </p>

              <hr>
                        
              <strong><i class="fa fa-envelope margin-r-5"></i>이메일</strong>

              <p class="text-muted" id="emp_email">
				xxx@xxx.com
              </p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> 핸드폰</strong>

              <p class="text-muted" id="emp_phone">010-9999-9999</p>              
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
			
		</div>
		<div class="col-md-4"><!-- <button onclick = "readAll()">Read all </button> -->				                                        
		
			<div class="box">
            <div class="box-header">
              <h3 class="box-title">출근 내역</h3>              
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover" id="WorkList">
                <tr>
                  <th>날짜</th>
                  <th>이름</th>
                  <th>출근시각</th>
                  <th>퇴근시각</th>
                  <th>비고</th>
                </tr>                                              
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
		
		</div>
		<div class="col-md-4"><!-- <button onclick = "remove()">Delete data </button> -->
		
			<div class="box">
              <div class="box-header">
                  <h3 class="box-title">진행중인 일정</h3>
                <div class="box-tools">
                
                </div>
              </div>
              <!-- /.box-header -->
            <div class="box-body">
              <div class="info-box bg-aqua">
                <span class="info-box-icon"><i class="fa fa-close"></i></span>
                <p class="lead">일정이 없습니다.</p>                 
              </div>
              <!-- 시작점 -->
              <!-- 
			  <div class="info-box bg-aqua">
  				<span class="info-box-icon"><i class="fa fa-calendar"></i></span>
  			 	<div class="info-box-content">
    		      <span class="info-box-text">일정 제목</span>
    			  <span class="info-box-number" id="sch_date">20XX/X월/X일 ~ 20XX/X월/X일</span>
    			  The progress section is optional
    			    <div class="progress">
      				  <div class="progress-bar" style="width: 100%" id="sch_time_bar"></div>
    			    </div>
    			    <span class="progress-description" id="sch_time">
      			    XX%가 지난 현재 남은 시간 XX Hours
    			    </span>    			      			     			  
  			      </div>
			  </div> -->			    
			  <!-- /.info-box -->
            
            
              <div class="info-box bg-aqua">
                <span class="info-box-icon"><i class="fa fa-close"></i></span>
                <p class="lead">일정이 없습니다.</p>                 
              </div>
              <div class="info-box bg-aqua">
                <span class="info-box-icon"><i class="fa fa-close"></i></span>
                <p class="lead">일정이 없습니다.</p>                 
              </div>
              <div class="info-box bg-aqua">
                <span class="info-box-icon"><i class="fa fa-close"></i></span>
                <p class="lead">일정이 없습니다.</p>                 
              </div>			  
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
						
		</div>	
		
		
		<div class="col-md-6"><!-- <button onclick = "readAll()">Read all </button> -->				                                        
		
			<div class="box">
            <div class="box-header">
              <h3 class="box-title">공지사항</h3>              
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover" id="NoticList">
                <tr>
                  <th>날짜</th>
                  <th>공지제목</th>
                  <th>공지내용</th>
                  <th>작성자</th>
                </tr>                                              
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
		
		</div>
		
			
	</div>				
</section>      
