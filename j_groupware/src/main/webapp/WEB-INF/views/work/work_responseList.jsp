<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<div>
	<h3><span class="glyphicon glyphicon-list-alt"></span> 승인 요청 내역</h3>
	<div class="box">
            <!-- form start -->
            <form role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="select3">구분</label>
                  <div class="form-group">
	                  <select class="form-control" id="select3">
	                    <option>option 1</option>
	                    <option>option 2</option>
	                    <option>option 3</option>
	                    <option>option 4</option>
	                    <option>option 5</option>
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
			                  <input type="text" class="form-control pull-right" id="reservation3">
			                </div>
			                <!-- /.input group -->
			              </div>
                </div>
                <div class="form-group">
                  <label for="user">사용자</label>
                  <input type="password" class="form-control" id="exampleInputPassword1" readonly="readonly" >
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
          <div class="box-body">
          <!-- Custom Tabs -->
        
        </div>
	</div>
</div>
