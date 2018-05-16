<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<h1>${vo.b_writer } 님의 공지사항</h1>
<form method="post" name="frm" action="<c:url value='/updateNboard'/>">
<div class="input-group" style="width: 70%">
                <span class="input-group-addon" style="width: 15%">작성자</span>
                <input type="text" class="form-control" placeholder="Name" name="b_writer" value="${vo.b_writer }" readonly="readonly">
                <span class="input-group-addon" style="width: 15%">게시번호</span>
                <input type="text" class="form-control" placeholder="Gender" name="b_num" value="${vo.b_num}" readonly="readonly">
              </div>
<div class="input-group" style="width: 70%">
                <span class="input-group-addon" style="width: 15% ">제목</span>
                <input type="text" class="form-control" placeholder="Gender" name="b_title" value="${vo.b_title}">        
              </div>             
<div class="input-group" style="width: 70%">
                <span class="input-group-addon" style="width: 15% ;height: 70%">내용</span>
                <textarea class="form-control" rows="3"  style="height: 70%" name="b_content" placeholder="공지사항내용을 입력해주세요." >${vo.b_content}</textarea>       
              </div> 

			<c:choose >
			<c:when test="${vo.emp_num==emp_num}">			
			<button type="submit" class="btn btn-block btn-primary" style="width: 15%">공지사항 수정하기</button>
			</form>
			
			<a href="<c:url value='/deleteNboard?b_num=${vo.b_num}'/>">
			<button type="button" class="btn btn-block btn-primary" style="width: 15%">공지사항 삭제하기</button>
			</a>
			</c:when>  
			</c:choose>   
			
			
			
			
			    