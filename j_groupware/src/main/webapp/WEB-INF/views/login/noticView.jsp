<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<h1>${vo.b_writer } 님의 공지사항</h1>

<div class="input-group" style="width: 70%">
                <span class="input-group-addon" style="width: 15%">작성자</span>
                <input type="text" class="form-control" placeholder="Name" value=">${vo.b_writer }" disabled="disabled">
                <span class="input-group-addon" style="width: 15%">게시번호</span>
                <input type="text" class="form-control" placeholder="Gender" value="${vo.b_num}"disabled="disabled">
              </div>
<div class="input-group" style="width: 70%">
                <span class="input-group-addon" style="width: 15%">내용</span>
                <textarea class="form-control" rows="3" placeholder="Enter ...">${vo.b_content}</textarea>        
              </div> 
              
	