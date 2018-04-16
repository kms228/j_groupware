<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<c:url value='/'/>resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
	$("#id").on('keypress',function(){
		var id=("#id").val()
		ajax({
			url:"<c:url value='/join/usingid/"+id+"'/>",
			dataType:"json",
			success:function(data){
				var using=data.id;
				if(using='ture'){
					$('#result').append("사용중입니다.");
				}else{
					$('#reslut').append("사용가능합니다.");
				}
			}
		});
	});
});
</script>
</head>
<body>
	<h1>사원등록하기</h1>
	<form action="<c:url value='/'/>join?addr=" method="get">
		<table style="margin-top: 40px;">
			<tr>
				<th>아이디(*)</th>
				<td><input type="text" id="id" name="ACNT_ID" required="required"></td>
				<td><span id="reslut"></span></td>
			</tr>
			<tr>
				<th>비밀번호(*)</th>
				<td><input type="password" name="ACNT_PWD" required="required"></td>
			</tr>
			<tr>
				<th>비밀번호확인(*)</th>
				<td><input type="password" name="ACNT_PWD2" required="required"></td>
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
				<td><input type="text" id="sample4_postcode" name="addr" placeholder="우편번호"></td>
				<td><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td>
				<tr></tr><th></th>
				<td><input type="text" id="sample4_roadAddress" name="addr" placeholder="도로명주소"></td>
				<td><input type="text" id="addr" placeholder="상세주소"></td>
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
				<td><select>
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
		<input type="hidden" name="PST_NUM" value="7">
		<input type="hidden" name="DEPT_NUM" value="0">
		<input type="hidden" name="TEAM_NUM" value="1">
	</form>
</body>
</html>


</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>







