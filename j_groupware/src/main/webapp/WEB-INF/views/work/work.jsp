<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<c:url value='/'/>resources/plugins/fullcalendar/ko.js"></script>
<div>
	<h3>
	<span class="glyphicon glyphicon-list-alt"></span> 근태신청 현황(자신이 속한 부서)
	</h3>
	<div class="box">
		<div class="box-body">
			<!-- Custom Tabs -->
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab_1" data-toggle="tab"
						aria-expanded="true">오늘</a></li>
					<li id="successMS" class=""><a href="#tab_2" data-toggle="tab"
						aria-expanded="false">월별 현황</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab_1">
						<div class="box-body">
							<!-- ----------------------------------------------------------------------------------------------------------- -->

							<!--  -->
											<div class="box-body no-padding">
												<table class="table table-hover">
													<tbody>
														<tr>
															<th>직책</th>
															<th>이름</th>
															<th>날짜</th>
															<th>상세</th>
															<th>사유</th>
														</tr>
														<c:forEach items="${st1 }" var="st1">
															<tr>
																<td>${st1.pst_name }</td>
																<td>${st1.emp_name }</td>
																<td>${st1.term }</td>
																<c:choose>
																	<c:when test="${st1.wtype_num==1 }">
																		<td><span class="badge bg-green">${st1.wtype_name }</span></td>
																	</c:when>
																	<c:when test="${st1.wtype_num==5 }">
																		<td><span class="badge bg-yellow">${st1.wtype_name }</span></td>
																	</c:when>
																	<c:otherwise>
																		<td><span class="badge bg-gray">${st1.wtype_name }</span></td>
																	</c:otherwise>
																</c:choose>
																<td>${st1.work_content}</td>
															</tr>
														</c:forEach>
														<c:forEach items="${st2 }" var="st2">
															<tr>
																<td>${st2.pst_name }</td>
																<td>${st2.emp_name }</td>
																<td>${st2.term }</td>
																<c:choose>
																	<c:when test="${st2.wtype_num==2 }">
																		<td><span class="badge bg-blue">${st2.wtype_name }</span></td>
																	</c:when>
																	<c:when test="${st2.wtype_num==3 }">
																		<td><span class="badge bg-red">${st2.wtype_name }</span></td>
																	</c:when>
																	<c:otherwise>
																		<td><span class="badge bg-purple">${st2.wtype_name }</span></td>
																	</c:otherwise>
																</c:choose>
																<td>${st2.work_content}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<!-- /.box-body -->
						</div>

						<!-- ----------------------------------------------------------------------------------------------------------- -->
						<!-- /.box-body -->

					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_2">
						<div class="box-body">
							<span class="badge bg-green">연차</span> <span
								class="badge bg-blue">반차</span> <span class="badge bg-red">지각</span>
							<span class="badge bg-purple">야근</span> <span
								class="badge bg-yellow">외근</span> <span class="badge bg-gray">경조사/기타</span>
							<br> <br>
							<div class="box box-success">
								<div id="calendar" style="height: 900px"></div>
							</div>
						</div>
					</div>
					<!-- /.tab-pane -->

				</div>
				<!-- /.tab-pane -->
			</div>
			<!-- /.tab-content -->
		</div>
		<!-- nav-tabs-custom -->
	</div>

	<script type="text/javascript">
		$(function() {
			//일정 읽기, 전체일정 불러오기
			var schedule = (function() {

				var initSchedules = function() {
					$.ajax({
						method : "POST",
						url : "<c:url value='/searchSch'/>",
						dataType : "json",
						success : function(data) {
							var events = new Array();
							
							for (var i = 0; i < data.length; i++) {
								var bgc='';
								var fc='';
								if(data[i].wtype_num==1){// 연차
									bgc='#00a65a';
									fc='white';
									
								}else if(data[i].wtype_num==2){//반차
									bgc='##0073b7';
									fc='white';
									
								}else if(data[i].wtype_num==3 && data[i].work_state!=86){//지각신청
									bgc='#dd4b39';
									fc='white';
									
								}else if(data[i].wtype_num==4){//야근신청
									bgc='#605ca8';
									fc='white';
									
								}else if(data[i].wtype_num==5){//외근/출장/교육
									bgc='#f39c12';
									fc='white';
									
								}else if(data[i].wtype_num==6){//경조사/기타
									bgc='#d2d6de';
									fc='black';
									
								}else if(data[i].wtype_num==3 && data[i].work_state==86){//무단지각
									bgc='black';
									fc='white';
								}
								
								events.push({
									id : data[i].work_num,
									title : data[i].emp_name,
									start : data[i].sdate,
									end : data[i].edate,
									description : data[i].content,
									backgroundColor : bgc,
									textColor : fc
								//allDay : true
								});
							}
							$('#calendar').fullCalendar('addEventSource',events);
						}
					});
				};

				initSchedules();
			})();
			$('#calendar').fullCalendar({
				//노출메뉴
				header : {
					left : 'prev,next,today',
					center : 'title',
					right : ''
				},
				buttonText : {},
				locale : 'ko',
				
				eventRender : function(event, element) {
					$(element).popover({
						title : event.title,
						content : event.description,
						html : true,
						trigger : 'hover',
						placement : 'top',
						container : 'body'
					});
				},
				eventMouseover : function() {
					$(this).css("cursor", "pointer");
				}
			});

		});
	</script>
</div>
