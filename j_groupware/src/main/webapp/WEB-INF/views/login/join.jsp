<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<script type="text/javascript">
	$(function(){			
	var checkpwd=0;
	var checkid=0;
	var checkemail=0;
	$("#pwd2").on('keyup',function(){
			var pwd=$("#pwd1").val()
			var pwd2=$("#pwd2").val()
			console.log(pwd);
			if(pwd==pwd2){
				$('#pwdchk').html("비밀번호확인");
				checkpwd=0;
			}else{
				checklist=1;
				$('#pwdchk').html("비밀번호 다름 ");
				checkpwd=1;
			}
	});	
	$("#id").on('keyup',function(){
		var id=$("#id").val()
		$.ajax({
			url:"<c:url value='/join/usingid/"+id+"'/>",
			dataType:"json",
			success:function(data){
				var using=data.id;
				console.log(using);
				if(using!='true'){
					$('#idchk').html("사용가능합니다.");
					checkid=0;
				}else{
					checklist=1;
					$('#idchk').html("사용중입니다.");
					checkid=1;
				}
			}
		});
	});
	$("#email").on('keyup',function(){
		var email=$("#email").val()
		$.ajax({
			url:"<c:url value='/join/usingemail/"+email+"'/>",
			dataType:"json",
			success:function(data){
				var using=data.email;
				console.log(using);
				if(using!='true'){
					$('#emailchk').html("사용가능합니다.");
					checkemail=0;
					
				}else{
					checklist=1;
					$('#emailchk').html("사용중입니다.");
					checkemail=1;
				}
			}
		});
	});
	$("form").on('submit',function(){
		if(checkpwd==1){
			alert("비밀번호를 확인하세요");
			return false;
		}else if(checkid==1){
			alert("아이디를 확인하세요");
			return false;
		}else if(checkemail==1){
			alert("이메일을 확인하세요");
			return false;
		}else if(checkpwd==0 ||checkpwd==0 ||checkpwd==0 ){
			return true;
		}
	
	});
	
});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
var postcode = function(){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요. 
            // http://postcode.map.daum.net/guide

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('address').focus();
        }
    }).open();
}    
</script>

	<h1>사원등록하기</h1>
	<!-- 
		<form method="post" name="frm" onsubmit="return joinsubmit()" action="<c:url value='/join'/>">
		 -->
		<!--  
		<table style="margin-top: 40px;">
		-->
			<!-- 
			<tr>
				<th >아이디(*)</th>
				<td><input id="id" type="text" name="ACNT_ID" required="required"></td>
				<td><span id="idchk"></span></td>
			</tr>
			 -->
			 <!-- 
			<tr>
				<th>비밀번호(*)</th>
				<td><input type="password" id="pwd1" name="ACNT_PWD" required="required"></td>
			</tr>
			<tr>
				<th>비밀번호확인(*)</th>
				<td><input type="password" id="pwd2" name="ACNT_PWD2" required="required"></td>
				<td><span id="pwdchk"></span></td>
			</tr>
			 -->
			<!-- 
			<tr>
				<th>사원이름(*)</th>
				<td><input type="text" name="EMP_NAME" required="required">
				<td>
			</tr>
			<tr>
				<th>생년월일(*)</th>
				<td><input type="date" name="EMP_BIRTH" required="required">
				<td>
			</tr>
			 -->
			<!-- 
			<tr>
				<th>이메일주소(*)</th>
				<td><input id="email" type="email" name="EMP_EMAIL" ></td>
				<td><span id="emailchk"></span></td>
			</tr>
			 -->			
			 <!-- 
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
		-->
		<!-- 
	</form>
	 -->
	

		<form method="post" name="frm" onsubmit="return joinsubmit()" action="<c:url value='/join'/>">
			<div class="form-group">
               <label for="ID">ID(*)</label>
               <input type="text" class="form-control" id="id" name="ACNT_ID" placeholder="id" required="required">
               <span id="idchk"></span>
            </div>
            <div class="form-group">
              <!--  <label for="PWD">PWD(*)</label> -->
               <div class="row">
               <div class="col-xs-4">
               <label for="PWD">PWD1(*)</label>
               <input type="password"class="form-control" id="pwd1" name="ACNT_PWD" placeholder="PWD입력" required="required">
               </div>
               <div class="col-xs-4">
               <label for="PWD">PWD2(*)</label>
               <input type="password" class="form-control" id="pwd2" name="ACNT_PWD2" placeholder="PWD확인" required="required">
               </div> 
               </div>
               <span id="pwdchk"></span>
            </div>
            <div class="form-group">
               <label for="email">EMAIL(*)</label>
               <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
               <input type="email" class="form-control" id="email" name="EMP_EMAIL" placeholder="EMAIL" required="required" >
               </div>
               <span id="emailchk"></span>
            </div>
             <div class="form-group">
               <label for="NAME">NAME(*)</label>
               <input type="text" class="form-control"  name="EMP_NAME" placeholder="NAME" required="required">
            </div>
            <div class="form-group">
                <label>BITRHDAY</label>
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="date" name="EMP_BIRTH" class="form-control pull-right"  required="required">
                </div>
                <!-- /.input group -->
              </div>
             <div class="form-group">
               <label for="PHONE">PHONE</label>
               <input type="text" class="form-control"  name="EMP_PHONE" placeholder="PHONE"  >
            </div> 
            <div class="form-group">
               <label for="ADDR">ADDR</label>
               <div class="input-group">
               <input type="text" class="form-control"  id="address"name="EMP_ADDR" placeholder="ADDR" >
               <span class="input-group-btn">
               <button type="button" class="btn btn-info btn-flat" onclick="postcode()">SearchAddress</button>
               </span>
               </div>
            </div>
            <div class="form-group">
            <label>성별선택</label>
            <select class="form-control select2 select2-hidden-accessible" name="EMP_GENDER" style="width: 50%;"tabindex="-1" aria-hidden="true">
            	<option value="">선택</option>
            	<option value="MAN">MAN</option>
            	<option value="WOMAN" >WOMAN</option>
            </select>
            </div>
            <div>
            <button  type="submit" class="btn btn-block btn-primary" style="width: 30%;">Submit</button>
            </div>
            
            
            
            </form>
            
                           
            
           











