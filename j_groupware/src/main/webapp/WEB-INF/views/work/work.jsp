<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value='/'/>resources/plugins/fullcalendar/ko.js"></script>
<div>
	<h3><span class="glyphicon glyphicon-list-alt"></span> 근태 현황</h3>
	<div class="box">
	<div class="box-body">
          <!-- Custom Tabs -->
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active" ><a href="#tab_1" data-toggle="tab" aria-expanded="true" >오늘</a></li>
              <li id="successMS"class="" ><a href="#tab_2" data-toggle="tab" aria-expanded="false">월별 현황</a></li>
              <li id="dagerMS"class="" ><a href="#tab_3" data-toggle="tab" aria-expanded="false" >반려</a></li>
              <li id="warningMS"class="" ><a href="#tab_4" data-toggle="tab" aria-expanded="false">취소</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
           <div class="box-body">
<!-- ----------------------------------------------------------------------------------------------------------- -->

			<!-- 아코디언 -->
			<div class="col-md-12">
              <div class="box-group" id="accordion">
                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                <div class="panel box box-default">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" class="" >
                        	전체
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
<!--  -->
            <div class="box-body no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th>직책</th>
                  <th>이름</th>
                  <th>날짜</th>
                  <th>상세</th>
                </tr>
                <tr>
                  <td>주임</td>
                  <td>양세용</td>
                  <td>2018/01/02</td>
                  <td><span class="badge bg-red">지각</span></td>
                </tr>
                <tr>
                  <td>대리</td>
                  <td>함형진</td>
                  <td>2018/01/02</td>
                  <td><span class="badge bg-yellow">반차</span></td>
                </tr>
              </tbody></table>
            </div>
            <!-- /.box-body -->
         
<!--  -->
                  </div>
                </div>
                <div class="panel box box-default">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" class="collapsed">
                        	연차
                      </a>
                    </h4>
                  </div>
                  <div id="collapseTwo" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                   <!--  -->
		    <div class="box-body no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th>직책</th>
                  <th>이름</th>
                  <th>날짜</th>
                  <th>상세</th>
                </tr>
                <tr>
                  <td>주임</td>
                  <td>양세용</td>
                  <td>2018/01/02</td>
                  <td><span class="badge bg-red">지각</span></td>
                </tr>
                <tr>
                  <td>대리</td>
                  <td>함형진</td>
                  <td>2018/01/02</td>
                  <td><span class="badge bg-yellow">반차</span></td>
                </tr>
              </tbody></table>
            </div>
            <!-- /.box-body -->
<!--  -->
                  </div>
                </div>
                <div class="panel box box-default">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" class="collapsed" aria-expanded="false">
                        	반차
                      </a>
                    </h4>
                  </div>
                  <div id="collapseThree" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                    <!--  -->
				    <div class="box-body no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th>직책</th>
                  <th>이름</th>
                  <th>날짜</th>
                  <th>상세</th>
                </tr>
                <tr>
                  <td>주임</td>
                  <td>양세용</td>
                  <td>2018/01/02</td>
                  <td><span class="badge bg-red">지각</span></td>
                </tr>
                <tr>
                  <td>대리</td>
                  <td>함형진</td>
                  <td>2018/01/02</td>
                  <td><span class="badge bg-yellow">반차</span></td>
                </tr>
              </tbody></table>
            </div>
            <!-- /.box-body -->
<!--  -->
                  </div>
                </div>
                <div class="panel box box-default">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour" class="collapsed" aria-expanded="false">
                       		지각
                      </a>
                    </h4>
                  </div>
                  <div id="collapseFour" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                    <!--  -->
					    <div class="box-body no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th>직책</th>
                  <th>이름</th>
                  <th>날짜</th>
                  <th>상세</th> 
                </tr>
                <tr>
                  <td>주임</td>
                  <td>양세용</td>
                  <td>2018/01/02</td>
                  <td><span class="badge bg-red">지각</span></td>
                </tr>
                <tr>
                  <td>대리</td>
                  <td>함형진</td>
                  <td>2018/01/02</td>
                  <td><span class="badge bg-yellow">반차</span></td>
                </tr>
              </tbody></table>
            </div>
            <!-- /.box-body -->
<!--  -->
                  </div>
                </div>
                <div class="panel box box-default">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive" class="collapsed" aria-expanded="false">
                       		야근
                      </a>
                    </h4>
                  </div>
                  <div id="collapseFive" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                    <!--  -->
			    <div class="box-body no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th>직책</th>
                  <th>이름</th>
                  <th>날짜</th>
                  <th>상세</th>
                </tr>
                <tr>
                  <td>주임</td>
                  <td>양세용</td>
                  <td>2018/01/02</td>
                  <td><span class="badge bg-red">지각</span></td>
                </tr>
                <tr>
                  <td>대리</td>
                  <td>함형진</td>
                  <td>2018/01/02</td>
                  <td><span class="badge bg-yellow">반차</span></td>
                </tr>
              </tbody></table>
            </div>
            <!-- /.box-body -->
<!--  -->
                  </div>
                </div>
                <div class="panel box box-default">
                  <div class="box-header with-border">
                    <h4 class="box-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseSix" class="collapsed" aria-expanded="false">
                       		외근(출장)/기타
                      </a>
                    </h4>
                  </div>
                  <div id="collapseSix" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                    <!--  -->
				    <div class="box-body no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th>직책</th>
                  <th>이름</th>
                  <th>날짜</th>
                  <th>상세</th>
                </tr>
                <tr>
                  <td>주임</td>
                  <td>양세용</td>
                  <td>2018/01/02</td>
                  <td><span class="badge bg-red">지각</span></td>
                </tr>
                <tr>
                  <td>대리</td>
                  <td>함형진</td>
                  <td>2018/01/02</td>
                  <td><span class="badge bg-yellow">야근</span></td>
                </tr>
              </tbody></table>
            </div>
            <!-- /.box-body -->
<!--  -->
                  </div>
                </div>
              </div>
          </div>
        <!-- /.box -->
        </div>

<!-- ----------------------------------------------------------------------------------------------------------- -->              
            <!-- /.box-body -->
          
         	  </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_2">
              <div class="box-body">
	              	<span class="badge bg-green">연차</span>
	              	<span class="badge bg-blue">반차</span>
	              	<span class="badge bg-red">지각</span>
	              	<span class="badge bg-purple">야근</span>
	              	<span class="badge bg-yellow">외근</span>
	              	<span class="badge bg-gray">경조사/기타</span>
	              	<br><br>
              		<div class="box box-success">
              			<div id="calendar"></div>
              			</div>
             		</div>
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_3">
           
            <div class="box-body">
            </div>
            <!-- /.box-body -->
          	  </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_4">
                	
            <div class="box-body">
              
            </div>
            <!-- /.box-body -->
          </div>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- nav-tabs-custom -->
        </div>
      
        <script type="text/javascript">
	        $('#calendar').fullCalendar({      
	          //노출메뉴
	          header    : {
	        	  left:'prev,next,today',
	        	  center:'title',
	              right : ''
	          },
	          buttonText: {     
	          },
	          locale:'ko',    
	          height:"auto"
	        }); 
        </script>
</div>
