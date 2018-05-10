<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript">
	$(function(){
		/* $("#sub1").click(function(){
			var NAME =$("#ACD_NAME").val()
			var GRADUATION=$("#datepicker").val()
			var MAJOR=$("#ACD_MAJOR").val()
			var SCORE=$("#ACD_SCORE").val()
			var EMP_NUM=$("#EMP_NUM").val()
			
			$.getJSON("<c:url value='/insertaca'/>",{"ACD_NAME":NAME, "ACD_GRADUATION":GRADUATION, "ACD_MAJOR":MAJOR, "ACD_SCORE":SCORE, "EMP_NUM":EMP_NUM},function(data){ //간단하게 줄여서 쓴 방식
					console.log(data)
					var acc=data.acc;
					if(acc=="success"){
						alert("학력이 추가되었습니다.");
						$('#aca').append();
						$('#ACD_NAME').val("");
						$('#datepicker').val("");
						$('#ACD_MAJOR').val("");
						$('#ACD_SCORE').val("");
					}else{
						alert("시스템 오류");
					}
			}); 
		}); */
		$("#datepicker").datepicker({
		      changeMonth: true,
		      changeYear: true
		    });
		$("#datepicker2").datepicker({
		      changeMonth: true,
		      changeYear: true
		    });
		$("#datepicker3").datepicker({
		      changeMonth: true,
		      changeYear: true
		    });
		$("#datepicker4").datepicker({
		      changeMonth: true,
		      changeYear: true
		    });
		
	});
</script>

<h1>${vo1.EMP_NAME } 님의 사원정보</h1>

<div class="input-group" style="width: 70%">
                <span class="input-group-addon" style="width: 15%">이름</span>
                <input type="text" class="form-control" placeholder="Name" value="${vo1.EMP_NAME }" disabled="disabled">
                <span class="input-group-addon" style="width: 15%">성별</span>
                <input type="text" class="form-control" placeholder="Gender" value="${vo1.EMP_GENDER}"disabled="disabled">
              </div>
<div class="input-group" style="width: 70%">
                <span class="input-group-addon" style="width: 15%">휴대전화</span>
                <input type="text" class="form-control" placeholder="Phone" value="${vo1.EMP_PHONE}" disabled="disabled">   
                <span class="input-group-addon" style="width: 15%">이메일</span>
                <input type="text" class="form-control" placeholder="Email" value="${vo1.EMP_EMAIL}" disabled="disabled"> 
              </div> 
<div class="input-group" style="width: 70%">
                <span class="input-group-addon" style="width: 15%">근무부서</span>
                <input type="text" class="form-control" placeholder="Dept" value="${vo6.DEPT_NAME}" disabled="disabled">   
              </div> 
<div class="input-group" style="width: 70%">
                <span class="input-group-addon" style="width: 15%">직위</span>
                <input type="text" class="form-control" placeholder="Position" value="${vo5.PST_NAME}" disabled="disabled"> 
                <span class="input-group-addon" style="width: 15%">입사일</span>
                <input type="text" class="form-control" placeholder="Hiredate" value="${vo1.EMP_HIREDATE}" disabled="disabled">
                   
              </div>  

<div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class=""><a href="#academic" data-toggle="tab" aria-expanded="true">학력</a></li>
              <li class="active"><a href="#career" data-toggle="tab" aria-expanded="false">경력</a></li>
              <li class=""><a href="#history" data-toggle="tab" aria-expanded="false">근무이력</a></li>
            </ul>
            
            <!-- 탭 -->
            <div class="tab-content">
             <!-- 학력 -->
              <div class="tab-pane" id="academic">           
              <div class="box">
            <div class="box-header">
              <h3 class="box-title">학력</h3>

            </div>
            <!-- /.box-header -->
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
              	
              	<c:forEach var="vo2" items="${vo2 }">
                <tr>
                  <td>${vo2.ACD_NUM}</td>
                  <td>${vo2.ACD_NAME}</td>
                  <td>${vo2.ACD_GRADUATION}</td>
                  <td><span class="label label-warning">${vo2.ACD_MAJOR}</span></td>
                  <td>${vo2.ACD_SCORE}</td>
                  <td><a href="<c:url value='/delacademic?ACD_NUM=${vo2.ACD_NUM}'/>">삭제</a></td>
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
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>
              
              
              
			<!--/학력--></div>
			
			<!-- 경력  -->
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
              	
              	<c:forEach var="vo3" items="${vo3 }">
                <tr>
                  <td>${vo3.CRR_NUM}</td>
                  <td>${vo3.CRR_NAME}</td>
                  <td>${vo3.CRR_DEPT}</td>
                  <td>${vo3.CRR_POSITION}</td>
                  <td>${vo3.CRR_WORK}</td>
                  <td>${vo3.CRR_SDATE}</td>
                  <td>${vo3.CRR_EDATE}</td>
                  <td><a href="<c:url value='/delcareer?CRR_NUM=${vo3.CRR_NUM}'/>">삭제</a></td>
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
              </div><!-- //경력 -->

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
              	
              	<c:forEach var="vo4" items="${vo4 }">
                <tr>
                  <td>${vo4.HIS_NUM}</td>
                  <td>${vo4.HIS_DATE}</td>
                  <td>${vo4.HIS_DEPT}</td>
                  <td>${vo4.HIS_POSITION}</td>
                  <td>${vo4.HIS_WORK}</td>
                  <td><a href="<c:url value='/delhis?HIS_NUM=${vo4.HIS_NUM}'/>">삭제</a></td>
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
              </div><!-- 근무이력 -->
              
              
              <!--탭 콘텐츠 /.tab-pane -->
            </div>
            <!--전체 탭 /.tab-content -->
          </div>
          


   
   
   
