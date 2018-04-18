<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>진행문서함</h1>
<table class="table table-bordered table-hover dataTable">
	<tr>
		<th>문서번호</th>
		<th>구분</th>
		<th>제목</th>
		<th>기안자</th>
		<th>기안부서</th>
		<th>기안일</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.sdoc_num }</td>
			<td>${vo.doc_name }</td>
			<td>${vo.sdoc_title }</td>
			<td>${vo.emp_name }</td>
			<td>${vo.dept_name }</td>
			<td>${vo.sdoc_date }</td>
		</tr>
	</c:forEach>
</table>