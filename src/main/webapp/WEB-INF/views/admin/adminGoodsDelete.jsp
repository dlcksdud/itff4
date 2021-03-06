<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">상품 삭제</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
    	    <form
				action="${pageContext.request.contextPath}/admin/adminGoodsDelete.do?${_csrf.parameterName}=${_csrf.token}"
				name="goods_delete_frm"
				method="post">
		      
    		  <div class="modal-body">
    		  	<input type="hidden" name="pId" value="${goods.PId }" />
					<table class="table">
					  <tbody>
						  <tr>
						      <th scope="row">상품이미지</th>
						      <td><div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/upload/goods/${goods.PImg })"></div></td>
						  </tr>
						   <tr>
						     <th scope="row">상품번호</th>
						     <td>${goods.PId }</td>
						   </tr>
						   <tr>
						     <th scope="row">상품명</th>
						     <td>${goods.PName }</td>
						   </tr>
						   <tr>
						     <th scope="row">가격</th>
						     <td><fmt:formatNumber value="${goods.PPrice }" pattern="#,###" /></td>
						   </tr>
						   <tr>
						     <th scope="row">상품설명</th>
						     <td>${goods.PInfo }</td>
						   </tr>
						   <tr>
						     <th scope="row">분류</th>
						     <td>${goods.PCategory }</td>
						   </tr>
						   <tr>
						     <th scope="row">등록일자</th>
						     <td><fmt:formatDate value="${goods.PEnroll }" pattern="yyyy-MM-dd"/></td>
						   </tr>
					  </tbody>
					</table>
					<p class="recheck">정말 삭제하시겠습니까?</p>
		      </div>
		      <div class="modal-footer">
				<button type="submit" class="btn btn-danger">삭제</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </div>
			</form>
			
<script>

// 파일명 바꾸기 & 이미지 이름
$(() => {
	$("[name=upFile]").change((e) => {
		
		// 1.파일명 가져오기
		const file = $(e.target).prop("files")[0];
		const filename = file?.name; // optional chaining 객체가 undefined경우에도 오류가 나지 않는다.
		console.dir(e.target);
		console.log(file);
		console.log(filename);
		
		// 2.label에 설정하기
		const $label = $(e.target).next();
		console.log($label);
		
		if(file != undefined)
			$label.html(filename);
		else
			$label.html("파일을 선택하세요.");	
	});	
		$("[name=pImg]").val(filename);
});

</script>

<script>

//Bootstrap multiple modal
var count = 0; // 모달이 열릴 때 마다 count 해서  z-index값을 높여줌

$(document).on('show.bs.modal', '.modal', function () {
    var zIndex = 1040 + (10 * count);

    $(this).css('z-index', zIndex);
    setTimeout(function() {
        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
    }, 0);

    count = count + 1

});

// multiple modal Scrollbar fix
$(document).on('hidden.bs.modal', '.modal', function () {
    $('.modal:visible').length && $(document.body).addClass('modal-open');
});

</script>