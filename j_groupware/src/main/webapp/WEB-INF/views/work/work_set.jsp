<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- DataTables -->
<script src="<c:url value='/'/>resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<c:url value='/'/>resources/plugins/datatables/dataTables.bootstrap.min.js"></script>


<div>
	<h3><span class="glyphicon glyphicon-cog"></span> 근태 설정</h3>
	<div class="box">
		<div class="col-md-12">
          <!-- Custom Tabs -->
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true">기본 설정</a></li>
              <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">카테고리 설정</a></li>
              <li class=""><a href="#tab_3" data-toggle="tab" aria-expanded="false">관리자 설정</a></li>
              <li class=""><a href="#tab_4" data-toggle="tab" aria-expanded="false">사원 연차 설정</a></li>
              <li class=""><a href="#tab_5" data-toggle="tab" aria-expanded="false">연간 휴가 설정</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
                <!--  -->
				
		          <div class="box">
		            <div class="box-header">
		              <h3 class="box-title"><span class="glyphicon glyphicon-time"></span> 시간 설정</h3>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body table-responsive no-padding">
		            <form>
		              <table class="table table-hover">
		                <tbody>
			                <tr>
			                  <th>출/퇴근 시간</th>
			                  <td>
			                  <div class="col-md-6">
			                  	출근
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
							  <div class="col-md-6">
			                  	 퇴근
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
			                  </td>
			                </tr>
			                <tr>
			               	  <th>반차 시간(오전)</th>
			               	  <td>
			               	  <div class="col-md-6">
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
					            <div class="col-md-6">
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
					              </td>
					              </tr>
					              <tr>
			               	  	<th>반차 시간(오후)</th>
			               	  	<td>
			               	  	  <div class="col-md-6">
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
					              <div class="col-md-6">
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
			               	  </td>
			                </tr>
		                </tbody>
		              </table>
		               <div class="box-footer">
		              <input type="submit" value="저장" class="btn btn-block btn-primary">
		              </div>
		              <br><br><br>
		              </form>
		            </div>
		            <!-- /.box-body -->
		          </div>
          <!-- /.box -->
		
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"><span class="glyphicon glyphicon-wrench"></span> 기능 설정</h3>
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
                   		 <label><input type="checkbox">출/퇴근 허용IP 설정 </label>
                   		 <a href="#"><i class="fa fa-gears"></i></a>
                  	</div>
                  	
	                  </td>
	                </tr>
	                <tr>
	               	  <th>로그인 기능</th>
	               	  <td>
	               	  <div class="checkbox">
                   		 <label><input type="checkbox">로그인시 출근 자동 등록 </label>
                  	</div>
	               	  </td>
	                </tr>
                </tbody>
              </table>
               <div class="box-footer">
               <input type="submit" value="저장" class="btn btn-block btn-primary">
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
              <h3 class="box-title"><span class="glyphicon glyphicon-wrench"></span> 카테고리 설정</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
            <form>
              <table class="table table-hover">
                <tbody>
	                <tr>
	                  <th>출/퇴근 기능</th>
	                  <td>
	                 <div class="form-group">
	                 
	                  <div class="checkbox">
	                    <label>
	                      <input type="checkbox">
	                      	연차
	                    </label>
	                  </div>
	
	                  <div class="checkbox">
	                    <label>
	                      <input type="checkbox">
	                    	  반차	
	                    </label>
	                  </div>
	                  
	                   <div class="checkbox">
	                    <label>
	                      <input type="checkbox">
	                      	지각
	                    </label>
	                  </div>
	                  
	                   <div class="checkbox">
	                    <label>
	                      <input type="checkbox">
	                     	조퇴
	                    </label>
	                  </div>
	                  
	                   <div class="checkbox">
	                    <label>
	                      <input type="checkbox">
	                      	야근
	                    </label>
	                  </div>
	                  
                </div>
	                  </td>
	                </tr>
                </tbody>
              </table>
               <div class="box-footer">
                 <input type="submit" value="저장" class="btn btn-block btn-primary">
               </div>
              </form>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_3">
                <div class="box">
		            <div class="box-header">
		              <h3 class="box-title"><span class="glyphicon glyphicon-user"></span> 관리자 설정</h3>
		
		              <div class="box-tools">
		                <div class="input-group input-group-sm" style="width: 150px;">
		                  <input type="text" name="table_search" class="form-control pull-right" value="관리자선택" readonly="readonly">
		
		                  <div class="input-group-btn">
		                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
		                  </div>
		                </div>
		              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
            <form>
              <table class="table table-hover">
                <tbody><tr>
                  <th>ID</th>
                  <th>User</th>
                  <th>Dept</th>
                  <th>Position</th>
                </tr>
                <tr>
                  <td>183</td>
                  <td>John Doe</td>
                  <td>인사팀</td>
                  <td><span class="label label-success">대리</span></td>
                </tr>
                <tr>
                  <td>219</td>
                  <td>Alexander Pierce</td>
                  <td>인사팀</td>
                  <td><span class="label label-warning">부장</span></td>
                </tr>
                <tr>
                  <td>657</td>
                  <td>Bob Doe</td>
                  <td>본사</td>
                  <td><span class="label label-primary">본부장</span></td>
                </tr>
                <tr>
                  <td>175</td>
                  <td>Mike Doe</td>
                  <td>본사</td>
                  <td><span class="label label-danger">이사</span></td>
                </tr>
              </tbody></table>
              </form>
              <div class="box-footer">
                 <input type="submit" value="저장" class="btn btn-block btn-primary">
               </div>
            </div>
            <!-- /.box-body -->
          </div>
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_4">
                Lorem Ipsum is simply du
            <!-- /.box-body -->
          		</div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_5">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
                when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                It has survived not only five centuries, but also the leap into electronic typesetting,
                remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset
                sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
                like Aldus PageMaker including versions of Lorem Ipsum.
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- nav-tabs-custom -->
        </div>
	</div>
</div>
<script>
  $(function () {
	$("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>

