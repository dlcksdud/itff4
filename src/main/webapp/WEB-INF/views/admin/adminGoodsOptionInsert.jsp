<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/adminFrm.css" />

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">옵션 등록</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
	    		<form
					action="${pageContext.request.contextPath}/admin/adminGoodsOptionInsert.do?${_csrf.parameterName}=${_csrf.token}"
					name="goods_option_update_frm"
					method="post"
					enctype="multipart/form-data">
		      
		      <div class="modal-body">
				  <div class="form_side_container">
				  <div class="form-group">
				  <label for="exampleFormControlTextarea1">상품대표이미지</label>
					<div id="image_container">
						<img id="View2"/>
					</div>
				  </div>
				  
					<div class="input_wrap">
					
						  <div class="form-group">
						    <label for="exampleFormControlInput1">타입</label>
						    <input type="hidden" name="pId" value="${goods.PId }" />
						    <input type="hidden" name="optionId" value="${optionId }" />
						    <input type="text" name="optionType" class="form-control" id="exampleFormControlInput1">
						  </div>
				  
						  <div class="form-group">
						    <label for="exampleFormControlInput1">색상</label>
						    <input type="text" name="optionColor" class="form-control" id="exampleFormControlInput1">
						  </div>

						  <div class="form-group">
						    <label for="exampleFormControlInput1">색상코드</label>
						    <input type="color" name="optionRgb" class="form-control" id="exampleFormControlInput1">
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleFormControlTextarea1">사이즈</label>
						    <input type="text" class="form-control" name="optionSize" id="exampleFormControlTextarea1" rows="3" style="height: 100px;"/>
						  </div>

						  <div class="form-group">
						    <label for="exampleFormControlTextarea1">수량</label>
						    <input type="number" class="form-control" name="optionStock" id="exampleFormControlTextarea1" rows="3"/>
						  </div>
						  
						  <div class="form-group">
						   <label for="exampleFormControlTextarea1">상품이미지</label>
							<div class="input-group-prepend">
							  </div>
							  <div class="custom-file">
							  	<input type="hidden" name="optionImg" value="" />
							    <input type="file" name="upFile" class="custom-file-input" id="inputGroupFile02" accept="image/*">
							    <label class="custom-file-label" for="inputGroupFile02">이미지를 선택하세요.</label>
							  </div>
							</div>
						</div>

				 	 </div>
		    	  </div>
				      
		      <div class="modal-footer">
		      	<button type="submit" class="btn btn-primary">등록</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </div>
		      
		     </form>
		     
<script>

//파일명 바꾸기 & 이미지 이름
$(() => {
	$("#inputGroupFile02").change((e) => {
		
		// 1.파일명 가져오기
		const file = $(e.target).prop("files")[0];
		const filename = file?.name; // optional chaining 객체가 undefined경우에도 오류가 나지 않는다.
		console.dir(e.target);
		console.log(file);
		console.log(filename);
		
		// 2.label에 설정하기
		const $label = $(e.target).next();
		console.log($label);
		
		if(file != undefined) {
			$label.html(filename);
			$("[name=optionImg]").val(filename);			
		}
	});	
});

</script>

<script>

//사진 미리보기
$(function() {
 $("#inputGroupFile02").on('change', function(){
 readURL1(this);
 });
});

function readURL1(input) {
	
 if (input.files && input.files[0]) {
     var reader = new FileReader();
     reader.onload = function (e) {
     $('#View2').attr('src', e.target.result);
     }
     reader.readAsDataURL(input.files[0]);
 }
}

</script>