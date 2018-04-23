<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




	<h1>${EMP_NAME}님의 개인정보입니다.</h1>

		<form method="post"  action="<c:url value='/memUpdate'/>">
			<div class="form-group">
               <label for="ID">ID(*)</label>
               <input type="text" class="form-control" id="id" name="ACNT_ID" placeholder="id" required="required" value="${ACNT_ID}" readonly="readonly">
               <span id="idchk"></span>
            </div>
            <div class="form-group">
              <!--  <label for="PWD">PWD(*)</label> --> 
               <div class="row">
               <div class="col-xs-4">
               <label for="PWD">PWD1(*)</label>
               <input type="password"class="form-control" id="pwd1" name="ACNT_PWD" value="${ACNT_PWD}" placeholder="PWD입력" required="required">
               </div>
               <div class="col-xs-4">
               <label for="PWD">PWD2(*)</label>
               <input type="password" class="form-control" id="pwd2" name="ACNT_PWD2" value="${ACNT_PWD}" placeholder="PWD확인" required="required">
               </div> 
               </div>
               <span id="pwdchk"></span>
            </div>
            <div class="form-group">
               <label for="email">EMAIL(*)</label>
               <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
               <input type="email" class="form-control" id="email" name="EMP_EMAIL" placeholder="EMAIL" required="required" value="${EMP_EMAIL}" >
               </div>
               <span id="emailchk"></span>
            </div>
             <div class="form-group">
               <label for="NAME">NAME(*)</label>
               <input type="text" class="form-control"  name="EMP_NAME" placeholder="NAME" required="required" value="${EMP_NAME}">
            </div>
            <!--  
            <div class="form-group">
                <label>BITRHDAY</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text"  name="EMP_BIRTH" class="form-control pull-right"  required="required" value="${EMP_BIRTH}">
                </div>
              </div>
               -->
             <div class="form-group">
               <label for="PHONE">PHONE</label>
               <input type="text" class="form-control"  name="EMP_PHONE" placeholder="PHONE" value="${EMP_PHONE}">
            </div> 
            <div class="form-group">
               <label for="ADDR">ADDR</label>
               <div class="input-group">
               <input type="text" class="form-control"  id="address"name="EMP_ADDR" placeholder="ADDR" value="${EMP_ADDR}" >
               <span class="input-group-btn">
               <button type="button" class="btn btn-info btn-flat" onclick="postcode()">SearchAddress</button>
               </span>
               </div>
            </div>
            <div class="form-group">
            <label>성별선택</label>
            <select class="form-control select2 select2-hidden-accessible" name="EMP_GENDER" style="width: 50%;"tabindex="-1" aria-hidden="true">
            	<option value="${EMP_GENDER}">${EMP_GENDER}</option>
            	<option value="MAN">MAN</option>
            	<option value="WOMAN" >WOMAN</option>
            </select>
            </div>
            
            <button type="submit" class="btn btn-primary">회원 정보 수정</button>
            <button type="reset" class="btn btn-primary">회원 정보 취소</button> 

            <input type="hidden" name="EMP_NUM" value="${EMP_NUM}">
            </form>
            
                           
            
           











