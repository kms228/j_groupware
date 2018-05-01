<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<script type="text/javascript">
	$(function () {
		
		$("#").on('click',function(){
			var ACD_NAME 
			var ACD_MAJOR
			var ACD_SCORE
			var ACD_GRADUATION
			
		});
	});

</script>



<h1>사원정보</h1>

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
              <li class=""><a href="#academic" data-toggle="tab" aria-expanded="false">학력</a></li>
              <li class="active"><a href="#career" data-toggle="tab" aria-expanded="true">경력</a></li>
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
                <c:forEach var="vo2" items="${list2 }">
                <tr>
                  <td>${vo2.ACD_NUM}</td>
                  <td>${vo2.ACD_NAME}</td>
                  <td>${vo2.ACD_GRADUATION}</td>
                  <td><span class="label label-warning">${vo2.ACD_MAJOR}</span></td>
                  <td><a href="<c:url value='/board/delete?num=${vo2.ACD_NUM}'/>">삭제</a></td>
                  <td></td>
                </tr>
                </c:forEach>
                
                <div box-header ui-sortable-handle>
                <form action="<c:url value='/board/list'/>" method="post">
                <tr>
                  <td></td>
                  <td><input type="text" class="form-control" placeholder="학교명" name="vo2.ACD_NAME"></td>
                  <td><input type="text" class="form-control" placeholder="졸업일" name="ACD_GRADUATION"></td>
                  <td><input type="text" class="form-control" placeholder="전공" name="vo2.ACD_MAJOR"></td>
                  <td><input type="text" class="form-control" placeholder="학점" name="vo2.ACD_SCORE"></td>
                  <td><input type="submit" class="form-control" value="등록" ></td>
                </tr>
                 </form>
                </div>
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>
              
              
              
			<!--/학력--></div>
			
			
			
			
			
			
              <div class="tab-pane active" id="career">  
              <span>경력</span>
              <span>${vo3.CRR_WORK}</span>       
              </div>

              <div class="tab-pane" id="history">
              <span>근무이력</span>
              <span>${vo4.HIS_DEPT}</span>
              </div>
              
              <!--탭 콘텐츠 /.tab-pane -->
            </div>
            <!--전체 탭 /.tab-content -->
          </div>
          


   
   
   
