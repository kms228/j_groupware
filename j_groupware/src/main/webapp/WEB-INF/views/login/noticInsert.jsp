<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<h1>공지사항 작성하기</h1>

<form method="post" name="frm"  action="<c:url value='/insertNboard'/>">
<div class="input-group" style="width: 70%">
                <span class="input-group-addon" style="width: 15%">작성자</span>
                <input type="text" class="form-control" placeholder="Name" id="b_writer" name="b_writer">
                </div>
<div class="input-group" style="width: 70%">
                <span class="input-group-addon" style="width: 15%">글제목</span>
                <input type="text" class="form-control" placeholder="Title" id="b_title" name="b_title">
                </div>                
<div class="input-group" style="width: 70%">
                <span class="input-group-addon" style="width: 15% ;height: 70%">내용</span>
                <textarea class="form-control" rows="3" style="height: 70%" id="b_content" name="b_content" placeholder="공지사항내용을 입력해주세요." ></textarea>        
                </div> 
			<div>
            </div>          
            <button  type="submit" class="btn btn-block btn-primary" style="width: 15%;">공지사항등록하기</button>
	