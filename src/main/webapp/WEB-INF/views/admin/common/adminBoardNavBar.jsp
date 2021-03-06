<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="shadow-sm p-3 mb-5 bg-body" style="width: 100%;">
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="font-family: 'Noto Sans KR'; height: 45px;">
  <a class="navbar-brand" href="#" style="font-weight: bold; color: #45a7b9;">게시판관리</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminReviewList.do">리뷰게시판</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminSharingList.do">티켓나눔터</a>
      </li>
    </ul>
  </div>
</nav>
</div>