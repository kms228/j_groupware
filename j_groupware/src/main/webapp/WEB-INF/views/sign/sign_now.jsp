<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>진행문서함</h1>
<table class="table table-bordered table-hover dataTable">
	<tr>
		<th>번호</th>
		<th>구분</th>
		<th>제목</th>
		<th>기안자</th>
		<th>기안부서</th>
		<th>기안일</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.sdoc_num }</td>
			<td>문서이름</td>
			<td>${vo.sdoc_title }</td>
			<td>기안자이름</td>
			<td>기안부서</td>
			<td>${vo.sdoc_date }</td>
		</tr>
	</c:forEach>
</table>