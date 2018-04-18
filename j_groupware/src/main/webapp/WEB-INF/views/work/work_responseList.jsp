<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<div>
	<h3><span class="glyphicon glyphicon-search"></span> 승인 요청 검색</h3>
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
          <h3 class="box-title"><span class="glyphicon glyphicon-list-alt"></span> 승인 요청 내역</h3>
          <div class="box">
           
            <div class="box-body">
              <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
             <div class="row"><div class="col-sm-12"><table id="table3" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                <thead>
                <tr role="row">
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
                  <td class="sorting_1">Gecko</td>
                  <td>Firefox 1.0</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.7</td>
                  <td>A</td><td></td><td></td><td></td><td></td>
                </tr><tr role="row" class="even">
                  <td class="sorting_1">Gecko</td>
                  <td>Firefox 1.5</td>
                  <td>Win 98+ / OSX.2+</td>
                  <td>1.8</td>
                  <td>A</td><td></td><td></td><td></td><td>값을 채워넣자</td>
                </tr></tbody>
                <tfoot>
                <tr><th rowspan="1" colspan="1">번호</th><th rowspan="1" colspan="1">사원 이름</th><th rowspan="1" colspan="1">사원 아이디</th><th rowspan="1" colspan="1">사용일</th><th rowspan="1" colspan="1">총 연차 일수</th></tr>
                </tfoot>
              </table></div></div></div>
            </div>
            <!-- /.box-body -->
          </div>
	</div>
</div>
