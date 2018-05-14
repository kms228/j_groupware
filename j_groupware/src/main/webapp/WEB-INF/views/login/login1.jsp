<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>
  <link rel="stylesheet" href="<c:url value='resources/css/login.css'/>">
<div class="col-sm-12" align="center" id="logcss">
    <div class="wrapper1">
    <form action="<c:url value='/'/>login" method="post" class="form-signin">       
      <h2 class="form-signin-heading">Please login</h2>
      <input type="text" class="form-control" name="ACNT_ID" placeholder="ID" required="" autofocus="" />
      <input type="password" class="form-control" name="ACNT_PWD" placeholder="PWD" required=""/> 
      <label >
      	<a href="<c:url value='/join'/>">JOIN</a><br>
        <a href="#">FORGET YOUR ID/PWD</a>
      </label>      
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
    </form>
  </div>
  </div>
  
  


