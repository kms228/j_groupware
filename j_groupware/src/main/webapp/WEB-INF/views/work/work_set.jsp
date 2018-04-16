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
              <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">기능 설정</a></li>
              <li class=""><a href="#tab_3" data-toggle="tab" aria-expanded="false">관리자 설정</a></li>
              <li class=""><a href="#tab_4" data-toggle="tab" aria-expanded="false">사원 연차 설정</a></li>
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
		
       
         </div>
              <!-- /.tab-pane -->
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_2">
                
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
                <div class="box">
            <div class="box-header">
              <h3 class="box-title"><span class="glyphicon glyphicon-sunglasses"></span> 사원 연차 설정</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
             <div class="row"><div class="col-sm-12"><table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                <thead>
                <tr role="row">
                  <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 296px;">번호</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 359px;">사원 이름</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 321px;">사원 아이디</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 256px;">사용일</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 190px;">총 연차 일수</th>
                </tr>
                </thead>
                <tbody>
                
                <tr role="row" class="odd">
                  <td class="sorting_1">Gecko</td>
                  <td>Firefox 1.0</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.7</td>
                  <td>A</td>
                </tr><tr role="row" class="even">
                  <td class="sorting_1">Gecko</td>
                  <td>Firefox 1.5</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr><tr role="row" class="odd">
                  <td class="sorting_1">Gecko</td>
                  <td>Firefox 2.0</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr><tr role="row" class="even">
                  <td class="sorting_1">Gecko</td>
                  <td>Firefox 3.0</td>
                  <td>Win 2k+ / OSX.3+</td>
                  <td>1.9</td>
                  <td>A</td>
                </tr><tr role="row" class="odd">
                  <td class="sorting_1">Gecko</td>
                  <td>Camino 1.0</td>
                  <td>OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr><tr role="row" class="even">
                  <td class="sorting_1">Gecko</td>
                  <td>Camino 1.5</td>
                  <td>OSX.3+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr><tr role="row" class="odd">
                  <td class="sorting_1">Gecko</td>
                  <td>Netscape 7.2</td>
                  <td>Win 95+ / Mac OS 8.6-9.2</td>
                  <td>1.7</td>
                  <td>A</td>
                </tr><tr role="row" class="even">
                  <td class="sorting_1">Gecko</td>
                  <td>Netscape Browser 8</td>
                  <td>Win 98SE+</td>
                  <td>1.7</td>
                  <td>A</td>
                </tr><tr role="row" class="odd">
                  <td class="sorting_1">Gecko</td>
                  <td>Netscape Navigator 9</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr><tr role="row" class="even">
                  <td class="sorting_1">Gecko</td>
                  <td>Mozilla 1.0</td>
                  <td>Win 95+ / OSX.1+</td>
                  <td>1</td>
                  <td>A</td>
                </tr><tr role="row" class="odd">
                  <td class="sorting_1">Gecko</td>
                  <td>Netscape Navigator 9</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td>
                </tr></tbody>
                <tfoot>
                <tr><th rowspan="1" colspan="1">번호</th><th rowspan="1" colspan="1">사원 이름</th><th rowspan="1" colspan="1">사원 아이디</th><th rowspan="1" colspan="1">사용일</th><th rowspan="1" colspan="1">총 연차 일수</th></tr>
                </tfoot>
              </table></div></div></div>
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

