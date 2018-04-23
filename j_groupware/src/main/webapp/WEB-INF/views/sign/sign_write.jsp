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
<hr>
<form method="post" action="<c:url value='/'/>addsign" id="write_form">
	<div>
		<table class="table table-bordered" id="signlinetable">
			<tr>
				<td rowspan="2"><button type="button" data-target="#myModal"
						data-toggle="modal" id="line_btn">결재선 선택</button>
					<button>내 결재선 관리</button> <select
					style="width: 100%; height: 120px;" multiple="multiple"
					id="select_menuline">
						<option>테스트</option>
						<option>테스트</option>
						<option>테스트</option>
				</select></td>
				<td rowspan="2" align="center"><b>결재</b></td>
				<td width="100px" height="70px"><div id="line0">양세용</div></td>
				<td width="100px"><div id="line1">함형진</div></td>
				<td width="100px"><div id="line2"></div></td>
				<td width="100px"><div id="line3"></div></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	<div>
		<!-- Modal -->
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
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							id="line_submit">Save changes</button>
					</div>
				</div>
			</div>
		</div>

		<div>
			<label>제목&nbsp;&nbsp;&nbsp;</label><input type="text" size="120" name="sdoc_title">
		</div>
		<div>
			<textarea name="ir1" id="ir1" rows="10" cols="100">${vo.doc_content }</textarea>
		</div>
		<input type="button" class="btn btn-primary" value="등록"
			id="submit_btn"> <input type="hidden" value="${param.num }" name="num">
	</div>
</form>
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
			alert(document.getElementById("ir1").value);
			$("#write_form").submit();
		});
		$("#line_btn").click(function() {
			$.ajax({
				url : "<c:url value='/sublinelist'/>",
				dataType : "json",
				success : function(data) {
					// 6 create an instance when the DOM is ready
					$('#jstree').jstree({
						"checkbox" : {
							"keep_selected_style" : false
						},
						"plugins" : [ "wholerow", "checkbox", "changed" ],
						'core' : {
							'data' : data
						//,'multiple':false
						}
					});
				}
			});
		});
		var arr1 = [];
		var idarr = [];
		$('#jstree').on('select_node.jstree Event', function(e, data) {
			var id = data.node.id;
			var name = data.node.text;
			//var arr=data.selected;
			arr1.push(name);
			idarr.push(id);
		});

		//선택해제시 동작메소드
		$('#jstree').on('deselect_node.jstree Event', function(e, data) {
			var name = data.node.text;
			var arr = data.selected;
			for (var i = 0; i < arr1.length; i++) {
				if (arr1[i] === name) {
					arr1.splice(i, 1);
					idarr.splice(i, 1);
				}
			}
			console.log(arr1);
			console.log(idarr);
		});
		$('#line_submit')
				.click(
						function() {
							for (var i = 0; i < arr1.length; i++) {
								$('#line' + i)
										.html(
												arr1[i]
														+ "<input type='hidden' name='emp_num' value='"+idarr[i]+"'>");
							}
						});

	});
</script>