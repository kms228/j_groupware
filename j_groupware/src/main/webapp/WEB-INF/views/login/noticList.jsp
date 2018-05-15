<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>공지사항</h1>
<div class="box">
		<div class="box-body">
			<div id="example1_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap">
				<div class="row">
					<div class="col-sm-12">
						<table id="table3"
							class="table table-bordered table-striped dataTable" role="grid"
							aria-describedby="example1_info">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0" aria-controls="example1"rowspan="1" colspan="1" aria-sort="ascending">글번호</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">작성자</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">제목</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">작성일</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">삭제</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">상세보기</th>
								</tr>
							</thead>
							<tbody>
								<c:choose >
								
								<c:when test="${ACNT_LEVEL =='0'}">				
									<c:forEach items="${list }" var="list">
									<tr role="row">
										<th>${list.EMP_NUM}</th>															
										<th>${list.DEPT_NAME}</th>								
										<td><a href="<c:url value='/retireSelectView?EMP_NUM=${list.EMP_NUM}'/>">${list.EMP_NAME}</a></td>							
										<th>${list.PST_NAME}</th>
										<th>${list.EMP_EMAIL}</th>		
										<th>${list.EMP_HIREDATE}</th>
										<th>${list.RE_DATE}</th>															
									</tr>						
									</c:forEach>
								</c:when>
								
								<c:otherwise>
								<c:forEach items="${list }" var="list">
								<tr role="row">
									<th>${list.EMP_NUM }</th>															
									<th>${list.DEPT_NAME}</th>									
									<th>${list.EMP_NAME}</th>															
									<th>${list.PST_NAME}</th>
									<th>${list.EMP_EMAIL}</th>		
									<th>${list.EMP_HIREDATE}</th>
									<th>${list.RE_DATE}</th>
								</tr>						
								</c:forEach>
								</c:otherwise>						
								
								</c:choose>
												
							</tbody>							
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- /.box-body -->
	</div>
            