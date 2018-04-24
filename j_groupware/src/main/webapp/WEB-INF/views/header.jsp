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