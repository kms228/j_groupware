<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div>
		<h3>
			<span class="glyphicon glyphicon-search"></span> 승인 요청 검색
		</h3>
		<div class="box">
			<!-- form start -->
			<form role="form" method="post" onsubmit="searchList2(event);" action="<c:url value='/responseWorkList/search'/>">
				<input type="text" class="work_sdate" name="work_sdate">
				<input type="text" class="work_edate" name="work_edate">
				<input type="text" value="${emp_num }" name="emp_num">
				<div class="box-body">
					<div class="form-group">
						<label for="select3">구분</label>
						<div class="form-group">
							<select class="form-control" id="select3" name="wtype_num">
								<option value="0">전체</option>
								<c:forEach items="${wlist }" var="wlist">
									<option value="${wlist.wtype_num }">${wlist.wtype_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="reservation3">조회기간</label>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control pull-left"id="reservation3">
							</div>
							<!-- /.input group -->
						</div>
					</div>
					<div class="form-group">
						<label for="line1">사용자</label> 
						<input type="text"class="form-control" readonly="readonly" id="line1" data-target="#myModal" data-toggle="modal">
						<input type="hidden" id="text_emp_num2" name="emp_num2">
					</div>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">
					<div class="col-md-6">
						<button type="submit" class="btn btn-block btn-primary">조회</button>
					</div>
					<div class="col-md-6">
						<button type="reset" class="btn btn-block btn-danger">초기화</button>
					</div>
				</div>
			</form>
		</div>
		<h3 class="box-title">
			<span class="glyphicon glyphicon-list-alt"></span> 승인 요청 내역
		</h3>
		<div class="box">

			<div class="box-body">
				<div id="example1_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap">
					<div class="row">
						<div class="col-sm-12">
							<table id="table3"
								class="table table-bordered table-striped dataTable" role="grid"
								aria-describedby="example1_info">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0"aria-controls="example1" rowspan="1" colspan="1"aria-sort="ascending">신청 번호</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">사원 이름</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">구분</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">날짜</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">시간</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">사유</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">첨부</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">신청일</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="rlist" items="${rlist }">
										<c:choose>
											<c:when test="${rlist.wtype_num=='1' }">
												<c:set var="wn" value="연차"/>
											</c:when>
											<c:when test="${rlist.wtype_num=='2' }">
												<c:set var="wn" value="반차"/>
											</c:when>
											<c:when test="${rlist.wtype_num=='3' }">
												<c:set var="wn" value="지각"/>
											</c:when>
											<c:when test="${rlist.wtype_num=='4' }">
												<c:set var="wn" value="야근"/>
											</c:when>
											<c:when test="${rlist.wtype_num=='5' }">
												<c:set var="wn" value="외근/출장/교육"/>
											</c:when>
											<c:when test="${rlist.wtype_num=='6' }">
												<c:set var="wn" value="경조사/기타"/>
											</c:when>
										</c:choose>
										<tr>
											<td>${rlist.work_num }</td>
											<td>${rlist.emp_name }</td>
											<td>${wn}</td>
											<td>${rlist.term }</td>
											<td>${rlist.caldate }</td>
											<td>${rlist.work_content }</td>
											<td>${rlist.wfile_orgfilename }</td>
											<td>${rlist.work_regdate }</td>
											<td>진행중</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<th rowspan="1" colspan="1"></th>
										<th rowspan="1" colspan="1">사원 이름</th>
										<th rowspan="1" colspan="1">구분</th>
										<th rowspan="1" colspan="1">날짜</th>
										<th rowspan="1" colspan="1">시간</th>
										<th rowspan="1" colspan="1">사유</th>
										<th rowspan="1" colspan="1">첨부</th>
										<th rowspan="1" colspan="1">신청일</th>
										<th rowspan="1" colspan="1">상태</th>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.box-body -->
			<div class="box-footer">
				<div class="col-md-6">
					<button type="submit" class="btn btn-block btn-primary">승인</button>
				</div>
				<div class="col-md-6">
					<button type="reset" class="btn btn-block btn-danger">반려</button>
				</div>
			</div>
		</div>
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
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal" id="line_submit">Save changes</button>
					</div>
				</div>
			</div>
		</div>
	<script type="text/javascript">
	$(function(){
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
					var lists="";
					var emp_num2="";
					for (var i = 0; i < arr1.length; i++) {
						if(arr1.length==i+1){
							lists+=arr1[i];
						}else{
							lists+=arr1[i]+", ";								
						}
						if(arr1.length==i+1){
							emp_num2+=idarr[i];
						}else{
							emp_num2+=idarr[i]+",";							
						}
					}
						$("#text_emp_num2").val(emp_num2);
						$('#line1').val(lists);
				});
		
	});
	
	function searchList2(event){
		event.preventDefault();
		  var str = $( "form" ).serialize();
		$.ajax({
			url:"<c:url value='/requestWorkList/search'/>",
			dataType:"json",
			data:str,
			success:function(data){
				var t1 = $("#table1").DataTable();
				t1.clear();
				var wn;
				for(var i=0;i<data.length;i++){
					if(data[i].wtype_num=='1'){
						wn='연차';
					}else if(data[i].wtype_num=='2'){
						wn='반차';
					}else if(data[i].wtype_num=='3'){
						wn='지각';
					}else if(data[i].wtype_num=='4'){
						wn='야근';
					}else if(data[i].wtype_num=='5'){
						wn='외근/출장/교육';
					}else if(data[i].wtype_num=='6'){
						wn='경조사/기타';
					}
					if(data[i].work_state==0){
						t2.row.add([
							data[i].work_num,
							data[i].emp_name,
							wn,
							data[i].term,
							data[i].caldate,
							data[i].work_content,
							data[i].wfile_orgfilename,
							data[i].work_regdate,
							'진행중'
						]).draw(false);
					}else if(data[i].work_state==1){
						t1.row.add([
							data[i].work_num,
							data[i].emp_name,
							wn,
							data[i].term,
							data[i].caldate,
							data[i].work_content,
							data[i].wfile_orgfilename,
							data[i].work_regdate,
							'승인'
						]).draw(false);
					}else if(data[i].work_state==2){
						t3.row.add([
							data[i].work_num,
							data[i].emp_name,
							wn,
							data[i].term,
							data[i].caldate,
							data[i].work_content,
							data[i].wfile_orgfilename,
							data[i].work_regdate,
							'반려'
						]).draw(false);
					}else if(data[i].work_state==3){
						t4.row.add([
							data[i].work_num,
							data[i].emp_name,
							wn,
							data[i].term,
							data[i].caldate,
							data[i].work_content,
							data[i].wfile_orgfilename,
							data[i].work_regdate,
							'취소'
						]).draw(false);
					}
				}
			},error:function(){
				alert("error");
			}
		});
		return false;
	};
	
	
	//daterangpicker 날짜 나누기
	$("#reservation3").change(function(){
		var odate = $(this).val();
		$(".work_sdate").val(odate.substring(0,10));
		$(".work_edate").val(odate.substring(13,23));
	});
	$("input[type=reset]").click(function(){
		$(".work_sdate").val("");
		$(".work_edate").val("");
	});
	</script>
</div>
