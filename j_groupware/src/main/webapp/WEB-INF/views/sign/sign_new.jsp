<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
<h1>새문서 양식</h1>
<table class="table table-bordered" style="border-color: black;">
	<thead>
		<tr>
			<th style="width: 200px;">이름</th>
			<th>설명</th>	
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><a href="<c:url value='/'/>signwrite?num=1">01.업무일지</a></td>
			<td>업무일지문서</td>
		</tr>
		<tr>
			<td><a href="<c:url value='/'/>signwrite?num=21">02.기안서</a></td>
			<td></td>
		</tr>
		<tr>
			<td><a href="<c:url value='/'/>signwrite?num=22">03.회의록/보고서</a></td>
			<td></td>
		</tr>
	</tbody>
</table>
</div>
