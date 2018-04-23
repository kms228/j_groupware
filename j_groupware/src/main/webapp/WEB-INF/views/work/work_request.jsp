<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<h3><span class="glyphicon glyphicon-time"></span> 출근 / 퇴근</h3>
			<div class="box">
			<div class="box-body">
			<label for="reservation3">출/퇴근 현황</label>
			<div class="form-group">
                  <div class="col-md-3">
			                  	<div class="input-group">
					                <div class="input-group-btn">
					                  <button type="button" class="btn btn-default"  >날짜</button>
					                </div>
					                <!-- /btn-group -->
					               
					                  <div class="input-group">
					                    <input type="text" class="form-control" id="nowDate" readonly="readonly" name="wlist_start" >
					                  </div>
					                  <!-- /.input group -->
					                <!-- /.form group -->
					             
					              </div>
					              </div>
					                <div class="col-md-3">
			                  	<div class="input-group">
					                <div class="input-group-btn">
					                  <button type="button" class="btn btn-default" >시간</button>
					                </div>
					                <!-- /btn-group -->
					               
					                  <div class="input-group">
					                    <input type="text" class="form-control" id="nowTime" readonly="readonly" >
					                  </div>
					                  <!-- /.input group -->
					                <!-- /.form group -->
					             
					              </div>
					              </div>
					              
                <div class="col-md-3">
                	<form onsubmit="return workStart();" method="post" action="<c:url value='/workStart'/>">
	                	<input type="hidden" name="emp_num" value="${emp_num }">
	                	<input type="hidden" name="wlist_start" id="real_workstart">
	                	<input type="hidden" name="wlist_type" id="wlist_type" value="1">
			            <div class="input-group">
					    	<div class="input-group-btn">
					        	<button type="submit" class="btn btn-primary">출근</button>
					        </div>
					        <!-- /btn-group -->
					        <div class="input-group">
					        	<input type="text" class="form-control" readonly="readonly" id="text_workstart"
					        	value="<fmt:formatDate value="${work.wlist_start}" pattern="HH:mm"/>"
					        	>
					        </div>
					        <!-- /.input group -->
						</div>
					</form>
					<!-- /.form group -->
				</div>
				<div class="col-md-3">
					              <form onsubmit="return workEnd();" action="" method="post">
					              <input type="hidden" name="emp_num" value="${emp_num }">
					              <input type="hidden" name="wlist_end" id="real_workend">
					              <div class="input-group">
					                <div class="input-group-btn">
					                  <button type="submit" class="btn btn-danger">퇴근</button>
					                </div>
					                <!-- /btn-group -->
					                  <div class="input-group">
					                    <input type="text" class="form-control" id="text_workend" readonly="readonly">
					                  </div>
					                  <!-- /.input group -->
					              </div>
					              </form>
					           </div>
					            <br>
           
            </div>
         </div>
         </div>
              <h3><span class="glyphicon glyphicon-time"></span> 근태 신청</h3>
              <!-- 아코디언 -->
              <div class="col-md-12">
          <div class="box box-solid">
            <div class="box-body">
              <div class="box-group" id="accordion">
                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                <div class="panel box box-default">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" class="">
                        	연차
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse in" aria-expanded="false" style="">
                    <div class="box-body">
                     <!-- 연차신청 폼 -->
                     	<div class="form-group">
		                  <label>연차 현황</label>
		                  	<div class="form-control">
			                  	총 연차 일수 : <label style="color:green;">30 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 사용일 : <label style="color:blue;">2.5 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 가용일 : <label style="color:red;">27.5 </label>
							</div>
		                </div>
                     	<label for="reservation">일자/시간</label>
               			<!-- 연차-->
               			<div class="form-group">
			                <div class="input-group">
			                  <div class="input-group-addon">
			                  <label for="reservation">
			                    <i class="fa fa-calendar"></i></label>
			                  </div>
			                  <input type="text" class="form-control pull-left" id="reservation">
			                </div>
			                <!-- /.input group -->
			              </div>
                     	<div class="form-group">
			                <div>
			                  <label for="reason1">사유</label>
			                  </div>
			                  <textarea class="form-control" rows="3" placeholder="사유를 적으세요." id="reason1"></textarea>
			                </div>
			                <div class="form-group">
			                  <label for="exampleInputFile1">첨부</label>
			                  <input type="file" id="exampleInputFile1">
			                </div>
			                <div class="form-group">
			                  <label for="line1">결재선 선택</label>
			                  <input type="text" class="form-control" id="line1" placeholder="결재선 선택" readonly="readonly">
			                </div>
			                <div class="box-footer">
			                <button type="submit" class="btn btn-block btn-primary">연차 신청</button>
			              </div>
                     <!-- /연차신청 폼 -->
                    </div>
                  </div>
                </div>
                <div class="panel box box-default">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" class="collapsed" aria-expanded="false">
                        	반차
                      </a>
                    </h4>
                  </div>
                  <div id="collapseTwo" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                    <div class="box-body">
                     <!-- 반차신청 폼 -->
                     <div class="form-group">
		                  <label>연차 현황</label>
		                  	<div class="form-control">
			                  	총 연차 일수 : <label style="color:green;">30 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 사용일 : <label style="color:blue;">2.5 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 가용일 : <label style="color:red;">27.5 </label>
							</div>
		                </div>
                     <label for="datepicker">일자/시간</label>
                     <div class="form-group">
			                <div class="input-group date">
			                  <div class="input-group-addon">
			                  <label for="datepicker">
			                    <i class="fa fa-calendar"></i>
			                    </label>
			                  </div>
			                  <input type="text" class="form-control pull-right" id="datepicker">
			                </div>
			                <div class="form-group">
			                  <div class="radio" align="center">
			                    <label>
			                      <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
			                    	 오전
			                    </label>
			                    <label>
			                      <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
			                     	오후
			                    </label>
			                  </div>
			                </div>
			                <!-- /.input group -->
			              </div>
                     <div class="form-group">
		                <div>
		                  <label for="reason2">사유</label>
		                  </div>
		                  <textarea class="form-control" rows="3" placeholder="사유를 적으세요." id="reason2"></textarea>
		                </div>
		                <div class="form-group">
		                  <label for="exampleInputFile2">첨부</label>
		                  <input type="file" id="exampleInputFile2">
		                </div>
		                <div class="form-group">
		                  <label for="line2">결재선 선택</label>
		                  <input type="text" class="form-control" placeholder="결재선 선택" id="line2" readonly="readonly">
		                </div>
		                <div class="box-footer">
		                <button type="submit" class="btn btn-block btn-primary">반차 신청</button>
		              </div>
                     <!-- /반차신청 폼 -->
                    </div>
                  </div>
                </div>
                <div class="panel box box-default">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" class="collapsed" aria-expanded="false">
                       		지각
                      </a>
                    </h4>
                  </div>
                  <div id="collapseThree" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                    <div class="box-body">
                      <!-- 지각신청 폼 -->
                      <label for="timepickerMS1" >일자/시간</label>
                        <!-- time Picker -->
			              <div class="bootstrap-timepicker">
			                <div class="form-group">
			                  <div class="input-group">
			                    <input type="text" class="form-control timepicker" id="timepickerMS1">
			
			                    <div class="input-group-addon">
			                      <i class="fa fa-clock-o"></i>
			                    </div>
			                  </div>
			                  <!-- /.input group -->
			                </div>
			                <!-- /.form group -->
			              </div>
                      
                      <div class="form-group">
		                <div>
		                  <label for="reason3">사유</label>
		                  </div>
		                  <textarea class="form-control" rows="3" placeholder="사유를 적으세요." id="reason3" ></textarea>
		                </div>
		                <div class="form-group">
		                  <label for="exampleInputFile3">첨부</label>
		                  <input type="file" id="exampleInputFile3">
		                </div>
		                <div class="form-group">
		                  <label for="line3">결재선 선택</label>
		                  <input type="text" class="form-control"  placeholder="결재선 선택" id="line3" readonly="readonly">
		                </div>
		                <div class="box-footer">
		                <button type="submit" class="btn btn-block btn-primary">지각 신청</button>
		              </div>
                      <!-- /지각신청 폼 -->
                    </div>
                  </div>
                </div>
                <div class="panel box box-default">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour" class="collapsed" aria-expanded="false">
                       		야근
                      </a>
                    </h4>
                  </div>
                  <div id="collapseFour" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                    <div class="box-body">
                      <!-- 야근신청 폼 -->
                      <label>일자/시간</label>
                      <div class="col-md-12">
                      	<div class="col-md-5">
                       <!-- time Picker -->
			              <div class="bootstrap-timepicker">
			                <div class="form-group">
			                  <div class="input-group">
			                    <input type="text" class="form-control timepicker">
			                    <div class="input-group-addon">
			                      <i class="fa fa-clock-o"></i>
			                    </div>
			                  </div>
			                  <!-- /.input group -->
			                </div>
			                <!-- /.form group -->
			              </div>
			              </div>
			              
			              <div class="col-md-5">
			              
			               <!-- time Picker -->
			              <div class="bootstrap-timepicker">
			                <div class="form-group">
			                  <div class="input-group">
			                    <input type="text" class="form-control timepicker">
			
			                    <div class="input-group-addon">
			                      <i class="fa fa-clock-o"></i>
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
		                  <textarea class="form-control" rows="3" placeholder="사유를 적으세요." id="reason4"></textarea>
		                </div>
		                <div class="form-group">
		                  <label for="exampleInputFile4">첨부</label>
		                  <input type="file" id="exampleInputFile4">
		                </div>
		                <div class="form-group">
		                  <label for="line4">결재선 선택</label>
		                  <input type="text" class="form-control"  placeholder="결재선 선택" id="line4" readonly="readonly">
		                </div>
		                <div class="box-footer">
		                <button type="submit" class="btn btn-block btn-primary">야근 신청</button>
		              </div>
                      <!-- /조퇴신청 폼 -->
                    </div>
                  </div>
                </div>
                <div class="panel box box-default">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive" class="collapsed" aria-expanded="false">
                       		외근/출장/교육
                      </a>
                    </h4>
                  </div>
                  <div id="collapseFive" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                    <div class="box-body">
                      <!-- 외근(출장)신청 폼 -->
                      <label for="reservation2">일자/시간</label>
                      <div class="form-group">
			                <div class="input-group">
			                  <div class="input-group-addon">
			                  <label for="reservation2">
			                    <i class="fa fa-calendar"></i>
			                    </label>
			                  </div>
			                  <input type="text" class="form-control pull-left" id="reservation2">
			                </div>
			                <!-- /.input group -->
			              </div>
                      <div class="form-group">
		                <div>
		                  <label for="reason5">사유</label>
		                  </div>
		                  <textarea class="form-control" rows="3" placeholder="사유를 적으세요." id="reason5"></textarea>
		                </div>
		                <div class="form-group">
		                  <label for="exampleInputFile5">첨부</label>
		                  <input type="file" id="exampleInputFile5">
		                </div>
		                <div class="form-group">
		                  <label for="line5">결재선 선택</label>
		                  <input type="text" class="form-control" placeholder="결재선 선택" id="line5" readonly="readonly">
		                </div>
		                <div class="box-footer">
		                <button type="submit" class="btn btn-block btn-primary">외근/출장/교육 신청</button>
		              </div>
                      <!-- /외근(출장)신청 폼 -->
                    </div>
                  </div>
                </div>
                <!-- 경조사/기타 -->
                <div class="panel box box-default">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseSix" class="collapsed" aria-expanded="false">
                       		경조사/기타
                      </a>
                    </h4>
                  </div>
                  <div id="collapseSix" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                    <div class="box-body">
                      <!-- 외근(출장)신청 폼 -->
                      <label for="reservation3">일자/시간</label>
                      <div class="form-group">
			                <div class="input-group">
			                  <div class="input-group-addon">
			                  <label for="reservation3">
			                    <i class="fa fa-calendar"></i>
			                    </label>
			                  </div>
			                  <input type="text" class="form-control pull-left" id="reservation3">
			                </div>
			                <!-- /.input group -->
			              </div>
                      <div class="form-group">
		                <div>
		                  <label for="reason5">사유</label>
		                  </div>
		                  <textarea class="form-control" rows="3" placeholder="사유를 적으세요." id="reason5"></textarea>
		                </div>
		                <div class="form-group">
		                  <label for="exampleInputFile6">첨부</label>
		                  <input type="file" id="exampleInputFile6">
		                </div>
		                <div class="form-group">
		                  <label for="line6">결재선 선택</label>
		                  <input type="text" class="form-control" placeholder="결재선 선택" id="line6" readonly="readonly">
		                </div>
		                <div class="box-footer">
		                <button type="submit" class="btn btn-block btn-primary">경조사/기타 신청</button>
		              </div>
                      <!-- /외근(출장)신청 폼 -->
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
       
      <h3 class="box-title"><span class="glyphicon glyphicon-list-alt"></span> 나의 신청 현황</h3>
          <div class="box">
            <div class="box-body">
              <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
             <div class="row"><div class="col-sm-12"><table id="table3" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                <thead>
                <tr role="row">
                	<th>선택</th>
                  <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending">번호</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">사원 이름</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">구분</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">날짜</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">시간</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">설명</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">첨부</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">신청일</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">상태</th>
                </tr>
                </thead>
                <tbody>
                
                <tr role="row" class="odd">
                <td></td>
                  <td class="sorting_1">Gecko</td>
                  <td>Firefox 1.0</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.7</td>
                  <td>A</td><td></td><td></td><td></td><td></td>
                </tr><tr role="row" class="even">
                <td></td>
                  <td class="sorting_1">Gecko</td>
                  <td>Firefox 1.5</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td><td></td><td></td><td></td><td>값을 채워넣자</td>
                </tr></tbody>
                <tfoot>
                <tr><th>선택</th><th rowspan="1" colspan="1">번호</th><th rowspan="1" colspan="1">사원 이름</th><th rowspan="1" colspan="1">사원 아이디</th><th rowspan="1" colspan="1">사용일</th><th rowspan="1" colspan="1">총 연차 일수</th><th rowspan="1" colspan="1">총 연차 일수</th><th rowspan="1" colspan="1">총 연차 일수</th><th rowspan="1" colspan="1">총 연차 일수</th><th rowspan="1" colspan="1">총 연차 일수</th></tr>
                </tfoot>
              </table></div></div></div>
            </div>
            <!-- /.box-body -->
          </div>
       
