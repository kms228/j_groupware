<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	$("#datepicker").datepicker({
	      changeMonth: true,
	      changeYear: true
	    });
	$("#datepicker4").datepicker({
	      changeMonth: true,
	      changeYear: true
	    });

});

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

<h3>${vo1.EMP_NAME }님의 퇴직자정보 입니다.</h3>
	<!-- 사원개인정보 -->
	<form action="<c:url value='/updateEmp'/>">
	<div class="input-group" style="width: 70%">
            <span class="input-group-addon" style="width: 15%">이름</span>
            <input type="text" class="form-control" placeholder="Name" name="EMP_NAME" value="${vo1.EMP_NAME }" >
            <span class="input-group-addon" style="width: 15%">성별</span>
            <select  class="form-control" id="province" name="EMP_GENDER" >
		    <option value="${vo1.EMP_GENDER}">${vo1.EMP_GENDER}</option>                                                     
		    <option value="MAN">MAN</option>
		    <option value="WOMAN">WOMAN</option>                                       
		    </select> 
            
     </div>
     <div class="input-group" style="width: 70%">
            <span class="input-group-addon" style="width: 15%">휴대전화</span>
            <input type="text" class="form-control" placeholder="PHONE" name="EMP_PHONE"value="${vo1.EMP_PHONE }" >
            <span class="input-group-addon" style="width: 15%">이메일</span>
            <input type="text" class="form-control" placeholder="EMAIL" name="EMP_EMAIL" value="${vo1.EMP_EMAIL }">
     </div>
     <div class="input-group" style="width: 70%">
            <span class="input-group-addon" style="width: 15%">생년월일</span>
            <input type="text" class="form-control" placeholder="BIRTH " id="datepicker"  name="EMP_BIRTH" value="${vo1.EMP_BIRTH }" >
            <span class="input-group-addon" style="width: 15%">입사일</span>
            <input type="text" class="form-control" placeholder="HIREDATE" id="datepicker"  name="EMP_HIREDATE" value="${vo1.EMP_HIREDATE }">
     </div>
     <div class="input-group" style="width: 70%">
            <span class="input-group-addon" style="width: 15%">주소</span>
			<div class="input-group">
            <input type="text" class="form-control" placeholder="ADDR" id="address" name="EMP_ADDR" value="${vo1.EMP_ADDR }" >
            <span class="input-group-btn">
            <button type="button" class="btn btn-info btn-flat" onclick="postcode()">주소찾기</button>
            </span>
            </div>

     </div>
     <div class="input-group" style="width: 70%">
            <span class="input-group-addon" style="width: 15%">부서</span>   
            <select  class="form-control" id="province" name="DEPT_NUM" >
		    <option value="${vo1.DEPT_NUM }">${vo3.DEPT_NAME }</option>                                                     
		    <option value="1">총무팀</option>
		    <option value="2">경영지원팀</option>
		    <option value="3">인사팀</option>
		    <option value="4">기획팀</option>
		    <option value="5">영업팀</option>
		    <option value="6">품질관리팀</option>
		    <option value="7">미정</option>                                     
		    </select>
		       
            <span class="input-group-addon" style="width: 15%">직위</span>
            <select  class="form-control" id="province" name="PST_NUM" onchange="${vo1.PST_NUM}">
		    <option value="${vo4.PST_NUM}">${vo4.PST_NAME}</option>                                                     
		    <option value="1">사장</option>
		    <option value="2">부장</option>
		    <option value="3">차장</option>
		    <option value="4">과장</option>
		    <option value="5">대리</option>
		    <option value="6">주임</option>
		    <option value="7">사원</option>                                     
		    </select>
      </div>
     <div class="input-group" style="width: 70%">
     		<!-- <input type="submit" id="updateEmp" value="사원정보수정하기">
     		<input type="reset" id="updateEmp" value="사원정보수정취소"> -->
     </div>
     <input type="hidden" name="EMP_NUM" value="${vo1.EMP_NUM }">
     </form>
     <!-- //////////////////////////////////////////////////////// -->
     
     <!-- 사원계정 -->
      <form action="<c:url value='/updateAccount'/>">
      <div class="input-group" style="width: 70%">
            <span class="input-group-addon" style="width: 15%">아이디</span>
            <input type="text" class="form-control" placeholder="ID" name="ACNT_id" value="${vo2.ACNT_id }" disabled="disabled">
            <span class="input-group-addon" style="width: 15%">비밀번호</span>
            <input type="text" class="form-control" placeholder="LEVEL" name="ACNT_pwd" value="${vo2.ACNT_pwd}">
            <span class="input-group-addon" style="width: 15%">권한레벨</span>
            <input type="text" class="form-control" placeholder="LEVEL" name="ACNT_level" value="${vo2.ACNT_level}">
      </div>
      		<!--  <input type="submit" id="updateAccount" value="계정수정하기">-->
      		<input type="hidden" name="EMP_NUM" value="${vo1.EMP_NUM }">
      		<input type="hidden" name="ACNT_NUM" value="${vo2.ACNT_NUM }">
      </form>
      
      
      <!-- //////////////////////////////////////////////////////////// -->
      <!-- 학력정보 -->
       <div class="tab-pane" id="academic">           
              <div class="box">
            <div class="box-header">
              <h3 class="box-title">학력</h3>
            </div>
      <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody>
                <tr>
                  <th>no</th>
                  <th>학교명</th>
                  <th>졸업일</th>
                  <th>전공</th>
                  <th>학점</th>
                  <th>삭제</th>
                </tr>
              	
              	<c:forEach var="vo5" items="${vo5 }">
                <tr>
                  <td>${vo5.ACD_NUM}</td>
                  <td>${vo5.ACD_NAME}</td>
                  <td>${vo5.ACD_GRADUATION}</td>
                  <td><span class="label label-warning">${vo5.ACD_MAJOR}</span></td>
                  <td>${vo5.ACD_SCORE}</td>
                  <!--<td><a href="<c:url value='/delacademic2?ACD_NUM=${vo5.ACD_NUM}'/>">삭제</a></td> -->
                  <td></td>
                  <td></td>
                </tr>
                </c:forEach>

                <div box-header ui-sortable-handle id="aca">
                <form action="<c:url value='/insertaca2'/>">
                <tr>
                  <td></td> 
                  <td><input type="text" class="form-control" placeholder="학교명" id="ACD_NAME" name="ACD_NAME"></td>
                  <td><input type="text" class="form-control" placeholder="졸업일" id="datepicker" name="ACD_GRADUATION"></td>
                  <td><input type="text" class="form-control" placeholder="전공" id="ACD_MAJOR" name="ACD_MAJOR"></td>
                  <td><input type="number" class="form-control" placeholder="학점" id="ACD_SCORE" name="ACD_SCORE"></td>
                  <!-- <td><input type="submit" class="form-control" id="sub11" value="등록" ></td> -->
                  <td></td>
                  <input type="hidden" name="EMP_NUM" value="${vo1.EMP_NUM }">
                  </form>
                </tr>
                </div>
                	</tbody>
               		 </table>
               		   </div>
              		    </div>
              		     </div>
             
      			<!--/학력정보  -->
      			
      			<!-- 경력정보 -->
      			<div class="tab-pane active" id="career">           
				<div class="box">
            <div class="box-header">
              <h3 class="box-title">경력</h3>

            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody>
                <tr>
                  <th>no</th>
                  <th>직장명</th>
                  <th>부서명</th>
                  <th>직위</th>
                  <th>담당업무</th>
                  <th>입사일</th>
                  <th>퇴사일</th>
                  <th>삭제</th>
                </tr>
              	
              	<c:forEach var="vo6" items="${vo6 }">
                <tr>
                  <td>${vo6.CRR_NUM}</td>
                  <td>${vo6.CRR_NAME}</td>
                  <td>${vo6.CRR_DEPT}</td>
                  <td>${vo6.CRR_POSITION}</td>
                  <td>${vo6.CRR_WORK}</td>
                  <td>${vo6.CRR_SDATE}</td>
                  <td>${vo6.CRR_EDATE}</td>
                  <!-- <td><a href="<c:url value='/delcareer2?CRR_NUM=${vo6.CRR_NUM}'/>">삭제</a></td> -->
                  <td></td>
                  <td></td>			
                </tr>
                </c:forEach>
               
                
                <div box-header ui-sortable-handle id="carrer">
                <form action="<c:url value='/insertcarrer2'/>">
                <tr>
                  <td></td> 
              
                  <td><input type="text" class="form-control" placeholder="직장명" id="CRR_NAME" name="CRR_NAME"></td>
                  <td><input type="text" class="form-control" placeholder="부서명" id="CRR_DEPT" name="CRR_DEPT"></td>
                  <td><input type="text" class="form-control" placeholder="직위" id="CRR_POSITION" name="CRR_POSITION"></td>
                  <td><input type="text" class="form-control" placeholder="담당업무" id="CRR_WORK" name="CRR_WORK"></td>
                  <td><input type="text" class="form-control" placeholder="입사일" id="datepicker2" name="CRR_SDATE"></td>
                  <td><input type="text" class="form-control" placeholder="퇴사일" id="datepicker3" name="CRR_EDATE"></td>
                  <!-- <td><input type="submit" class="form-control" id="insertcarrer" value="등록" ></td> -->
                  <td></td>
                  <input type="hidden" name="EMP_NUM" value="${vo1.EMP_NUM }">
                </tr>
                  </form>
    			
                </div>
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>
              </div>
      		<!-- /경력정보 -->
      			
			<!-- 근무이력 -->
              <div class="tab-pane" id="history">
              <div class="box">
            <div class="box-header">
              <h3 class="box-title">근무이력</h3>

            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody>
                <tr>
                  <th>no</th>
                  <th>근무시작일</th>
                  <th>근무부서</th>
                  <th>직위</th>
                  <th>담당업무</th>
                </tr>
              	
              	<c:forEach var="vo7" items="${vo7 }">
                <tr>
                  <td>${vo7.HIS_NUM}</td>
                  <td>${vo7.HIS_DATE}</td>
                  <td>${vo7.HIS_DEPT}</td>
                  <td>${vo7.HIS_POSITION}</td>
                  <td>${vo7.HIS_WORK}</td>
                  <!-- <td><a href="<c:url value='/delhis2?HIS_NUM=${vo7.HIS_NUM}'/>">삭제</a></td> -->
                  <td></td>
                  <td></td>			
                </tr>
                </c:forEach>
               
                
                <div box-header ui-sortable-handle id="inserthis">
                <form action="<c:url value='/inserthis2'/>">
                <tr>
                  <td></td> 
              
                  <td><input type="text" class="form-control" placeholder="근무시작일" id="datepicker4" name="HIS_DATE"></td>
                  <td><select  class="form-control" id="Dept" name="HIS_DEPT" >
					    <option value="">부서를 선택하세요</option>                                                     
					    <option value="총무팀">총무팀</option>
					    <option value="경영지원팀">경영지원팀</option>
					    <option value="인사팀">인사팀</option>
					    <option value="기획팀">기획팀</option>
					    <option value="영업팀">영업팀</option>
					    <option value="품질관리팀">품질관리팀</option>
					    <option value="미정">미정</option>                                     
					    </select></td>
                  <td> <select  class="form-control" id="POSITION" name="HIS_POSITION" >
					    <option value="">직위를 선택하세요</option>                                                     
					    <option value="사원">사원</option>
					    <option value="주임">주임</option>
					    <option value="대리">대리</option>
					    <option value="과장">과장</option>
					    <option value="차장">차장</option>
					    <option value="부장">부장</option>
					    <option value="사장">사장</option>                                     
					    </select></td>
                  <td><input type="text" class="form-control" placeholder="담당업무" id="HIS_WORK" name="HIS_WORK"></td>
                  <!-- <td><input type="submit" class="form-control" id="inserthis" value="등록" ></td> -->
                  <td></td>
                  <input type="hidden" name="EMP_NUM" value="${vo1.EMP_NUM }">
                </tr>
                  </form>
    			
                </div>
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>
              </div>
             <!-- 근무이력 -->
      
      
      
			<!-- 퇴직처리 -->
              <div class="tab-pane" id="retire">
              <div class="box">
            <div class="box-header">
              <h3 class="box-title">퇴직처리</h3>

            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody>
                <tr>
                  <th>재 입사(퇴직보류)처리</th> 
                  <th></th>
                </tr>
              	
              
                <form action="<c:url value='/delre'/>">
                <tr>
                  <!-- <td><input type="text" class="form-control" placeholder="퇴직일을 선택해 주세요." id="datepicker" name="RE_DATE" style="width: 40%"></td> -->       
                  <input type="hidden" name="EMP_NUM" value="${vo1.EMP_NUM }">
                </tr>
                <tr>
                <td><input type="submit" class="form-control" id="inserthis" value="재입사(퇴직보류처리)" style="width: 40%"></td>
                </tr>
                  </form>
    			

              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>
              </div>
             <!-- 퇴직처리 -->      
      
      
      
      