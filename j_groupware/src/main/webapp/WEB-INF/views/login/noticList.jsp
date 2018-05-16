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
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">제목</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">작성자</th>
									<th class="sorting" tabindex="0" aria-controls="example1"rowspan="1" colspan="1">작성일</th>
								</tr>
							</thead>
							<tbody>
		
									<c:forEach items="${list}" var="board">
									<tr role="row">
										<th>${board.b_num}</th>															
										<td><a href="<c:url value='/nboardselect?B_NUM=${board.b_num}'/>">${board.b_title}</a></td>							
										<th>${board.b_writer}</th>								
										<th>${board.b_date}</th>		
									</tr>
									</c:forEach>

												
							</tbody>							
						</table>
					</div>
				</div>
			</div>
		</div>
		
			<c:choose >
			<c:when test="${ACNT_LEVEL =='0'}">
			<a href="<c:url value='/noticInsert'/>">
			<button type="button" class="btn btn-block btn-primary" style="width: 15%">새 공지등록하기</button>
			</a>
			</c:when>
			</c:choose>
		
		<!-- /.box-body -->
	</div>
            