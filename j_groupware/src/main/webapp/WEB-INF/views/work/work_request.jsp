<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="">

<div>

	<h3>
		<span class="glyphicon glyphicon-time"></span> 출근 / 퇴근
	</h3>
	<div class="box">
		<div class="box-body">
			<label for="reservation3">출/퇴근 현황</label>
			<div class="form-group">
				<div class="col-md-3">
					<div class="input-group">
						<div class="input-group-btn">
							<button type="button" class="btn btn-default">날짜</button>
						</div>
						<!-- /btn-group -->

						<div class="input-group">
							<input type="text" class="form-control" id="nowDate" readonly="readonly" name="wlist_start">
						</div>
						<!-- /.input group -->
						<!-- /.form group -->

					</div>
				</div>
				<div class="col-md-3">
					<div class="input-group">
						<div class="input-group-btn">
							<button type="button" class="btn btn-default">시간</button>
						</div>
						<!-- /btn-group -->

						<div class="input-group">
							<input type="text" class="form-control" id="nowTime" readonly="readonly">
						</div>
						<!-- /.input group -->
						<!-- /.form group -->

					</div>
				</div>

				<div class="col-md-3">
					<form onsubmit="return workStart();" method="post" action="<c:url value='/workStart'/>">
						<input type="hidden" name="emp_num" value="${emp_num }"> 
						<input type="hidden" name="wlist_start" id="real_workstart"> 
						<input type="hidden" name="wlist_type" id="wlist_type" value="0">
						<div class="input-group">
							<div class="input-group-btn">
								<button type="submit" class="btn btn-primary">출근</button>
							</div>
							<!-- /btn-group -->
							<div class="input-group">
								<input type="text" class="form-control" readonly="readonly" id="text_workstart" value="<fmt:formatDate value="${work.wlist_start}" pattern="HH:mm"/>">
							</div>
							<!-- /.input group -->
						</div>
					</form>
					<!-- /.form group -->
				</div>
				<div class="col-md-3">
					<form onsubmit="return workEnd();" action="<c:url value='/workEnd'/>" method="post">
						<input type="hidden" name="emp_num" value="${emp_num }"> <input type="hidden" name="wlist_end" id="real_workend">
						<div class="input-group">
							<div class="input-group-btn">
								<button type="submit" class="btn btn-danger">퇴근</button>
							</div>
							<!-- /btn-group -->
							<div class="input-group">
								<input type="text" class="form-control" id="text_workend" readonly="readonly" value="<fmt:formatDate value="${work.wlist_end}" pattern="HH:mm"/>">
							</div>
							<!-- /.input group -->
						</div>
					</form>
				</div>
				<br>

			</div>
		</div>
	</div>
	<h3>
		<span class="glyphicon glyphicon-time"></span> 근태 신청
	</h3>
	<!-- 아코디언 -->
	<div class="col-md-12">
		<div class="box box-solid">
			<div class="box-body">
				<div class="box-group" id="accordion">
					<!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
					<div class="panel box box-default">
						<div class="box-header with-border">
							<h4 class="box-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" class=""> 연차 </a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" aria-expanded="false" style="">
							<div class="box-body">
								<!-- 연차신청 폼 -->
								<form method="post" enctype="multipart/form-data" action="<c:url value="/requestAnn/1"/>">
									<input type="hidden" name="emp_num" value="${emp_num }" >
									<input type="hidden" name="work_sdate" id="work_sdate" class="work_sdate">
									<input type="hidden" name="work_edate" id="work_edate" class="work_edate">
									<div class="form-group">
										<label>연차 현황</label>
										<div class="form-control">
											총 연차 일수 : <label style="color: green;">${annual.ann_total }</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
											사용일 : <label style="color: blue;">${annual.ann_use } </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											가용일 : <label style="color: red;">${annual.ann_total-annual.ann_use }</label>
										</div>
									</div>
									<label for="reservation">일자/시간</label>
									<!-- 연차-->
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<label for="reservation"> <i class="fa fa-calendar"></i></label>
											</div>
											<input type="text" class="form-control pull-left" id="reservation">
										</div>
										<!-- /.input group -->
									</div>
									<div class="form-group">
										<div>
											<label for="reason1">사유</label>
										</div>
										<textarea class="form-control" rows="3" placeholder="사유를 적으세요." id="reason1" required="required" name="work_content"></textarea>
									</div>
									<div class="form-group">
										<label for="exampleInputFile1">첨부</label> 
										<input type="file" id="exampleInputFile1" name="file">
									</div>
									<div class="form-group">
										<label for="line1">결재선 선택(결재 순서에 맞춰 선택해 주세요)</label> <input type="text" class="form-control" data-target="#myModal" data-toggle="modal" id="line1" placeholder="결재선 선택" readonly="readonly" required="required">
										<input type="hidden" id="text_emp_num2" name="emp_num2">
									</div>
									
									<div class="box-footer">
										<input type="submit" class="btn btn-block btn-primary" value="연차 신청"/>
									</div>
								</form>
								<!-- /연차신청 폼 -->
							</div>
						</div>
					</div>
					<div class="panel box box-default">
						<div class="box-header with-border">
							<h4 class="box-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" class="collapsed" aria-expanded="false">반차 </a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
							<div class="box-body">
								<!-- 반차신청 폼 -->
								<form method="post" enctype="multipart/form-data" action="<c:url value="/requestAnn/2"/>">
									<input type="hidden" name="emp_num" value="${emp_num }" >
									<input type="hidden" name="work_sdate" id="work_sdate2">
									<input type="hidden" name="work_edate" id="work_edate2">
									<div class="form-group">
									<label>연차 현황</label>
										<div class="form-control">
											총 연차 일수 : <label style="color: green;">${annual.ann_total }</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
											사용일 : <label style="color: blue;">${annual.ann_use } </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											가용일 : <label style="color: red;">${annual.ann_total-annual.ann_use }</label>
										</div>
									</div>
									<label for="datepicker">일자/시간</label>
									<div class="form-group">
										<div class="input-group date">
											<div class="input-group-addon">
												<label for="datepicker"> <i class="fa fa-calendar"></i>
												</label>
											</div>
											<input type="text" class="form-control pull-right" id="datepicker">
										</div>
										<div class="form-group">
											<div class="radio" align="center">
												<label> <input type="radio" name="radio_ampm"id="am" value="am"> 오전</label> 
												<label> <input type="radio" name="radio_ampm"id="pm" value="pm"> 오후</label>
											</div>
										</div>
										<!-- /.input group -->
									</div>
									<div class="form-group">
										<div>
											<label for="reason2">사유</label>
										</div>
										<textarea class="form-control" rows="3" placeholder="사유를 적으세요." id="reason2" name="work_content"></textarea>
									</div>
									<div class="form-group">
										<label for="exampleInputFile2">첨부</label>
										<input type="file" id="exampleInputFile2" name="file">
									</div>
									<div class="form-group">
										<label for="line2">결재선 선택(결재 순서에 맞춰 선택해 주세요)</label> <input type="text" class="form-control" data-target="#myModal" data-toggle="modal" id="line2" placeholder="결재선 선택" readonly="readonly" required="required">
										<input type="hidden" id="text2_emp_num2" name="emp_num2">
									</div>
									<div class="box-footer">
										<input type="submit" class="btn btn-block btn-primary" value="반차 신청"/>
									</div>
									<!-- /반차신청 폼 -->
								</form>
							</div>
						</div>
					</div>
					<div class="panel box box-default">
						<div class="box-header with-border">
							<h4 class="box-title">
								<a data-toggle="collapse" data-parent="#accordion"href="#collapseThree" class="collapsed" aria-expanded="false">지각 </a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse"aria-expanded="false" style="height: 0px;">
							<div class="box-body">
								<!-- 지각신청 폼 -->
								<form method="post" enctype="multipart/form-data" action="<c:url value="/requestAnn/3"/>">
									<input type="hidden" name="emp_num" value="${emp_num }" >
								<label for="timepickerMS1">일자/시간</label>
								<div class="col-md-12">
									<div class="col-md-5">
										<div class="form-group">
										<div class="input-group date">
											<div class="input-group-addon">
												<label for="datepicker2"> <i class="fa fa-calendar"></i>
												</label>
											</div>
											<input type="text" class="form-control pull-right" id="datepicker2" name="work_sdate">
										</div>
									</div>
									</div>

									<div class="col-md-5">

										<!-- time Picker -->
										<div class="bootstrap-timepicker">
											<div class="form-group">
												<div class="input-group">
													<input type="text" class="form-control timepicker" name="work_edate">

													<div class="input-group-addon">
														<i class="fa fa-clock-o"></i>출근
													</div>
												</div>
												<!-- /.input group -->
											</div>
											<!-- /.form group -->
										</div>
									</div>
								</div>

								<div class="form-group">
									<div>
										<label for="reason3">사유</label>
									</div>
									<textarea class="form-control" rows="3" placeholder="사유를 적으세요."id="reason3"name="work_content"></textarea>
								</div>
								<div class="form-group">
									<label for="exampleInputFile3">첨부</label> <input type="file"id="exampleInputFile3" name="file">
								</div>
								<div class="form-group">
									<label for="line3">결재선 선택(결재 순서에 맞춰 선택해 주세요)</label> <input type="text" class="form-control" data-target="#myModal" data-toggle="modal" id="line3" placeholder="결재선 선택" readonly="readonly" required="required">
										<input type="hidden" id="text3_emp_num2" name="emp_num2">
								</div>
								<div class="box-footer">
									<button type="submit" class="btn btn-block btn-primary">지각 신청</button>
								</div>
								<!-- /지각신청 폼 -->
								</form>
							</div>
						</div>
					</div>
					<div class="panel box box-default">
						<div class="box-header with-border">
							<h4 class="box-title">
								<a data-toggle="collapse" data-parent="#accordion"href="#collapseFour" class="collapsed" aria-expanded="false">야근 </a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse"aria-expanded="false" style="height: 0px;">
							<div class="box-body">
								<!-- 야근신청 폼 -->
								<form method="post" enctype="multipart/form-data" action="<c:url value="/requestAnn/4"/>">
									<input type="hidden" name="emp_num" value="${emp_num }" >
									<label>일자/시간</label>
									<div class="col-md-12">
										<div class="col-md-5">
											<div class="form-group">
											<div class="input-group date">
												<div class="input-group-addon">
													<label for="datepicker3"> <i class="fa fa-calendar"></i>
													</label>
												</div>
												<input type="text" class="form-control pull-right" id="datepicker2" name="work_sdate">
											</div>
										</div>
										</div>
	
										<div class="col-md-5">
	
											<!-- time Picker -->
											<div class="bootstrap-timepicker">
												<div class="form-group">
													<div class="input-group">
														<input type="text" class="form-control timepicker" name="work_edate">
	
														<div class="input-group-addon">
															<i class="fa fa-clock-o"></i>까지
														</div>
													</div>
													<!-- /.input group -->
												</div>
												<!-- /.form group -->
											</div>
										</div>
									</div>
	
									<div class="form-group">
										<div>
											<label for="reason4">사유</label>
										</div>
										<textarea class="form-control" rows="3" placeholder="사유를 적으세요."id="reason4" name="work_content"></textarea>
									</div>
									<div class="form-group">
										<label for="exampleInputFile4">첨부</label> <input type="file"id="exampleInputFile4" name="file">
									</div>
									<div class="form-group">
										<label for="line4">결재선 선택(결재 순서에 맞춰 선택해 주세요)</label> <input type="text" class="form-control" data-target="#myModal" data-toggle="modal" id="line4" placeholder="결재선 선택" readonly="readonly" required="required">
											<input type="hidden" id="text4_emp_num2" name="emp_num2">
									</div>
									<div class="box-footer">
										<input type="submit" class="btn btn-block btn-primary"value="야근 신청">
									</div>
									<!-- /야근신청 폼 -->
								</form>
								
							</div>
						</div>
					</div>
					<div class="panel box box-default">
						<div class="box-header with-border">
							<h4 class="box-title">
								<a data-toggle="collapse" data-parent="#accordion"href="#collapseFive" class="collapsed" aria-expanded="false">외근/출장/교육 </a>
							</h4>
						</div>
						<div id="collapseFive" class="panel-collapse collapse"aria-expanded="false" style="height: 0px;">
							<div class="box-body">
								<!-- 외근(출장)신청 폼 -->
							<form method="post" enctype="multipart/form-data" action="<c:url value="/requestAnn/5"/>">
								<input type="hidden" name="emp_num" value="${emp_num }">
								<input type="hidden" class="work_sdate" name="work_sdate">
								<input type="hidden" class="work_edate" name="work_edate">
								
								<label for="reservation2">일자/시간</label>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<label for="reservation2"> <i class="fa fa-calendar"></i>
											</label>
										</div>
										<input type="text" class="form-control pull-left"id="reservation2">
									</div>
									<!-- /.input group -->
								</div>
								<div class="form-group">
									<div>
										<label for="reason5">사유</label>
									</div>
									<textarea class="form-control" rows="3" placeholder="사유를 적으세요."id="reason5"name="work_content"></textarea>
								</div>
								<div class="form-group">
									<label for="exampleInputFile5">첨부</label> <input type="file"id="exampleInputFile5" name="file">
								</div>
								<div class="form-group">
									<label for="line5">결재선 선택(결재 순서에 맞춰 선택해 주세요)</label> <input type="text" class="form-control" data-target="#myModal" data-toggle="modal" id="line5" placeholder="결재선 선택" readonly="readonly" required="required">
										<input type="hidden" id="text5_emp_num2" name="emp_num2">
								</div>
								<div class="box-footer">
									<input type="submit" class="btn btn-block btn-primary" value="외근/출장/교육 신청">
								</div>
								<!-- /외근(출장)신청 폼 -->
								</form>
							</div>
						</div>
					</div>
					<!-- 경조사/기타 -->
					<div class="panel box box-default">
						<div class="box-header with-border">
							<h4 class="box-title">
								<a data-toggle="collapse" data-parent="#accordion"href="#collapseSix" class="collapsed" aria-expanded="false">경조사/기타 </a>
							</h4>
						</div>
						<div id="collapseSix" class="panel-collapse collapse"aria-expanded="false" style="height: 0px;">
							<div class="box-body">
								<!-- 외근(출장)신청 폼 -->
								<form method="post" enctype="multipart/form-data" action="<c:url value="/requestAnn/6"/>">
								<input type="hidden" name="emp_num" value="${emp_num }">
								<input type="hidden" class="work_sdate" name="work_sdate">
								<input type="hidden" class="work_edate" name="work_edate">
								<label for="reservation3">일자/시간</label>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<label for="reservation3"> <i class="fa fa-calendar"></i>
											</label>
										</div>
										<input type="text" class="form-control pull-left"id="reservation3">
									</div>
									<!-- /.input group -->
								</div>
								<div class="form-group">
									<div>
										<label for="reason5">사유</label>
									</div>
									<textarea class="form-control" rows="3" placeholder="사유를 적으세요."id="reason5" name="work_content"></textarea>
								</div>
								<div class="form-group">
									<label for="exampleInputFile6">첨부</label> <input type="file"id="exampleInputFile6" name="file">
								</div>
								<div class="form-group">
									<label for="line6">결재선 선택(결재 순서에 맞춰 선택해 주세요)</label> 
									<input type="text" class="form-control" data-target="#myModal" data-toggle="modal" id="line6" placeholder="결재선 선택" readonly="readonly" required="required">
										<input type="hidden" id="text6_emp_num2" name="emp_num2">
								</div>
								<div class="box-footer">
									<input type="submit" class="btn btn-block btn-primary" value="경조사/기타 신청">
								</div>
								<!-- /외근(출장)신청 폼 -->
								</form>
							</div>
						</div>
					</div>
					<!--  -->
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
	<!-- 아코디언 -->

	<h3 class="box-title">
		<span class="glyphicon glyphicon-list-alt"></span> 나의 신청 현황
	</h3>
	<div class="box">
		<div class="box-body">
			<div id="example1_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap">
				<div class="row">
					<div class="col-sm-12">
						<table id="table3" data-order='[[ 6, "desc" ]]'
							class="table table-bordered table-striped dataTable" role="grid"
							aria-describedby="example1_info">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0" aria-controls="example1"rowspan="1" colspan="1" aria-sort="ascending">신청번호</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">구분</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">날짜</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">시간</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">사유</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">첨부</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">신청일</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">상태</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">취소</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${wwlist }" var="wwl">
									<c:choose>
										<c:when test="${wwl.wtype_num==1 }">
											<c:set var="requestWorkType" value="연차"/>
											<!-- 연차시작날 ~ 연차끝나는날 -->
											<fmt:formatDate value="${wwl.work_sdate}" pattern="yyyy/MM/dd" var="wwSdate"/>
											<fmt:formatDate value="${wwl.work_edate}" pattern="yyyy/MM/dd" var="wwEdate"/>
											<c:set var="requestTerm" value="${wwSdate } - ${wwEdate }"/>
											<!-- 연차간격 계산하기 -->
											<fmt:parseDate var="parseSdate" value="${wwSdate }" pattern="yyyy/MM/dd" />
											<fmt:parseDate var="parseEdate" value="${wwEdate }" pattern="yyyy/MM/dd" />
											<fmt:parseNumber var="numSdate" value="${parseSdate.time/(1000*60*60*24) }" integerOnly="true"/>
											<fmt:parseNumber var="numEdate" value="${parseEdate.time/(1000*60*60*24) }" integerOnly="true"/>
											<c:set var="calDate" value="${numEdate-numSdate }일"/>
										</c:when>
										<c:when test="${wwl.wtype_num==2 }">
											<c:set var="requestWorkType" value="반차"/>
											<!-- 반차요청일 -->
											<fmt:formatDate value="${wwl.work_sdate}" pattern="yyyy/MM/dd" var="wwSdate"/>
											<c:set var="requestTerm" value="${wwSdate }"/>
											<!-- 반차구분(오전/오후) -->
											<fmt:formatDate value="${wwl.work_edate}" pattern="HHmm" var="wwEdate"/>
											<c:if test="${wwEdate==1201 }">
												<c:set var="calDate" value="0.5일(오후)"/>
											</c:if>
											<c:if test="${wwEdate==1159 }">
												<c:set var="calDate" value="0.5일(오전)"/>
											</c:if>
										</c:when>
										<c:when test="${wwl.wtype_num==3 }">
											<c:set var="requestWorkType" value="지각"/>
											<!-- 지각요청일 -->
											<fmt:formatDate value="${wwl.work_sdate}" pattern="yyyy/MM/dd" var="wwSdate"/>
											<c:set var="requestTerm" value="${wwSdate }"/>
											<fmt:formatDate value="${wwl.work_edate}" pattern="HH:mm" var="calDate"/>
										</c:when>
										<c:when test="${wwl.wtype_num==4 }">
											<c:set var="requestWorkType" value="야근"/>
											<!-- 야근요청일 -->
											<fmt:formatDate value="${wwl.work_sdate}" pattern="yyyy/MM/dd" var="wwSdate"/>
											<c:set var="requestTerm" value="${wwSdate }"/>
											<fmt:formatDate value="${wwl.work_edate}" pattern="HH:mm" var="calDate"/>
										</c:when>
										<c:when test="${wwl.wtype_num==5 }">
											<c:set var="requestWorkType" value="외근/출장/교육"/>
											<!-- 출장시작날 ~ 끝나는날 -->
											<fmt:formatDate value="${wwl.work_sdate}" pattern="yyyy/MM/dd" var="wwSdate"/>
											<fmt:formatDate value="${wwl.work_edate}" pattern="yyyy/MM/dd" var="wwEdate"/>
											<c:set var="requestTerm" value="${wwSdate } - ${wwEdate }"/>
											<!-- 출장간격 계산하기 -->
											<fmt:parseDate var="parseSdate" value="${wwSdate }" pattern="yyyy/MM/dd" />
											<fmt:parseDate var="parseEdate" value="${wwEdate }" pattern="yyyy/MM/dd" />
											<fmt:parseNumber var="numSdate" value="${parseSdate.time/(1000*60*60*24) }" integerOnly="true"/>
											<fmt:parseNumber var="numEdate" value="${parseEdate.time/(1000*60*60*24) }" integerOnly="true"/>
											<c:set var="calDate" value="${numEdate-numSdate }일"/>
										</c:when>
										<c:when test="${wwl.wtype_num==6 }">
											<c:set var="requestWorkType" value="경조사/기타"/>
											<!-- 경조사시작날 ~ 끝나는날 -->
											<fmt:formatDate value="${wwl.work_sdate}" pattern="yyyy/MM/dd" var="wwSdate"/>
											<fmt:formatDate value="${wwl.work_edate}" pattern="yyyy/MM/dd" var="wwEdate"/>
											<c:set var="requestTerm" value="${wwSdate } - ${wwEdate }"/>
											<!-- 경조사간격 계산하기 -->
											<fmt:parseDate var="parseSdate" value="${wwSdate }" pattern="yyyy/MM/dd" />
											<fmt:parseDate var="parseEdate" value="${wwEdate }" pattern="yyyy/MM/dd" />
											<fmt:parseNumber var="numSdate" value="${parseSdate.time/(1000*60*60*24) }" integerOnly="true"/>
											<fmt:parseNumber var="numEdate" value="${parseEdate.time/(1000*60*60*24) }" integerOnly="true"/>
											<c:set var="calDate" value="${numEdate-numSdate+1 }일"/>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${wwl.work_state==0 }">
											<c:set var="requestState" value="진행 중" />
											<c:set var="fontColor" value="green"/>
										</c:when>
										<c:when test="${wwl.work_state==1 }">
											<c:set var="requestState" value="승인"/>
											<c:set var="fontColor" value="blue"/>
										</c:when>
										<c:when test="${wwl.work_state==2 }">
											<c:set var="requestState" value="반려"/>
											<c:set var="fontColor" value="red"/>
										</c:when>
										<c:when test="${wwl.work_state==3 }">
											<c:set var="requestState" value="취소"/>
											<c:set var="fontColor" value="orange"/>
										</c:when>
									</c:choose>
									<tr role="row">
									<td class="sorting_1">${wwl.work_num}</td>
									<td>${requestWorkType }</td>
									<td>${requestTerm }</td>
									<td>${calDate }</td>
									<td>${wwl.work_content }</td>
									<td><a href="<c:url value='/file/download?wfile_num=${wwl.wfile_num}'/>">${wwl.wfile_orgfilename }</a></td>
									<td>
										<fmt:formatDate value="${wwl.work_regdate}" pattern="yyyy/MM/dd"/>
									</td>
									<td>
										<label style="color:${fontColor}" class="stateHv"  data-target="#myModal2" data-toggle="modal" onclick="mmm(${wwl.work_num})">${requestState }</label>
									</td>
									<td>
										<c:if test="${wwl.work_state==0 }">
											<input type="button" value="취소" class="btn btn-danger" onclick="c(${wwl.work_num})">
										</c:if>
									</td>
								</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th rowspan="1" colspan="1">신청번호</th>
									<th rowspan="1" colspan="1">구분</th>
									<th rowspan="1" colspan="1">날짜</th>
									<th rowspan="1" colspan="1">시간</th>
									<th rowspan="1" colspan="1">사유</th>
									<th rowspan="1" colspan="1">첨부</th>
									<th rowspan="1" colspan="1">신청일</th>
									<th rowspan="1" colspan="1">상태</th>
									<th rowspan="1" colspan="1">취소</th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- /.box-body -->
	</div>
	
	<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">조직도</h4>
					</div>
					<div class="modal-body" id="linecontent">
						<div id="jstree"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal" id="line_submit">저장</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">결재 진행상태</h4>
					</div>
					<div class="modal-body" id="linecontent">
						<table id="modal_table" data-order='[[ 0, "asc" ]]'>
							<thead>
								<tr>
									<th>결재 순서</th><th>부서</th><th>승인자</th><th>상태</th>
								</tr>
							</thead>
							
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" id="closeM">닫기</button>
					</div>
				</div>
			</div>
		</div>
		
	<script type="text/javascript">
	var tm = $("#modal_table").DataTable({
		searching:false,
		paging:false,
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
    		 }
        }
       
	});
	
	$(".stateHv").hover(function(){
		$(this).css("cursor","pointer");
	});
	function mmm(i){
		$.ajax({
			url:"<c:url value='/requestWork/searchWorkLine'/>",
			dataType:"json",
			data:{"work_num":i},
			success:function(data){
				tm.clear().draw();
				var state='';
				var fc='';
				var ban=0;
				var ss=0;
				for(var i=0;i<data.length;i++){
					if(data[i].wline_state==0){
						if(ban==0){
							if(ss==0){
								state='진행 중';
								fc='green';
								ss=1;
							}else{
								state='진행 전'
								fc='black';
							}
						}else{
							state='';
						}
					}else if(data[i].wline_state==1){
						if(ban==0){
							state='승인';
							fc='blue';
						}else{
							state='';
						}
					}else if(data[i].wline_state==2){
						state='반려';
						fc='red';
						ban=1;
					}
					tm.row.add([
						data[i].wline_level+'차',
						data[i].dept_name,
						data[i].emp_name+' '+data[i].pst_name,
						'<label style="color:'+fc+'">'+state+'</label>'
					]).draw(false);
				}
			},error:function(){alert("error");}
		});
	}
	
		$(function() {
			
			//날짜
			var nowDate = moment().format('YYYY/MM/DD');
			$("#nowDate").val(nowDate);
			//시간
			setInterval(function() {
				var nowTime = moment().format('HH:mm:ss');
				$("#nowTime").val(nowTime);
			}, 1000);
			
			//tree모달
			$("#line1,#line2,#line3,#line4,#line5,#line6").click(function() {
				$.ajax({
					url : "<c:url value='/sublinelist'/>",
					dataType : "json",
					success : function(data) {
						// 6 create an instance when the DOM is ready
						$('#jstree').jstree({
							"checkbox" : {
								"keep_selected_style" : false
							},
							"plugins" : [ "wholerow", "checkbox", "changed" ],
							'core' : {
								'data' : data
							//,'multiple':false
							}
						});
					}
				});
			});
			var arr1 = [];
			var idarr = [];
			$('#jstree').on('select_node.jstree Event', function(e, data) {
				var id = data.node.id;
				var name = data.node.text;
				//var arr=data.selected;
				arr1.push(name);
				idarr.push(id);
				console.log("arr1 : "+arr1);
				console.log("idarr : "+idarr);
			});

			//선택해제시 동작메소드
			$('#jstree').on('deselect_node.jstree Event', function(e, data) {
				var name = data.node.text;
				var arr = data.selected;
				for (var i = 0; i < arr1.length; i++) {
					if (arr1[i] === name) {
						arr1.splice(i, 1);
						idarr.splice(i, 1);
					}
				}
				console.log("arr1 : "+arr1);
				console.log("idarr : "+idarr);
			});
			$('#line_submit').click(function() {
						var lists="결재순서 : ";
						var emp_num2="";
						for (var i = 0; i < arr1.length; i++) {
							if(arr1.length==i+1){
								lists+=(i+1)+"차 "+arr1[i];
							}else{
								lists+=(i+1)+"차 "+arr1[i]+" > ";								
							}
							if(arr1.length==i+1){
								emp_num2+=idarr[i];
							}else{
								emp_num2+=idarr[i]+",";							
							}
						}
							$("#text_emp_num2,#text2_emp_num2,#text3_emp_num2,#text4_emp_num2,#text5_emp_num2,#text6_emp_num2").val(emp_num2);
							$('#line1,#line2,#line3,#line4,#line5,#line6').val(lists);
					});
		});
		//am pm edate2에 넣기
		$("#am").click(function(){
			$("#work_edate2").val("11:59");
		});
		$("#pm").click(function(){
			$("#work_edate2").val("12:01");
		});
		
		//daterangpicker 날짜 나누기
		$("#reservation,#reservation2,#reservation3").change(function(){
			var odate = $(this).val();
			$(".work_sdate").val(odate.substring(0,10));
			$(".work_edate").val(odate.substring(13,23));
		});
		//datepicker 날짜받기
		$("#datepicker").change(function(){
			var odate = $(this).val();
			$("#work_sdate2").val(odate);
			console.log($("#work_sdate2").val());
		});
		
		
		//출근버튼
		function workStart() {
			if ($("#text_workstart").val() == null
					|| $("#text_workstart").val() == '') {
				var result = confirm('출근하시겠습니까?');
				if (result) {
					var requestTime = moment().format('YYYY/MM/DD HH:mm');
					$("#real_workstart").val(requestTime);
					alert(requestTime + " 출근");

					var startTime = moment().format('HH:mm');
					$("#text_workstart").val(startTime);
					return true;
				} else {
					return false;
				}
			} else {
				alert("이미 출근하셨습니다.");
				return false;
			}
		};
		//퇴근버튼
		function workEnd() {
			if ($("#text_workstart").val() == null
					|| $("#text_workstart").val() == '') {
				alert("출근시간이 입력되지 않았습니다.");
				return false;
			} else {
				if ($("#text_workend").val() == null
						|| $("#text_workend").val() == '') {
					var result = confirm('퇴근하시겠습니까?');
					if (result) {
						var requestTime = moment().format('YYYY/MM/DD HH:mm');
						$("#real_workend").val(requestTime);
						var endTime = moment().format('HH:mm');
						$("#text_workend").val(endTime);
						alert(requestTime + " 퇴근");
						return true;
					} else {
						return false;
					}
				} else {
					alert("이미 퇴근하셨습니다.");
					return false;
				}
			}
		};
		
		//근태 취소버튼
		function c(i){
			var result = confirm("[취소하시겠습니까?]\n신청번호 : "+i+"번");
			if(result){
				$.getJSON("<c:url value='/requestWork/cancle'/>",{"work_num":i},function(data){
					if(data.result){
						location.reload();
					}else{
						alert("error");
					}
				});
			}
		}
	
		
	</script>
</div>

<!-- /.box-body -->
