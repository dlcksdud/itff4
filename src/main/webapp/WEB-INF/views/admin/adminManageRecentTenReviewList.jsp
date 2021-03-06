<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.spring.goods.model.vo.Goods"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:forEach items="${list }" var="list">
<tr>
   <td class="name-cell">
       <span class="comments-text-wrapper" id="image">
			<img src="${pageContext.request.contextPath}/resources/upload/member/${list.member.image }" alt="memberImage" style="width: 40px; height: 40px; border-radius: 30px; margin-right: 10px;"/>
            <span class="comments-text">
                <span class="comments-name-wrapper">
                    <span class="comments-name">
                    	<input type="hidden" name="memberId" value="${list.memberId }" />
                        <span>${list.memberId }</span>
                        <span class="review-rating-wrapper">
                        </span>
                    </span>
                    <span class="comments-date" style="font-size: 13px; font-family: 'Montserrat';"><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd"/></span>
                </span>
                <span class="comments-message">${list.reviewTitle }</span>
            </span>
        </span>
    </td>
</tr>
</c:forEach>