<!-- post-detail.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/navbar.jsp" %>

<div class="container mt-4">
    <div class="row">
        <div class="col-12">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/community">커뮤니티</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">게시글 상세</li>
                </ol>
            </nav>
        </div>
    </div>
    
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <h1 class="h3 mb-2">${post.title}</h1>
                            <div class="post-meta">
                                <span class="badge bg-primary me-2">${post.category}</span>
                                <small class="text-muted">
                                    <i class="fas fa-user me-1"></i>${post.authorName}
                                    <i class="fas fa-calendar ms-3 me-1"></i>
                                    <fmt:formatDate value="${post.createdAt}" pattern="yyyy년 MM월 dd일 HH:mm"/>
                                    <i class="fas fa-eye ms-3 me-1"></i>${post.views}회
                                </small>
                            </div>
                        </div>
                        <c:if test="${sessionScope.user.id == post.authorId}">
                            <div class="btn-group">
                                <button type="button" class="btn btn-outline-secondary btn-sm dropdown-toggle" 
                                        data-bs-toggle="dropdown">
                                    <i class="fas fa-cog"></i>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="#" onclick="deletePost()">
                                            <i class="fas fa-trash me-1"></i>삭제
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="card-body">
                    <div class="post-content">
                        ${post.content.replaceAll("\n", "<br>")}
                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-between">
                        <button onclick="history.back()" class="btn btn-secondary">
                            <i class="fas fa-arrow-left me-1"></i>뒤로가기
                        </button>
                        <a href="${pageContext.request.contextPath}/community" class="btn btn-primary">
                            <i class="fas fa-list me-1"></i>목록으로
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 게시글 삭제 확인 모달 -->
<div class="modal fade" id="deleteModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">게시글 삭제</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                정말로 이 게시글을 삭제하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <form action="${pageContext.request.contextPath}/community" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="postId" value="${post.id}">
                    <button type="submit" class="btn btn-danger">삭제</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
function deletePost() {
    var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
    deleteModal.show();
}
</script>

<%@ include file="/includes/footer.jsp" %>
