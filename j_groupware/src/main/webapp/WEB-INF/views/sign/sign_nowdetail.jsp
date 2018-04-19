<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>진행확인</h1>
<h3>&#91;문서종류:구매요청서&#93;</h3>
<p class="bg-warning">문서 제목 표시</p>
<div>
	<div id="signline">
		<table border="1" class="table table-bordered">
			<tr>
				<td rowspan="2" width="100px"><b>결재</b></td>
				<c:forEach var="vo" items="${sdocline }">
					<td width="100px"><div id="${vo.emp_num }">${vo.emp_name } ${vo.pst_name }</div></td>
				</c:forEach>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	${signdetail.sdoc_content }
</div>