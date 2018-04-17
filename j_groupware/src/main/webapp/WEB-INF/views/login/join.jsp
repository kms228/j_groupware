<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<script type="text/javascript">
	$(function(){	
		
	$("#pwd2").on('keyup',function(){
			var pwd=$("#pwd1").val()
			var pwd2=$("#pwd2").val()
			console.log(pwd);
			if(pwd==pwd2){
				$('#pwdchk').html("비밀번호확인");
			}else{
				$('#pwdchk').html("비밀번호 다름 ");
			}
		
	});	
	$("#idchk").on('keyup',function(){
		var id=$("#id").val()
		$.ajax({
			url:"<c:url value='/join/usingid/"+id+"'/>",
			dataType:"json",
			success:function(data){
				var using=data.id;
				console.log(using);
				if(using=='true'){
					$('#result	').html("사용중입니다.");
				}else{
					$('#result').html("사용가능합니다.");
				}
			}
		});
	});
});
</script>

	<h1>사원등록하기</h1>
	<form method="post" action="<c:url value='/join'/>">
		<table style="margin-top: 40px;">
			<tr>
				<th >아이디(*)</th>
				<td id="idchk"><input type="text" name="ACNT_ID" required="required"></td>
				<td><span id="result"></span></td>
			</tr>
			<tr>
				<th>비밀번호(*)</th>
				<td><input type="password" id="pwd1" name="ACNT_PWD" required="required"></td>
			</tr>
			<tr>
				<th>비밀번호확인(*)</th>
				<td><input type="password" id="pwd2" name="ACNT_PWD2" required="required"></td>
				<td><span id="pwdchk"></span></td>
			</tr>
			<tr>
				<th>사원이름(*)</th>
				<td><input type="text" name="EMP_NAME" required="required">
				<td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="EMP_PHONE">
				<td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="EMP_ADDR" name="EMP_ADDR" placeholder="상세주소"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="EMP_BIRTH">
				<td>
			</tr>
			<tr>
				<th>이메일주소</th>
				<td><input type="email" name="EMP_EMAIL" ></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><select name="EMP_GENDER">
					<option value="">성별</option>
					<option value="male">남자</option>
					<option value="female">여자</option>
				</select>
				<td>
			</tr>
			<tr>
				<th></th><td><input type="submit" value="가입">(*)은 필수입력사항입니다.</td>
			</tr>
		</table>

	</form>









