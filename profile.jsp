<!-- profile.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/navbar.jsp" %>

<div class="container mt-4">
    <div class="row">
        <div class="col-12">
            <h2><i class="fas fa-user-edit me-2"></i>프로필 관리</h2>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-6">
            <!-- 프로필 정보 수정 -->
            <div class="card mb-4">
                <div class="card-header">
                    <h4><i class="fas fa-user me-2"></i>기본 정보 수정</h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty success}">
                        <div class="alert alert-success" role="alert">
                            ${success}
                        </div>
                    </c:if>
                    
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger" role="alert">
                            ${error}
                        </div>
                    </c:if>
                    
                    <form action="${pageContext.request.contextPath}/profile" method="post">
                        <input type="hidden" name="action" value="updateProfile">
                        
                        <div class="mb-3">
                            <label for="username" class="form-label">사용자명</label>
                            <input type="text" class="form-control" id="username" value="${user.username}" 
                                   readonly disabled>
                            <div class="form-text">사용자명은 변경할 수 없습니다.</div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="email" class="form-label">이메일</label>
                            <input type="email" class="form-control" id="email" name="email" 
                                   value="${user.email}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="name" class="form-label">이름</label>
                            <input type="text" class="form-control" id="name" name="name" 
                                   value="${user.name}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">가입일</label>
                            <input type="text" class="form-control" 
                                   value="<fmt:formatDate value='${user.createdAt}' pattern='yyyy년 MM월 dd일'/>" 
                                   readonly disabled>
                        </div>
                        
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save me-1"></i>정보 수정
                        </button>
                    </form>
                </div>
            </div>
        </div>
        
        <div class="col-md-6">
            <!-- 비밀번호 변경 -->
            <div class="card">
                <div class="card-header">
                    <h4><i class="fas fa-lock me-2"></i>비밀번호 변경</h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty passwordSuccess}">
                        <div class="alert alert-success" role="alert">
                            ${passwordSuccess}
                        </div>
                    </c:if>
                    
                    <c:if test="${not empty passwordError}">
                        <div class="alert alert-danger" role="alert">
                            ${passwordError}
                        </div>
                    </c:if>
                    
                    <form action="${pageContext.request.contextPath}/profile" method="post" id="passwordForm">
                        <input type="hidden" name="action" value="changePassword">
                        
                        <div class="mb-3">
                            <label for="currentPassword" class="form-label">현재 비밀번호</label>
                            <input type="password" class="form-control" id="currentPassword" 
                                   name="currentPassword" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="newPassword" class="form-label">새 비밀번호</label>
                            <input type="password" class="form-control" id="newPassword" 
                                   name="newPassword" required minlength="6">
                            <div class="form-text">최소 6자 이상 입력해주세요.</div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">새 비밀번호 확인</label>
                            <input type="password" class="form-control" id="confirmPassword" 
                                   name="confirmPassword" required>
                        </div>
                        
                        <button type="submit" class="btn btn-warning">
                            <i class="fas fa-key me-1"></i>비밀번호 변경
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('passwordForm').addEventListener('submit', function(e) {
    const newPassword = document.getElementById('newPassword').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    
    if (newPassword !== confirmPassword) {
        e.preventDefault();
        alert('새 비밀번호가 일치하지 않습니다.');
        return false;
    }
    
    if (newPassword.length < 6) {
        e.preventDefault();
        alert('비밀번호는 최소 6자 이상이어야 합니다.');
        return false;
    }
});
</script>

<%@ include file="/includes/footer.jsp" %>