<script type="text/javascript">
	$(function(){
		//날짜
		var nowDate = moment().format('YYYY/MM/DD');
		$("#nowDate").val(nowDate);
		//시간
		setInterval(function() {
			var nowTime = moment().format('HH:mm:ss');
			$("#nowTime").val(nowTime);
		}, 1000);
	});
	//출근버튼
	function workStart(){
		if($("#text_workstart").val()==null||$("#text_workstart").val()==''){
			var result = confirm('출근하시겠습니까?');
			if(result){
				var requestTime = moment().format('YYYY/MM/DD HH:mm');
				$("#real_workstart").val(requestTime);
				alert(requestTime+" 출근");
				
				var startTime = moment().format('HH:mm');
				$("#text_workstart").val(startTime);
				return true;
			}else{
				return false;
			}
		}else{
			alert("이미 출근하셨습니다.");
			return false;
		}
	};
	//퇴근버튼
	function workEnd(){
		if($("#text_workstart").val()==null||$("#text_workstart").val()==''){
			alert("출근시간이 입력되지 않았습니다.");
			return false;
		}else{
			if($("#text_workend").val()==null||$("#text_workend").val()==''){
				var result = confirm('퇴근하시겠습니까?');
				if(result){
					var requestTime = moment().format('YYYY/MM/DD HH:mm');
					$("#real_workend").val(requestTime);
					var endTime = moment().format('HH:mm');
					$("#text_workend").val(endTime);
					alert(requestTime+" 퇴근");
					return true;
				}else{
					return false;
				}
			}else{
				alert("이미 퇴근하셨습니다.");
				return false;
			}
		}
	};
</script>
      </div>
      <!-- /.box-body -->
