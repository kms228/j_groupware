<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div>
	<h3>
		<span class="glyphicon glyphicon-cog"></span> 근태 설정
	</h3>
	<div class="box">
		<div class="box-body">
			<!-- Custom Tabs -->
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab_1" data-toggle="tab"
						aria-expanded="true">기본 설정</a></li>
					<li class=""><a href="#tab_2" data-toggle="tab"
						aria-expanded="false">기능 설정</a></li>
					<li class=""><a href="#tab_3" data-toggle="tab"
						aria-expanded="false">관리자 설정</a></li>
					<li class=""><a href="#tab_4" data-toggle="tab"
						aria-expanded="false">사원 연차 설정</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab_1">
						<!--  -->
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">
									<span class="glyphicon glyphicon-time"></span> 시간 설정
								</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">

								<!-- 출퇴근 반차 폼set -->
								<form method="post" action="<c:url value='/updateWorkTime'/>">
									<table class="table table-hover">
										<tbody>
											<tr>
												<th>출/퇴근 시간</th>
												<td>
													<div class="col-md-6">
														<div class="input-group">
															<div class="input-group-btn">
																<button type="button" class="btn btn-primary">출근</button>
															</div>
															<!-- /btn-group -->
															<div class="bootstrap-timepicker">
																<div class="input-group">
																	<input type="text" class="form-control timepicker"
																		name="wtime_start" id="start1"
																		value="<fmt:formatDate value="${wVo.wtime_start}" pattern="HH:mm"/>">
																	<div class="input-group-addon">
																		<i class="fa fa-clock-o"></i>
																	</div>
																</div>
																<!-- /.input group -->
																<!-- /.form group -->
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<div class="input-group">
															<div class="input-group-btn">
																<button type="button" class="btn btn-danger">퇴근</button>
															</div>
															<!-- /btn-group -->
															<div class="bootstrap-timepicker">
																<div class="input-group">
																	<input type="text" class="form-control timepicker"
																		name="wtime_end"
																		value="<fmt:formatDate value="${wVo.wtime_end}" pattern="HH:mm"/>">
																	<div class="input-group-addon">
																		<i class="fa fa-clock-o"></i>
																	</div>
																</div>
																<!-- /.input group -->
															</div>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th>반차 시간(오전)</th>
												<td>
													<div class="col-md-6">
														<div class="input-group">
															<div class="input-group-btn">
																<button type="button" class="btn">오전</button>
															</div>
															<!-- /btn-group -->
															<div class="bootstrap-timepicker">
																<div class="input-group">
																	<input type="text" class="form-control timepicker"
																		name="htime_start"
																		value="<fmt:formatDate value="${hVo.htime_start}" pattern="HH:mm"/>">
																	<div class="input-group-addon">
																		<i class="fa fa-clock-o"></i>
																	</div>
																</div>
																<!-- /.input group -->
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<div class="input-group">
															<div class="input-group-btn">
																<button type="button" class="btn">오전</button>
															</div>
															<!-- /btn-group -->
															<div class="bootstrap-timepicker">
																<div class="input-group">
																	<input type="text" class="form-control timepicker"
																		name="htime_end"
																		value="<fmt:formatDate value="${hVo.htime_end}" pattern="HH:mm"/>">
																	<div class="input-group-addon">
																		<i class="fa fa-clock-o"></i>
																	</div>
																</div>
																<!-- /.input group -->
															</div>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th>반차 시간(오후)</th>
												<td>
													<div class="col-md-6">
														<div class="input-group">
															<div class="input-group-btn">
																<button type="button" class="btn">오후</button>
															</div>
															<!-- /btn-group -->
															<div class="bootstrap-timepicker">
																<div class="input-group">
																	<input type="text" class="form-control timepicker"
																		name="htime_start2"
																		value="<fmt:formatDate value="${hVo.htime_start2}" pattern="HH:mm"/>">
																	<div class="input-group-addon">
																		<i class="fa fa-clock-o"></i>
																	</div>
																</div>
																<!-- /.input group -->
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<div class="input-group">
															<div class="input-group-btn">
																<button type="button" class="btn">오후</button>
															</div>
															<!-- /btn-group -->
															<div class="bootstrap-timepicker">
																<div class="input-group">
																	<input type="text" class="form-control timepicker"
																		name="htime_end2"
																		value="<fmt:formatDate value="${hVo.htime_end2}" pattern="HH:mm"/>">
																	<div class="input-group-addon">
																		<i class="fa fa-clock-o"></i>
																	</div>
																</div>
																<!-- /.input group -->
															</div>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<br>
									<div class="box-footer">
										<input type="submit" value="저장"
											class="btn btn-block btn-primary">
									</div>

								</form>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->


					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_2">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">
									<span class="glyphicon glyphicon-wrench"></span> 기능 설정
								</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">
								<form>
									<table class="table table-hover">
										<tbody>
											<tr>
												<th>출/퇴근 기능</th>
												<td>
													<div class="checkbox">
														<label><input type="checkbox">출/퇴근 허용IP 설정
														</label> <a href="#"><i class="fa fa-gears"></i></a>
													</div>

												</td>
											</tr>
											<tr>
												<th>로그인 기능</th>
												<td>
													<div class="checkbox">
														<label><input type="checkbox">로그인시 출근 자동
															등록 </label>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="box-footer">
										<input type="submit" value="저장"
											class="btn btn-block btn-primary">
									</div>
								</form>
							</div>
							<!-- /.box-body -->
						</div>

					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_3">

						<div class="box">
							<div class="box-header">
								<h3 class="box-title">
									<span class="glyphicon glyphicon-user"></span> 관리자 설정
								</h3>

								<div class="box-tools">
									<div class="input-group input-group-sm" style="width: 150px;">
										<input type="text" name="table_search"
											class="form-control pull-right" placeholder="관리자선택"
											id="line1" data-target="#myModal" data-toggle="modal"
											readonly="readonly"> <input type="hidden"
											id="text_emp_num2" name="emp_num2">

										<div class="input-group-btn">
											<button type="submit" class="btn btn-default">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">
								<form>
									<table class="table table-hover" id="adminTable">
										<tbody>
											<tr>
												<th>계정번호</th>
												<th>이름</th>
												<th>부서</th>
												<th>직위</th>
												<th>삭제</th>
											</tr>
											<c:forEach items="${adminVo }" var="adminVo">
												<c:choose>
													<c:when test="${adminVo.pst_name=='사장' }">
														<c:set var="spanC" value="label label-danger" />
													</c:when>
													<c:when test="${adminVo.pst_name=='부장' }">
														<c:set var="spanC" value="label label-primary" />
													</c:when>
													<c:when test="${adminVo.pst_name=='차장' }">
														<c:set var="spanC" value="label label-success" />
													</c:when>
													<c:when test="${adminVo.pst_name=='과장' }">
														<c:set var="spanC" value="label label-warning" />
													</c:when>
													<c:otherwise>
														<c:set var="spanC" value="label label-default" />
													</c:otherwise>
												</c:choose>
												<tr>
													<td>${adminVo.acnt_num }</td>
													<td>${adminVo.emp_name }</td>
													<td>${adminVo.dept_name }</td>
													<td><span class="${spanC }">${adminVo.pst_name }</span></td>
													<td><input type="button" class="btn btn-danger"
														value="삭제" onclick="delAdmin(${adminVo.acnt_num})"></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
								<div class="box-footer">
									<input type="button" value="관리자 추가"
										class="btn btn-block btn-primary" onclick="saveAdmin()">
								</div>
							</div>
							<!-- /.box-body -->
						</div>

					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_4">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">
									<span class="glyphicon glyphicon-search"></span> 연차 검색
								</h3>
							</div>
							<div class="box-body">
								<label for="select3">부서</label>
								<div class="form-group">
									<select class="form-control" id="select3" name="dept_num">
										<option value="100">전체</option>
										<c:forEach items="${deptVo }" var="dVo">
											<option value="${dVo.DEPT_NUM }">${dVo.DEPT_NAME }</option>
										</c:forEach>
									</select>
								</div>
								<label>기간</label>
								<div id="div_search_month">
									<span class="glyphicon glyphicon-chevron-left" id="clickL"
										onclick="clickL()"></span> <input type="text" id="nowDate"
										name="ann_ann"> <span
										class="glyphicon glyphicon-chevron-right" id="clickR"
										onclick="clickR()"></span>
								</div>
							</div>
						</div>
						<form method="post">
							<div class="box">
								<div class="box-header">
									<h3 class="box-title">
										<span class="glyphicon glyphicon-sunglasses"></span> 사원 연차 설정
									</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<div id="example1_wrapper"
										class="dataTables_wrapper form-inline dt-bootstrap">
										<div class="row">
											<div class="col-sm-12">
												<table id="example1"
													class="table table-bordered table-striped dataTable"
													role="grid" aria-describedby="example1_info">
													<thead>
														<tr role="row">
															<th class="sorting_asc" tabindex="0"
																aria-controls="example1" rowspan="1" colspan="1">연차
																번호</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">부서명</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">사원 이름</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">사원 아이디</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">사용일</th>
															<th class="sorting" tabindex="0" aria-controls="example1"
																rowspan="1" colspan="1">총 연차 일수</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${annVo }" var="annVo"
															varStatus="status">
															<tr role="row">
																<td class="sorting_1">${annVo.ann_num }</td>
																<td>${annVo.dept_name }</td>
																<td>${annVo.emp_name }</td>
																<td>${annVo.acnt_id }</td>
																<td>${annVo.ann_use }</td>
																<td><input type="text" value="${annVo.ann_total }"
																	id='totalinfo${status.index }'> <c:choose>
																		<c:when test="${annVo.ann_total==0 }">
																			<input type="button" class="btn btn-warning"
																				value="등록"
																				onclick="upd(${status.index},'totalinfo${status.index }')">
																		</c:when>
																		<c:otherwise>
																			<input type="button" class="btn btn-primary"
																				value="수정"
																				onclick="upd(${status.index},'totalinfo${status.index }')">
																		</c:otherwise>
																	</c:choose></td>
															</tr>
														</c:forEach>
													</tbody>
													<tfoot>
														<tr>
															<th rowspan="1" colspan="1">연차 번호</th>
															<th rowspan="1" colspan="1">부서명</th>
															<th rowspan="1" colspan="1">사원 이름</th>
															<th rowspan="1" colspan="1">사원 아이디</th>
															<th rowspan="1" colspan="1">사용일</th>
															<th rowspan="1" colspan="1">총 연차 일수</th>
														</tr>
													</tfoot>
												</table>
											</div>
										</div>
									</div>
								</div>
								<!-- /.box-body -->
							</div>
						</form>

					</div>
					<!-- /.tab-pane -->
				</div>
				<!-- /.tab-content -->
			</div>
			<!-- nav-tabs-custom -->
		</div>
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">조직도</h4>
					</div>
					<div class="modal-body" id="linecontent">
						<div id="jstree"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							id="line_submit">추가</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	var arr1;
	var idarr;
	var admin_num;
		$(function() {
			//날짜
			var nowDate = moment().format('YYYY');
			$("#nowDate").val(nowDate);
			
			//tree모달
			$("#line1").click(function() {
				$.ajax({
					url : "<c:url value='/sublinelist'/>",
					dataType : "json",
					success : function(data) {
						// 6 create an instance when the DOM is ready
						$('#jstree').jstree({
							"checkbox" : {
								"keep_selected_style" : false
							},
							"plugins" : [ "wholerow", "changed" ],
							'core' : {
								'data' : data
							//,'multiple':false
							}
						});
					}
				});
			});
			
			$('#jstree').on('select_node.jstree Event', function(e, data) {
				var id = data.node.id;
				var name = data.node.text;
				var arr=data.selected;
				arr1=name;
				idarr=id;
				console.log("arr : "+arr);
				console.log("arr1 : "+arr1);
				console.log("idarr : "+idarr);
			});
			
			$('#line_submit').click(function() {
				$("#text_emp_num2").val(idarr);
				$('#line1').val(arr1);
				admin_num=idarr;
				$("#adminTable").last().append('<tr><td></td><td>'+arr1+'</td></tr>');
			});	
		});
		
		
		
		//관리자저장
		function saveAdmin(){
			$.ajax({
				url:"<c:url value='/updateAdmin2'/>",
				dataType:"json",
				data:{"emp_num":admin_num},
				success:function(data){
					var spanC='';
					$("#adminTable > tbody:last > tr:last").remove();
					if(data.pst_name=='사장'){
						spanC='label label-danger';
					}else if(data.pst_name=='부장'){
						spanC='label label-primary';
					}else if(data.pst_name=='차장'){
						spanC='label label-success';
					}else if(data.pst_name=='과장'){
						spanC='label label-warning';
					}else{
						spanC='label label-default';
					}
					
					$("#adminTable").last().append('<tr><td>'+data.acnt_num+'</td><td>'+data.emp_name+'</td><td>'
							+data.dept_name+'</td><td><span class="'+spanC+'">'+data.pst_name+'</span></td><td><input type="button" class="btn btn-danger" value="삭제" onclick="delAdmin('+data.acnt_num+')"></td></tr>');
				},error:function(){
					alert("관리자 선택 후 추가하시오.");
				}
			});
		}
		
		//사원연차 불러오기 ajax
		function goAjax(){
			var ex = $("#example1").DataTable();
			var ann_ann = $("#nowDate").val();
			var dept_num =$("#select3").val();
			console.log("ann_ann : "+ann_ann+", dept_num : "+dept_num);
			
			var str={"ann_ann":ann_ann,"dept_num":dept_num}
			var btn='';
			var btnC='';
			$.ajax({
				url:"<c:url value='/searchAnn'/>",
				dataType:"json",
				data:str,
				success:function(data){
					ex.clear().draw();
					for(var i=0;i<data.length;i++){
						if(data[i].ann_total==0){
							btn='등록';
							btnC='btn btn-warning';
						}else{
							btn='수정';
							btnC='btn btn-primary';
						}
						ex.row.add([
							data[i].ann_num,
							data[i].dept_name,
							data[i].emp_name,
							data[i].acnt_id,
							data[i].ann_use,
							'<input type="text" value="'+data[i].ann_total+'" id="totalinfo'+i+'">'
							+'<input type="button" class="'+btnC+'" value="'+btn+'" onclick="upd('+i+',\'totalinfo'+i+'\')">'
						]).draw(false);
					}
				}
			});
		}
		
		function upd(i,id){
			var ex = $("#example1").DataTable();
			var rowdata = ex.rows(i).data();
			
			var ann_num=rowdata[0][0];
			var ann_total=$("#"+id).val();
			console.log("ann_num : "+rowdata[0][0]+", ann_total : "+ann_total);
			
			$.getJSON("<c:url value='/updateAnn'/>",{"ann_num":ann_num,"ann_total":ann_total},function(data){
				if(data.result){
					goAjax();
				}else{
					alert("error");
				}
			});
		}
		
		function clickL(){
			var ex = $("#example1").DataTable();
			var ann_ann = $("#nowDate").val()-1;
			$("#nowDate").val(ann_ann);
			goAjax();
			
			
		}
		function clickR(){
			var ann_ann = parseInt($("#nowDate").val()) + 1;
			$("#nowDate").val(ann_ann);
			goAjax();
		}
		
		$("#select3").change(function(){
			goAjax();
		});
		
		function delAdmin(acnt_num){
			$.ajax({
				url:"<c:url value='/delAdmin'/>",
				dataType:"json",
				data:{"acnt_num":acnt_num},
				success:function(data){
					var tr='';
					for(var i=0;i<data.length;i++){
						var spanC='';
						$("#adminTable").empty();
						if(data[i].pst_name=='사장'){
							spanC='label label-danger';
						}else if(data[i].pst_name=='부장'){
							spanC='label label-primary';
						}else if(data[i].pst_name=='차장'){
							spanC='label label-success';
						}else if(data[i].pst_name=='과장'){
							spanC='label label-warning';
						}else{
							spanC='label label-default';
						}
						tr+='<tr><td>'+data[i].acnt_num+'</td><td>'+data[i].emp_name+'</td><td>'
						+data[i].dept_name+'</td><td><span class="'+spanC+'">'+data[i].pst_name+'</span></td><td><input type="button" class="btn btn-danger" value="삭제" onclick="delAdmin('+data[i].acnt_num+')"></td></tr>'
						
					}
						$("#adminTable").last().append(tr);
					
				}
			
		
			});
		}
	</script>

</div>

