<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<div class="col-sm-12" align="center" id="logcss">
    <div class="wrapper1">
    <form action="<c:url value='/'/>login" method="post" class="form-signin">       

      <h2 class="form-signin-heading">Please login</h2>
      <input type="text" class="form-control" name="ACNT_ID" placeholder="ID" required="" autofocus="" />
      <input type="password" class="form-control" name="ACNT_PWD" placeholder="PWD" required=""/> 
   
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
    </form>
  </div>
  </div>
  
  


