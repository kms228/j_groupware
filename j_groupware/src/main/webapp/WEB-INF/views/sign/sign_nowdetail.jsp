<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>진행확인</h1>
<h3>&#91;문서종류:구매요청서&#93;</h3>
<p class="bg-warning">${signdetail.sdoc_title }</p>
<div>
	<div id="signline">
		<table class="table table-bordered">
				<c:forEach var="vo" items="${sdocline }">
			<tr>
				<td width="100px"><div id="${vo.emp_num }">${vo.emp_name } ${vo.pst_name }</div></td>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${vo.sline_state==1 }">
					<td>결재완료</td>
					</c:when>
					<c:otherwise>
					<td>결재중....</td>
					</c:otherwise>
				</c:choose>
			</tr>
				</c:forEach>
		</table>
	</div>
	${signdetail.sdoc_content }
</div>