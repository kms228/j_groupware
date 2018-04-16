<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DecimalFormat"%>
<%!
//년월일 구하기
public static String getdate(int mountdate){
   //mountdate = 해당 숫자만큼 더해진 날짜를 반환
   DecimalFormat df = new DecimalFormat("00");
   Calendar calendar = Calendar.getInstance();
 
   calendar.add(calendar.DATE, mountdate);
   String year = Integer.toString(calendar.get(Calendar.YEAR)); //년도
   String month = df.format(calendar.get(Calendar.MONTH) + 1); //달
   String day = df.format(calendar.get(Calendar.DATE)); //날짜
   int dow = calendar.get(Calendar.DAY_OF_WEEK);
   
   String date = year +'년'+ month+'월' + day+'일'+'('+getdow(dow)+')';   //8자리 숫자
   return date;
}
public static String getdow(int dow){
	if(dow==1){return "일";}
	else if(dow==2){return "월";}
	else if(dow==3){return "화";}
	else if(dow==4){return "수";}
	else if(dow==5){return "목";}
	else if(dow==6){return "금";}
	else{return "토";}
}
//년도 구하기
public static String getyear(int mountdate){
	DecimalFormat df = new DecimalFormat("00");
	Calendar calendar = Calendar.getInstance();
	calendar.add(calendar.DATE, mountdate);
	String year = Integer.toString(calendar.get(Calendar.YEAR)); //년도
	String date = year+'년';
	return date;
}
//시분초 구하기
public static String gettime(int mountdate){
	DecimalFormat df = new DecimalFormat("00");
	Calendar calendar = Calendar.getInstance();
	calendar.add(calendar.DATE, mountdate);
	String hour = df.format(calendar.get(Calendar.HOUR));//시
	String minute = df.format(calendar.get(Calendar.MINUTE));//분
	String secont = df.format(calendar.get(Calendar.SECOND));//초
	String date = hour+':'+minute;
	return date;
}
%>
<div>
	<h3 class="corpor_title"><span class="glyphicon glyphicon-time"></span> 출근 / 퇴근</h3><br>
			<div class="box-body">
                <div class="col-md-2">
                  <input type="text" class="form-control" value="<%out.print (getdate(0));%>" readonly="readonly">
                </div>
                <div class="col-md-1">
                  <button type="button" class="btn btn-block btn-primary" id="btn_workstart" title="출근" style="width: 100px">출근</button>
                </div>
                <div class="col-md-2">
                  <input type="text" class="form-control" readonly="readonly" placeholder="출근버튼을 누르세요">
                </div>
                <div class="col-md-1">
                  <button type="button" class="btn btn-block btn-danger" id="btn_workend" title="퇴근" style="width: 100px">퇴근</button>
                </div>
                <div class="col-md-2">
                  <input type="text" class="form-control" readonly="readonly" placeholder="퇴근버튼을 누르세요">
                </div>
            </div>
	<br>
	<div class="box">
              <h3 class="box-title"><span class="glyphicon glyphicon-time"></span> 근태 신청</h3>
              <br>
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
                     	<label>일자/시간</label>
               			<!-- 연차-->
               			<div class="form-group">
			                <div class="input-group">
			                  <div class="input-group-addon">
			                    <i class="fa fa-calendar"></i>
			                  </div>
			                  <input type="text" class="form-control pull-right" id="reservation">
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
                     <label>일자/시간</label>
                     <div class="form-group">
			                <div class="input-group date">
			                  <div class="input-group-addon">
			                    <i class="fa fa-calendar"></i>
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
                      <label>일자/시간</label>
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
                       		외근(출장)
                      </a>
                    </h4>
                  </div>
                  <div id="collapseFive" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                    <div class="box-body">
                      <!-- 외근(출장)신청 폼 -->
                      <label>일자/시간</label>
                      <div class="form-group">
			                <div class="input-group">
			                  <div class="input-group-addon">
			                    <i class="fa fa-calendar"></i>
			                  </div>
			                  <input type="text" class="form-control pull-right" id="reservation2">
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
		                <button type="submit" class="btn btn-block btn-primary">외근(출장) 신청</button>
		              </div>
                      <!-- /외근(출장)신청 폼 -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
          <!-- /.box-body -->
          </div>
        <!-- /.box -->
        </div>
       <!-- 아코디언 -->
       </div>
      </div>
      <!-- /.box-body -->
