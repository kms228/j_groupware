<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	 <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i><span>결재</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="<c:url value='/'/>signnew"><i class="fa fa-circle-o"></i>새문서작성</a></li>
            <li><a href="<c:url value='/nowlist'/>"><i class="fa fa-circle-o"></i>진행결재문서</a></li>
             <li><a href="<c:url value='/signlist'/>"><i class="fa fa-circle-o"></i>결재문서함</a></li>
             <li><a href="<c:url value='/oklist'/>"><i class="fa fa-circle-o"></i>완료문서함</a></li>
          </ul>
        </li>
         <!-- ------------------------------------------------------민수-------------------------------------------------- -->
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>근태</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">

            <li><a href="<c:url value='/requestWork/${emp_num }'/>"><i class="fa fa-circle-o"></i> 근태 신청</a></li>
            <li><a href="<c:url value='/requestWorkList'/>"><i class="fa fa-circle-o"></i> 신청 내역</a></li>
            <li><a href="<c:url value='/responseWorkList'/>"><i class="fa fa-circle-o"></i> 승인 요청 내역</a></li>
            <li><a href="<c:url value='/work'/>"><i class="fa fa-circle-o"></i> 근태 현황 보기</a></li>
            <li><a href="<c:url value='/setWork'/>"><i class="fa fa-circle-o"></i> (관리자)근태 설정</a></li>
            <li><a href="<c:url value='/workList'/>"><i class="fa fa-circle-o"></i> (관리자)전체 리스트</a></li>
          </ul>
        </li>
        <!-- 
        <li class="treeview">
          <a href="#">
            <i class="fa fa-edit"></i> <span>Forms</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/forms/general.html"><i class="fa fa-circle-o"></i> General Elements</a></li>
            <li><a href="pages/forms/advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
            <li><a href="pages/forms/editors.html"><i class="fa fa-circle-o"></i> Editors</a></li>
          </ul>
        </li>
         -->
        <li class="treeview">
          <a href="#">
            <i class="fa fa-table"></i> <span>사원관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<c:url value='/emplist'/>"><i class="fa fa-circle-o"></i>재직자 리스트</a></li>
            <li><a href="<c:url value='/retirelist'/>"><i class="fa fa-circle-o"></i>퇴직자 리스트</a></li>
          </ul>
        </li>
        <li>
          <a href="<c:url value='/'/>calendar">
            <i class="fa fa-calendar"></i> <span>일정</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-red"></small>
              <small class="label pull-right bg-blue"></small>
            </span>
          </a>
        </li>
        <!-- <li>
          <a href="pages/mailbox/mailbox.html">
            <i class="fa fa-envelope"></i> <span>Mailbox</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-yellow">12</small>
              <small class="label pull-right bg-green">16</small>
              <small class="label pull-right bg-red">5</small>
            </span>
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-folder"></i> <span>Examples</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/examples/invoice.html"><i class="fa fa-circle-o"></i> Invoice</a></li>
            <li><a href="pages/examples/profile.html"><i class="fa fa-circle-o"></i> Profile</a></li>
            <li><a href="pages/examples/login.html"><i class="fa fa-circle-o"></i> Login</a></li>
            <li><a href="pages/examples/register.html"><i class="fa fa-circle-o"></i> Register</a></li>
            <li><a href="pages/examples/lockscreen.html"><i class="fa fa-circle-o"></i> Lockscreen</a></li>
            <li><a href="pages/examples/404.html"><i class="fa fa-circle-o"></i> 404 Error</a></li>
            <li><a href="pages/examples/500.html"><i class="fa fa-circle-o"></i> 500 Error</a></li>
            <li><a href="pages/examples/blank.html"><i class="fa fa-circle-o"></i> Blank Page</a></li>
            <li><a href="pages/examples/pace.html"><i class="fa fa-circle-o"></i> Pace Page</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-share"></i> <span>Multilevel</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
            <li>
              <a href="#"><i class="fa fa-circle-o"></i> Level One
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Level Two
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                  </a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
          </ul>
        </li>
        <li><a href="documentation/index.html"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
        <li class="header">LABELS</li>
        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li> -->
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  
    <!-- The Right Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
	<!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active" id="userTab"><a href="#" id="userAnchor"><i class="fa fa-users"></i></a></li>
      <li id="chatTab"><a href="#" id="chatAnchor" ><i class="fa fa-commenting"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Contacts are loaded here -->
      <div class="tab-pane active" id="control-sidebar-users-tab">
	  <!-- <div class="direct-chat-contacts"> -->
	   <!--  <ul class="contacts-list"> -->
	    <ul class="control-sidebar-menu" id="userList">
		  <!-- <li>
		    <a href="#">				          
			  <i class="menu-icon fa fa-birthday-cake bg-red"></i>		    
			  <img class="contacts-list-img" src="https://vignette.wikia.nocookie.net/undertale/images/e/ef/Reunited.png/revision/latest?cb=20160211165705" alt="User Image">
			    <div class="contacts-list-info">
			      <span class="contacts-list-name">Count Dracula<small class="contacts-list-date pull-right">2/28/2015</small></span>
			      <span class="contacts-list-msg">How have you been? I was...</span>
			    </div>
			</a>
		  </li> -->
		  <!-- End Contact Item -->
		</ul>
		<!-- /.contatcts-list -->
	  </div>
	  <!-- /.direct-chat-pane -->
 
      <div class="tab-pane direct-chat-primary" id="control-sidebar-chatting-tab">
      	<div class="box-body" id="chatContents" style="overflow:auto; height:700px;">      	      	
        <!-- <h3 class="control-sidebar-heading">사람 이름</h3> -->		
						  
		</div>              
		<!-- box body -->
		
		<div class="box-footer" style="background-color:#222d32;">
              <form action="#" method="post" id="realChat">
                <div class="input-group">
                  <input type="text" name="message" placeholder="Type Message ..." class="form-control" id="chatContent">
                      <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary btn-flat" id="send1">전송</button>
                      </span>
                </div>
              </form>
        </div>
        <!-- /.box-footer-->		                	   
      </div>
      <!-- /.tab-pane -->            
   </div>    
   <!-- Content of the sidebar goes here -->   
</aside>
<!-- The sidebar's background -->
<!-- This div must placed right after the sidebar for it to work-->
<div class="control-sidebar-bg"></div>

<script>
	$("#userAnchor").click(function(){
		$("#chatTab").removeClass("active");
		$("#userTab").addClass("active");		
		$("#control-sidebar-chatting-tab").removeClass("active");
		$("#control-sidebar-users-tab").addClass("active");
		globalAcnt_id = '';
	});
	/* $("#chatAnchor").click(function(){
		$("#userTab").removeClass("active");
		$("#chatTab").addClass("active");
		$("#control-sidebar-users-tab").removeClass("active");
		$("#control-sidebar-chatting-tab").addClass("active");
	}); */
</script>
  
  <script type="text/javascript">
  
  </script>
</div>