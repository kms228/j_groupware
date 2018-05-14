<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	(function(){
		
	})();
</script>
<section class="content">
	<div class="row">	
		<div class="col-md-4"><!-- <button onclick = "read('sin')">Read </button> -->													  
			
		  <!-- About Me Box -->
		  <div class="box">
            <div class="box-header">
              <h3 class="box-title">내 정보</h3>
            </div>
          <!-- Widget: user widget style 1 -->
          <div class="box box-widget widget-user-2" style="margin-bottom: 0px;">
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="widget-user-header bg-yellow">
              <div class="widget-user-image">
                <!-- <img class="img-circle" src="../dist/img/user7-128x128.jpg" alt="User Avatar"> -->
              </div>
              <!-- /.widget-user-image -->
              <h3 class="widget-user-username">사원이름</h3>
              <h5 class="widget-user-desc">부서이름</h5>
            </div>            
          </div>          
            <div class="box-body">
            
              <strong><i class="fa fa-pencil margin-r-5"></i> 직위</strong>

              <p>
                <span class="label label-danger">UI Design</span>
                <span class="label label-success">Coding</span>
                <span class="label label-info">Javascript</span>
                <span class="label label-warning">PHP</span>
                <span class="label label-primary">Node.js</span>
              </p>

              <hr>
                        
              <strong><i class="fa fa-book margin-r-5"></i>이메일</strong>

              <p class="text-muted">
                B.S. in Computer Science from the University of Tennessee at Knoxville
              </p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> 핸드폰</strong>

              <p class="text-muted">Malibu, California</p>              
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
			
		</div>
		<div class="col-md-4"><!-- <button onclick = "readAll()">Read all </button> -->				                                        
		
			<div class="box">
            <div class="box-header">
              <h3 class="box-title">출근 내역</h3>              
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th>ID</th>
                  <th>User</th>
                  <th>Date</th>
                  <th>Status</th>
                  <th>Reason</th>
                </tr>
                <tr>
                  <td>183</td>
                  <td>John Doe</td>
                  <td>11-7-2014</td>
                  <td><span class="label label-success">Approved</span></td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>
                  <td>219</td>
                  <td>Alexander Pierce</td>
                  <td>11-7-2014</td>
                  <td><span class="label label-warning">Pending</span></td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>
                  <td>657</td>
                  <td>Bob Doe</td>
                  <td>11-7-2014</td>
                  <td><span class="label label-primary">Approved</span></td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>
                  <td>175</td>
                  <td>Mike Doe</td>
                  <td>11-7-2014</td>
                  <td><span class="label label-danger">Denied</span></td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>
                  <td>175</td>
                  <td>Mike Doe</td>
                  <td>11-7-2014</td>
                  <td><span class="label label-danger">Denied</span></td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
		
		</div>
		<div class="col-md-4"><!-- <button onclick = "remove()">Delete data </button> -->
		
			<div class="box">
              <div class="box-header">
                  <h3 class="box-title">현재 일정</h3>
                <div class="box-tools">
                
                </div>
              </div>
              <!-- /.box-header -->
            <div class="box-body">
              <div class="info-box bg-aqua"></div>
			  <div class="info-box bg-aqua"></div>
			  <div class="info-box bg-aqua"></div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
						
		</div>		
	</div>				
</section>      
