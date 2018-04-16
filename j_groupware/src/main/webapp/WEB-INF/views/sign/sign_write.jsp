<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/'/>resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<h1>문서작성</h1>
<hr>
<h3>
<span class="fa fa-fw fa-file-text"></span>
문서종류 : ${vo.doc_name }
</h3>
<div>
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="line_btn">
	  Launch demo modal
	</button>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">조직도</h4>
	      </div>
	      <div class="modal-body" id="linecontent">
	        <ul id="treeDemo" class="ztree"></ul>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="line_submit">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	<form method="post" action="<c:url value='/'/>addsign" id="write_form">
			<input type="button" value="결재선 선택" id="popbutton">
			
		<div>
			<label>제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" size="120">
		</div>
		<div>
		<textarea name="ir1" id="ir1" rows="10" cols="100">${vo.doc_content }</textarea>
		</div>
		<input type="button" class="btn btn-primary" value="등록" id="submit_btn">
		<input type="hidden" value="${param.num }">
	</form>
</div>
<script type="text/javascript">
$(function () {
		var oEditors = [];
		
		nhn.husky.EZCreator.createInIFrame({
		
		    oAppRef: oEditors,
		
		    elPlaceHolder: "ir1",
		
		    sSkinURI: "<c:url value='/'/>resources/se2/SmartEditor2Skin.html",
		
		    fCreator: "createSEditor2"
		});
		//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
		$("#submit_btn").click(function () {
		    // 에디터의 내용이 textarea에 적용된다.
		    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		    $("#write_form").submit();
		});
		$("#line_btn").click(function () {
			$.ajax({
				url:"<c:url value='/signlinelist'/>",
				dataType:"json",
				success:function(data){
					var setting = {
							check: {
								enable: true
							},
							data: {
								simpleData: {
									enable: true
								}
							}
						};

						var zNodes =data;

						var code;

						function setCheck() {
							var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
							py = $("#py").attr("checked")? "p":"",
							sy = $("#sy").attr("checked")? "s":"",
							pn = $("#pn").attr("checked")? "p":"",
							sn = $("#sn").attr("checked")? "s":"",
							type = { "Y":py + sy, "N":pn + sn};
							zTree.setting.check.chkboxType = type;
							showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
						}
						function showCode(str) {
							if (!code) code = $("#code");
							code.empty();
							code.append("<li>"+str+"</li>");
						}
						$.fn.zTree.init($("#treeDemo"), setting, zNodes);
						setCheck();
						$("#py").bind("change", setCheck);
						$("#sy").bind("change", setCheck);
						$("#pn").bind("change", setCheck);
						$("#sn").bind("change", setCheck);
				}
			});
		});
		$('#treeDemo').click(function(){
			alert("체크");
		});
});

</script>