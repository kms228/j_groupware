<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>진행문서함</h1>
<div class="box-header">
              <h3 class="box-title"><span class="glyphicon glyphicon-ok"></span>진행문서</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
             <div class="row"><div class="col-sm-12"><table id="signnowtable" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                <thead>
                <tr role="row">
                  <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending">번호</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">문서종류</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">제목</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">기안자</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">기안부서</th>
                  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">기안일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="vo" items="${list }">
                <tr role="row" class="odd">
	                  <td class="sorting_1">${vo.sdoc_num }</td>
	                  <td>${vo.doc_name }</td>
	                  <td><a href="<c:url value='/'/>signnowdetail?sdoc_num=${vo.sdoc_num}">${vo.sdoc_title }</a></td>
	                  <td>${vo.emp_name }</td>
	                  <td>${vo.dept_name }</td>
	                  <td>${vo.sdoc_date }</td>
                </tr>
                </c:forEach>
                </tbody>
              </table></div></div></div>
            </div>