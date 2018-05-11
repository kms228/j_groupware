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
				<input type="hidden" value="${emp_num }" name="emp_num">
				
				<div class="box-footer">
					<div class="col-md-12">
						<button type="submit" class="btn btn-block btn-primary">간편조회</button>
					</div>
					
				</div>
			</form>
		</div>
		<h3 class="box-title">
			<span class="glyphicon glyphicon-list-alt"></span> 승인 요청 내역
		</h3>
		<div class="box">
			<div class="box-body">
				<div id="example1_wrapper"class="dataTables_wrapper form-inline dt-bootstrap">
					<div class="row">
						<div class="col-sm-12">
							<table id="table3"class="table table-bordered table-striped dataTable" role="grid"aria-describedby="example1_info">
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
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">승인</th>
										<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">반려</th>
									</tr>
								</thead>
								
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
										<th rowspan="1" colspan="1">승인</th>
										<th rowspan="1" colspan="1">반려</th>
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
	
	<script type="text/javascript">
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
						data[i].wline_num,
						data[i].emp_name,
						data[i].wtype,
						data[i].term,
						data[i].caldate,
						data[i].work_content,
						data[i].wfile_orgfilename,
						data[i].regdate,
						'<input type="button" class="btn btn-primary" value="승인" onclick="s('+i+')">',
						'<input type="button" class="btn btn-danger" value="반려" onclick="b('+i+')">'
					]).draw(false);
				}
			},error:function(){	alert("error");	}
		});
			return false;
		};
		
	function s(i){
		var rowdata = t3.rows(i).data();
		console.log("wline_num : "+rowdata[0][0]);
		var result = confirm("[승인하시겠습니까?]\n"+"신청번호 : "+rowdata[0][0]+"\n사원이름 : "+rowdata[0][1]+"\n구분 : "+rowdata[0][2]+"\n날짜 : "+rowdata[0][3]+
				"\n시간 : "+rowdata[0][4]+"\n사유 : "+rowdata[0][5]+"\n첨부 : "+rowdata[0][6]+"\n신청일 : "+rowdata[0][7]);
		if(result){
			$.getJSON("<c:url value='/responseWorkList/accept'/>",{"wline_num":rowdata[0][0]},function(data){
				if(data.result){
					searchList2(event);
				}else{
					alert("error");
				}
			});
		}
	}
	
	function b(i){
		var rowdata = t3.rows(i).data();
		console.log("wline_num : "+rowdata[0][0]);
		var result = confirm("[반려하시겠습니까?]\n"+"신청번호 : "+rowdata[0][0]+"\n사원이름 : "+rowdata[0][1]+"\n구분 : "+rowdata[0][2]+"\n날짜 : "+rowdata[0][3]+
				"\n시간 : "+rowdata[0][4]+"\n사유 : "+rowdata[0][5]+"\n첨부 : "+rowdata[0][6]+"\n신청일 : "+rowdata[0][7]);
		if(result){
			$.getJSON("<c:url value='/responseWorkList/unaccept'/>",{"wline_num":rowdata[0][0]},function(data){
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
