<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div>
		<h3>
			<span class="glyphicon glyphicon-search"></span> 결재 요청 검색
		</h3>
		<div class="box">
			<!-- form start -->
			<form role="form" method="post" onsubmit="searchList2(event);" action="<c:url value='/responseWorkList/search'/>">
				<input type="hidden" value="${emp_num }" name="emp_num">
				
				<div class="box-footer">
					<div class="col-md-12">
						<button type="submit" class="btn btn-block btn-primary">간편조회</button>
					</div>
					
				</div>
			</form>
		</div>
		<h3 class="box-title">
			<span class="glyphicon glyphicon-list-alt"></span> 결재 요청 내역
		</h3>
		<div class="box">
			<div class="box-body">
				<div id="example1_wrapper"class="dataTables_wrapper form-inline dt-bootstrap">
					<div class="row">
						<div class="col-sm-12">
							<table id="table3"class="table table-bordered table-striped dataTable" role="grid"aria-describedby="example1_info">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0"aria-controls="example1" rowspan="1" colspan="1"aria-sort="ascending"></th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">신청 번호</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">사원 이름</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">구분</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">날짜</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">시간</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">사유</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">첨부</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">신청일</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">승인/반려</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.box-body -->
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
						<input type="button" id="sbtn" class="btn btn-primary" value="승인"data-dismiss="modal" onclick="">
						<input type="button" id="bbtn" class="btn btn-danger" value="반려"data-dismiss="modal" onclick="">
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
	function mmm(i,row,wline_num){
		$.ajax({
			url:"<c:url value='/requestWork/searchWorkLine'/>",
			dataType:"json",
			data:{"work_num":i},
			success:function(data){
				tm.clear().draw();
				var state='';
				var fc='';
				ban=0;
				ss=0;
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
					}
					tm.row.add([
						data[i].wline_level+'차',
						data[i].dept_name,
						data[i].emp_name+' '+data[i].pst_name,
						'<label style="color:'+fc+'">'+state+'</label>'
					]).draw(false);
					$("#sbtn").attr('onclick','s('+row+','+wline_num+')');
					$("#bbtn").attr('onclick','b('+row+','+wline_num+')');
				}
			},error:function(){alert("error");}
		});
	}
	
	var t3='';
	 
	function searchList2(event){
		t3 = $("#table3").DataTable();
		t3.clear().draw();
		event.preventDefault();
		  var str = $( "form" ).serialize();
		$.ajax({
			url:"<c:url value='/responseWorkList/search'/>",
			dataType:"json",
			data:str,
			
			success:function(data){
				
				var wn;
				var wn2;
				console.log("data.length : "+data.length);
				for(var i=0;i<data.length;i++){
					if(data[i].wline_state=='0'){
						wn2='진행중';	
					}else if(data[i].wline_state=='1'){
						wn2='승인';
					}
					t3.row.add([
						'',
						data[i].wline_num,
						data[i].emp_name,
						data[i].wtype,
						data[i].term,
						data[i].caldate,
						data[i].work_content,
						'<a href="<c:url value="/file/download?wfile_num='+data[i].wfile_num+'"/>">'+data[i].wfile_orgfilename+'</a>',
						data[i].regdate,
						'<input type="button" class="btn btn-success" value="승인상태" data-target="#myModal2" data-toggle="modal" onclick="mmm('+data[i].work_num+','+i+','+data[i].wline_num+')">'
					]).draw(false);
				}
			},error:function(){	alert("error");	}
		});
			return false;
		};
		
	function s(i,wline_num){
		var rowdata = t3.rows(i).data();
		console.log("wline_num : "+wline_num);
		var result = confirm("[승인하시겠습니까?]\n"+"신청번호 : "+rowdata[0][1]+"\n사원이름 : "+rowdata[0][2]+"\n구분 : "+rowdata[0][3]+"\n날짜 : "+rowdata[0][4]+
				"\n시간 : "+rowdata[0][5]+"\n사유 : "+rowdata[0][6]+"\n신청일 : "+rowdata[0][8]);
		if(result){
			$.getJSON("<c:url value='/responseWorkList/accept'/>",{"wline_num":wline_num},function(data){
				if(data.result){
					searchList2(event);
				}else{
					alert("error");
				}
			});
		}
	}
	
	function b(i,wline_num){
		var rowdata = t3.rows(i).data();
		console.log("wline_num : "+wline_num);
		var result = confirm("[반려하시겠습니까?]\n"+"신청번호 : "+rowdata[0][1]+"\n사원이름 : "+rowdata[0][2]+"\n구분 : "+rowdata[0][3]+"\n날짜 : "+rowdata[0][4]+
				"\n시간 : "+rowdata[0][5]+"\n사유 : "+rowdata[0][6]+"\n신청일 : "+rowdata[0][8]);
		if(result){
			$.getJSON("<c:url value='/responseWorkList/unaccept'/>",{"wline_num":wline_num},function(data){
				if(data.result){
					searchList2(event);
				}else{
					alert("error");
				}
			});
		}
	}
	
	//daterangpicker 날짜 나누기
	$("#reservation3").change(function(){
		var odate = $(this).val();
		$(".work_sdate").val(odate.substring(0,10));
		$(".work_edate").val(odate.substring(13,23));
	});
	
	
	</script>
</div>
