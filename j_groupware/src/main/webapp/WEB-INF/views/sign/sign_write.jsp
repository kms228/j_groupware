<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="<c:url value='/'/>resources/se2/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<h1>문서작성</h1>
<hr>
<h3>
	<span class="fa fa-fw fa-file-text"></span> 문서종류 : ${vo.doc_name }
</h3>
<div>
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary btn-lg"
		data-toggle="modal" data-target="#myModal" id="line_btn">
		Launch demo modal</button>
	<!-- Modal -->
	<form action="<c:url value='/'/>addline" method="post" name="line">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">조직도</h4>
					</div>
					<div class="modal-body" id="linecontent">
						<div id="jstree"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary" id="line_submit">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<button type="button" class="btn btn-info" data-toggle="modal"
		data-target="#modal-info" id="sub_line">Launch Info Modal1</button>
	<!-- 모달 -->
	<div class="modal modal-info fade" id="modal-info">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Info Modal</h4>
				</div>
				<div class="modal-body">
					<div id="jstree">
						
					</div>
					<div id="sub_write"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline pull-left"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-outline">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<form method="post" action="<c:url value='/'/>addsign" id="write_form">
		<input type="button" value="결재선 선택" id="popbutton">
		<div>
			<label>제목&nbsp;&nbsp;&nbsp;</label><input type="text" size="120">
		</div>
		<div>
			<textarea name="ir1" id="ir1" rows="10" cols="100">${vo.doc_content }</textarea>
		</div>
		<input type="button" class="btn btn-primary" value="등록"
			id="submit_btn"> <input type="hidden" value="${param.num }">
	</form>
</div>
<script type="text/javascript">
	$(function() {
		var oEditors = [];

		nhn.husky.EZCreator.createInIFrame({

			oAppRef : oEditors,

			elPlaceHolder : "ir1",

			sSkinURI : "<c:url value='/'/>resources/se2/SmartEditor2Skin.html",

			fCreator : "createSEditor2"
		});
		//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
		$("#submit_btn").click(function() {
			// 에디터의 내용이 textarea에 적용된다.
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#write_form").submit();
		});
		$("#line_btn")
				.click(
						function() {
							$.ajax({
								url : "<c:url value='/sublinelist'/>",
								dataType : "json",
								success : function(data) {
									// 6 create an instance when the DOM is ready
									$('#jstree').jstree({
										"checkbox":{
											"keep_selected_style":false
										},
										"plugins" : [ "wholerow", "checkbox", "changed" ],
										'core' : {
											'data' : data
										}
									});
									$('#jstree').on('select_node.jstree Event',function(e,data){
										var id=data.node.id;
										var name=data.node.text;
										var arr=data.selected;
										var arr1=[];
										arr1.push(name);
										console.log(id);
										console.log(arr);
										console.log(name);
										console.log(arr1);
									});
									
									//선택해제시 동작메소드
									$('#jstree').on('deselect_node.jstree Event', function (e, data) {
										
									});
								}
							});
						});
		$('#sub_line').click(function() {
			$.ajax({
				url : "<c:url value='/sublinelist'/>",
				dataType : "json",
				success : function(data) {
					// 6 create an instance when the DOM is ready
					$('#jstree').jstree({
						"checkbox":{
							"keep_selected_style":false
						},
						"plugins" : [ "wholerow", "checkbox", "changed" ],
						'core' : {
							'data' : data
						}
					});
					$('#jstree').on('select_node.jstree Event',function(e,data){
						var id=data.node.id;
						var name=data.node.text;
						var arr=data.selected;
						var arr1=[];
						arr1.push(name);
						console.log(id);
						console.log(arr);
						console.log(name);
						console.log(arr1);
						$('#sub_write').append('<p>'+name+'</p>');
					});
					
					//선택해제시 동작메소드
					$('#jstree').on('deselect_node.jstree Event', function (e, data) {
						
					});
				}
			});
		});

	});
</script>