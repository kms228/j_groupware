<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div>
		<h3>
			<span class="glyphicon glyphicon-search"></span> 전체 리스트
		</h3>
		<div class="box">
			<!-- form start -->
			<form role="form" method="post" action="<c:url value="workList/search"/>" onsubmit="searchList(event);">
				<input type="hidden" class="work_sdate" name="work_sdate"> 
				<input type="hidden" class="work_edate" name="work_edate"> 
				<input type="hidden" value="${emp_num }" name="emp_num">
				
				<div class="box-body">
				<label for="select3">구분</label>
					<div class="form-group">
							<select class="form-control" id="select3" name="wtype_num">
								<option value="0">전체</option>
								<c:forEach items="${wlist }" var="wVo">
									<option value="${wVo.wtype_num }">${wVo.wtype_name }</option>
								</c:forEach>
							</select> 
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
						<input type="submit" class="btn btn-block btn-primary" value="조회">
					</div>
					<div class="col-md-6">
						<input type="reset" class="btn btn-block btn-danger" value="초기화">
					</div>
				</div>
			</form>
		</div>
		
		<!-- 신청내역 -->
		<div  id="work_list_pop2">
			<h3 class="box-title">
				<span class="glyphicon glyphicon-list-alt"></span> 신청 검색 내역
			</h3>
			<div class="box">

				<div class="box-body">
					<div id="example1_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap">
						<div class="row">
							<div class="col-sm-12">
								<table id="table2"class="table table-bordered table-striped dataTable"role="grid" aria-describedby="example1_info">
									<thead>
										<tr role="row">
											<th class="sorting_asc" tabindex="0" aria-controls="example1"
												rowspan="1" colspan="1" aria-sort="ascending">번호</th>
											<th class="sorting" tabindex="0" aria-controls="example1"
												rowspan="1" colspan="1">사원 이름</th>
											<th class="sorting" tabindex="0" aria-controls="example1"
												rowspan="1" colspan="1">구분</th>
											<th class="sorting" tabindex="0" aria-controls="example1"
												rowspan="1" colspan="1">날짜</th>
											<th class="sorting" tabindex="0" aria-controls="example1"
												rowspan="1" colspan="1">시간</th>
											<th class="sorting" tabindex="0" aria-controls="example1"
												rowspan="1" colspan="1">사유</th>
											<th class="sorting" tabindex="0" aria-controls="example1"
												rowspan="1" colspan="1">첨부</th>
											<th class="sorting" tabindex="0" aria-controls="example1"
												rowspan="1" colspan="1">신청일</th>
											<th class="sorting" tabindex="0" aria-controls="example1"
												rowspan="1" colspan="1">상태</th>
										</tr>
									</thead>

									<tfoot>
										<tr>
											<th rowspan="1" colspan="1">번호</th>
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
						<label style="display:none; color: red;text-align: center" id="wline_content"></label>
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
			info:false,
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
		$(function() {
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
		
		function searchList(event){
			var t2 = $("#table2").DataTable();
			t2.clear().draw();
			event.preventDefault();
			  var str = $( "form" ).serialize();
			$.ajax({
				url:"<c:url value='/requestWorkList/search'/>",
				dataType:"json",
				data:str,
				success:function(data){
					
					var wn;
					var wn2;
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
						
						if(data[i].work_state=='0'){
							wn2='<label style="color: green" data-target="#myModal2" data-toggle="modal" onclick="mmm('+data[i].work_num+')" class="stateH">진행중</label>';
						}else if(data[i].work_state=='1'){
							wn2='<label style="color: blue" data-target="#myModal2" data-toggle="modal" onclick="mmm('+data[i].work_num+')" class="stateH">승인</label>';
						}else if(data[i].work_state=='2'){
							wn2='<label style="color: red" data-target="#myModal2" data-toggle="modal" onclick="mmm('+data[i].work_num+')" class="stateH">반려</label>';
						}else if(data[i].work_state=='3'){
							wn2='<label style="color: orange" data-target="#myModal2" data-toggle="modal" onclick="mmm('+data[i].work_num+')" class="stateH">취소</label>';
						}
						t2.row.add([
							data[i].work_num,
							data[i].emp_name,
							wn,
							data[i].term,
							data[i].caldate,
							data[i].work_content,
							data[i].wfile_orgfilename,
							data[i].regdate,
							wn2
						]).draw(false);
					}
					$(".stateH").hover(function(){
						$(this).css("cursor","pointer");
					});
				},error:function(){
					alert("error");
				}
			});
			return false;
		};
		$("input[type=reset]").click(function(){
			$(".work_sdate").val("");
			$(".work_edate").val("");
			$("#text_emp_num2").val("");
		});
		//결재승인상태 확인하기
		function mmm(i){
			$.ajax({
				url:"<c:url value='/requestWork/searchWorkLine'/>",
				dataType:"json",
				data:{"work_num":i},
				success:function(data){
					tm.clear().draw();
					var ban=0;
					var state='';
					var fc='';
					var ss=0;
					var content='';
					var display='';
					for(var i=0;i<data.length;i++){
						if(data[i].wline_state==0){
							if(ban==0){
								if(ss==0){
									state='진행 중';
									fc='green';
									ss=1;								
								}else{
									state='진행 전';
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
							content='반려사유 : '+data[i].wline_content;
							display="block"
						}
						tm.row.add([
							data[i].wline_level+'차',
							data[i].dept_name,
							data[i].emp_name+' '+data[i].pst_name,
							'<label style="color:'+fc+'">'+state+'</label>'
						]).draw(false);
						//반려사유 넣기
						$("#wline_content").html(content);
						$("#wline_content").css('display',display);
					}
				},error:function(){alert("error");}
			});
		}
	</script>
</div>

<!--

//-->

