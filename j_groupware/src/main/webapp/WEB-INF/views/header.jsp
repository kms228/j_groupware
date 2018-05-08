<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header">
	<header class="main-header">
		<!-- Logo -->
		<a href="<c:url value='/'/>" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><b>J</b>-GroupWare</span>
		</a>				          				
		
		<!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top">
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<!-- Messages: style can be found in dropdown.less-->
<<<<<<< HEAD
              <!-- <li class="login-menu"><a href="<c:url value='/emplist'/>">사원리스트</a> -->
=======

>>>>>>> branch 'master' of https://github.com/kms228/j_groupware.git

            
            <!-- 
            <div class="dropdown-menu">
          DIRECT CHAT PRIMARY
          <div class="box box-primary direct-chat direct-chat-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Direct Chat</h3>

              <div class="box-tools pull-right">
                <span data-toggle="tooltip" title="3 New Messages" class="badge bg-light-blue">3</span>
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Contacts" data-widget="chat-pane-toggle">
                  <i class="fa fa-comments"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            /.box-header
            <div class="box-body">
              Conversations are loaded here
              <div class="direct-chat-messages">
                Message. Default to the left
                <div class="direct-chat-msg">
                  <div class="direct-chat-info clearfix">
                    <span class="direct-chat-name pull-left">Alexander Pierce</span>
                    <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
                  </div>
                  /.direct-chat-info
                  <img class="direct-chat-img" src="../dist/img/user1-128x128.jpg" alt="Message User Image">/.direct-chat-img
                  <div class="direct-chat-text">
                    Is this template really for free? That's unbelievable!
                  </div>
                  /.direct-chat-text
                </div>
                /.direct-chat-msg

                Message to the right
                <div class="direct-chat-msg right">
                  <div class="direct-chat-info clearfix">
                    <span class="direct-chat-name pull-right">Sarah Bullock</span>
                    <span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
                  </div>
                  /.direct-chat-info
                  <img class="direct-chat-img" src="../dist/img/user3-128x128.jpg" alt="Message User Image">/.direct-chat-img
                  <div class="direct-chat-text">
                    You better believe it!
                  </div>
                  /.direct-chat-text
                </div>
                /.direct-chat-msg
              </div>
              /.direct-chat-messages

              Contacts are loaded here
              <div class="direct-chat-contacts">
                <ul class="contacts-list">
                  <li>
                    <a href="#">
                      <img class="contacts-list-img" src="../dist/img/user1-128x128.jpg" alt="User Image">

                      <div class="contacts-list-info">
                            <span class="contacts-list-name">
                              Count Dracula
                              <small class="contacts-list-date pull-right">2/28/2015</small>
                            </span>
                        <span class="contacts-list-msg">How have you been? I was...</span>
                      </div>
                      /.contacts-list-info
                    </a>
                  </li>
                  End Contact Item
                </ul>
                /.contatcts-list
              </div>
              /.direct-chat-pane
            </div>
            /.box-body
            <div class="box-footer">
              <form action="#" method="post">
                <div class="input-group">
                  <input type="text" name="message" placeholder="Type Message ..." class="form-control">
                      <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary btn-flat">Send</button>
                      </span>
                </div>
              </form>
            </div>
            /.box-footer
          </div>
          /.direct-chat
        </div>
        /.col
            -->                          
          </li>
         																								
					<c:choose>
					<c:when test="${ACNT_ID==null}">
					<li class="dropdown login-menu"><a href="<c:url value='/login'/>">로그인</a>
					</c:when>					
					<c:when test="${ACNT_ID!=null}">
					<li class="dropdown logout-menu"><a href="<c:url value='/logout'/>">${ACNT_ID }님 로그아웃</a>
					
					<!-- 메뉴 -->
	               	<li class="dropdown notifications-menu"><a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <span >MENU</span>
					</a>
						<ul class="dropdown-menu">
						
							<li>
								<!-- inner menu: contains the actual data -->
								<div class="slimScrollDiv" style=" position: relative; overflow: hidden; width: auto; height: 130px;"><ul class="menu" style="overflow: hidden; width: 100%; height: 120px;">
									<li><a href="<c:url value='/memInfo'/>"> <i class="fa fa-users text-aqua"></i>
											개인정보
									</a></li>
									
									<li><a href="<c:url value='/empinfo'/>"> <i class="fa fa-users text-red"></i>
											입사정보
									</a></li>
									
									<li><a href="<c:url value='/logout'/>"> <i class="fa fa-user text-red"></i>
											로그아웃
									</a></li>
								</ul></div>
							</li>
						</ul></li>
					</c:when>
					</c:choose>
					
					
					<!-- Notifications: style can be found in dropdown.less -->
					
					<!-- Tasks: style can be found in dropdown.less -->
					
					<!-- User Account: style can be found in dropdown.less -->
					
					<!-- Control Sidebar Toggle Button -->
					
				</ul>
			</div>
		</nav>
	</header>
</div>