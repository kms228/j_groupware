<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function(){
	$("#datepicker").datepicker({
	      changeMonth: true,
	      changeYear: true
	    });

});
</script>
<h3>${vo1.EMP_NAME }님의 회원정보입니다.</h3>
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
            <input type="text" class="form-control" placeholder="ADDR" name="EMP_ADDR" value="${vo1.EMP_ADDR }" >
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
     		<input type="submit" id="updateEmp" value="사원정보수정하기">
     		<input type="reset" id="updateEmp" value="사원정보수정취소">
     </div>
     <input type="hidden" name="EMP_NUM" value="${vo1.EMP_NUM }">
     </form>
     <!-- //////////////////////////////////////////////////////// -->
     <!-- 사원계정 -->
      <form action="<c:url value='/updateAccount'/>">
      <div class="input-group" style="width: 70%">
            <span class="input-group-addon" style="width: 15%">아이디</span>
            <input type="text" class="form-control" placeholder="ID" value="${vo2.ACNT_id }" disabled="disabled">
            <span class="input-group-addon" style="width: 15%">비밀번호</span>
            <input type="text" class="form-control" placeholder="LEVEL" value="${vo2.ACNT_pwd}"disabled="disabled">
            <span class="input-group-addon" style="width: 15%">권한레벨</span>
            <input type="text" class="form-control" placeholder="LEVEL" value="${vo2.ACNT_level}"disabled="disabled">
      </div>
      		<input type="submit" id="updateAccount" value="계정수정하기">
      		<input type="hidden" value="${vo1.EMP_NUM }">
      </form>
      
      
      
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
                  <td>${vo2.ACD_SCORE}</td>
                  <td><a href="<c:url value='/delacademic?ACD_NUM=${vo5.ACD_NUM}'/>">삭제</a></td>
                  <td></td>
                </tr>
                </c:forEach>

                <div box-header ui-sortable-handle id="aca">
                <form action="<c:url value='/insertaca'/>">
                <tr>
                  <td></td> 
                  <td><input type="text" class="form-control" placeholder="학교명" id="ACD_NAME" name="ACD_NAME"></td>
                  <td><input type="text" class="form-control" placeholder="졸업일" id="datepicker" name="ACD_GRADUATION"></td>
                  <td><input type="text" class="form-control" placeholder="전공" id="ACD_MAJOR" name="ACD_MAJOR"></td>
                  <td><input type="number" class="form-control" placeholder="학점" id="ACD_SCORE" name="ACD_SCORE"></td>
                  <td><input type="submit" class="form-control" id="sub11" value="등록" ></td>
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
                  <td><a href="<c:url value='/delcareer?CRR_NUM=${vo6.CRR_NUM}'/>">삭제</a></td>
                  <td></td>			
                </tr>
                </c:forEach>
               
                
                <div box-header ui-sortable-handle id="carrer">
                <form action="<c:url value='/insertcarrer'/>">
                <tr>
                  <td></td> 
              
                  <td><input type="text" class="form-control" placeholder="직장명" id="CRR_NAME" name="CRR_NAME"></td>
                  <td><input type="text" class="form-control" placeholder="부서명" id="CRR_DEPT" name="CRR_DEPT"></td>
                  <td><input type="text" class="form-control" placeholder="직위" id="CRR_POSITION" name="CRR_POSITION"></td>
                  <td><input type="text" class="form-control" placeholder="담당업무" id="CRR_WORK" name="CRR_WORK"></td>
                  <td><input type="text" class="form-control" placeholder="입사일" id="datepicker2" name="CRR_SDATE"></td>
                  <td><input type="text" class="form-control" placeholder="퇴사일" id="datepicker3" name="CRR_EDATE"></td>
               
                  <td><input type="submit" class="form-control" id="insertcarrer" value="등록" ></td>
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
              	
              	<c:forEach var="vo4" items="${vo7 }">
                <tr>
                  <td>${vo7.HIS_NUM}</td>
                  <td>${vo7.HIS_DATE}</td>
                  <td>${vo7.HIS_DEPT}</td>
                  <td>${vo7.HIS_POSITION}</td>
                  <td>${vo7.HIS_WORK}</td>
                  <td><a href="<c:url value='/delhis?HIS_NUM=${vo7.HIS_NUM}'/>">삭제</a></td>
                  <td></td>			
                </tr>
                </c:forEach>
               
                
                <div box-header ui-sortable-handle id="inserthis">
                <form action="<c:url value='/inserthis'/>">
                <tr>
                  <td></td> 
              
                  <td><input type="text" class="form-control" placeholder="근무시작일" id="datepicker4" name="HIS_DATE"></td>
                  <td><input type="text" class="form-control" placeholder="근무부서" id="HIS_DEPT" name="HIS_DEPT"></td>
                  <td><input type="text" class="form-control" placeholder="직위" id="HIS_POSITION" name="HIS_POSITION"></td>
                  <td><input type="text" class="form-control" placeholder="담당업무" id="HIS_WORK" name="HIS_WORK"></td>
               
                  <td><input type="submit" class="form-control" id="inserthis" value="등록" ></td>
                </tr>
                  </form>
    			
                </div>
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>
              </div>
             <!-- 근무이력 -->
      
      
      
      
      
      
      
      
      
      
      
      
      
      