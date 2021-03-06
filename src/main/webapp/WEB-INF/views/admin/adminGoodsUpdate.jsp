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
		        <h5 class="modal-title" id="exampleModalLongTitle">상품 수정</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
	    		<form
					action="${pageContext.request.contextPath}/admin/adminGoodsUpdate.do?${_csrf.parameterName}=${_csrf.token}"
					name="goods_update_frm"
					method="post"
					enctype="multipart/form-data">
		      
		      <div class="modal-body">
          		  <div class="form-group">
          		  	<input type="hidden" name="pId" value="${goods.PId }" />
				    <input type="text" name="pName" class="form-control" id="exampleFormControlInput1" value="${goods.PName }" required>
				  </div>
				  
          		  <div class="form-group">
				    <input type="text" name="pPrice" class="form-control" id="exampleFormControlInput1" value="${goods.PPrice }" required>
				  </div>
				  
				  <div class="form-group">
				    <textarea name="pInfo" class="form-control" id="exampleFormControlTextarea1" rows="3" required>${goods.PInfo }</textarea>
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleFormControlSelect1">카테고리</label>
				    <select name="pCategory" class="form-control" id="exampleFormControlSelect1" required>
				      <option value="">선택</option>
				      <option value="홈데코/리빙" ${goods.PCategory eq '홈데코/리빙' ? 'selected' : '' }>홈데코/리빙</option>
				      <option value="폰케이스/테크" ${goods.PCategory eq '폰케이스/테크' ? 'selected' : '' }>폰케이스/테크</option>
				      <option value="의류" ${goods.PCategory eq '의류' ? 'selected' : '' }>의류</option>
				    </select>
				  </div>
				  
           		  <div class="form-group">
				    <input type="text" name="pPrice" class="form-control" id="exampleFormControlInput1" value="${goods.PSubcategory }" required>
				  </div>
				  
				  <div class="input-group">
					  <div class="custom-file">
					  	<input type="hidden" name="pImg" value="${goods.PImg }" />
					    <input name="upFile" id="myFile" type="file" class="custom-file-input" id="inputGroupFile04">
					    <label class="custom-file-label" id="showFiles" for="inputGroupFile04">${goods.PImg }</label>
					  </div>
					  <div class="input-group-append">
					    <button class="btn btn-outline-secondary" type="button">Button</button>
					  </div>
				 	 </div>
		    	  </div>
				      
		      <div class="modal-footer">
		      	<button type="submit" class="btn btn-outline-secondary">수정</button>
		        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
		      </div>
		      
		     </form>
		     
<script>

window.onload = function(){
    target = document.getElementById('myFile');
    target.addEventListener('change', function(){
        target2 = document.getElementById('showFiles');
        $label.html(filename);
        target2.innerHTML = fileList;
    });
}

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
		$("[name=pImg]").val(filename);
	});	
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