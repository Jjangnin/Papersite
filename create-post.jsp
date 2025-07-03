<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/navbar.jsp" %>

<div class="container mt-4">
    <div class="row">
        <div class="col-12">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/posts">커뮤니티</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">글쓰기</li>
                </ol>
            </nav>
        </div>
    </div>
    
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3><i class="fas fa-pen me-2"></i>새 게시글 작성</h3>
                </div>
                <div class="card-body">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger" role="alert">
                            ${error}
                        </div>
                    </c:if>
                    
                    <form action="${pageContext.request.contextPath}/posts" method="post">
                        <div class="mb-3">
                            <label for="category" class="form-label">카테고리</label>
                            <select class="form-select" id="category" name="category" required>
                                <option value="">카테고리를 선택하세요</option>
                                <option value="discussion">토론</option>
                                <option value="question">질문</option>
                                <option value="announcement">공지사항</option>
                                <option value="resource">자료</option>
                            </select>
                        </div>
                        
                        <div class="mb-3">
                            <label for="title" class="form-label">제목</label>
                            <input type="text" class="form-control" id="title" name="title" 
                                   required placeholder="게시글 제목을 입력하세요..." value="${param.title}">
                        </div>
                        
                        <div class="mb-3">
                            <label for="content" class="form-label">내용</label>
                            <textarea class="form-control" id="content" name="content" rows="15" 
                                      required placeholder="게시글 내용을 입력하세요...">${param.content}</textarea>
                        </div>
                        
                        <div class="d-flex justify-content-between">
                            <a href="${pageContext.request.contextPath}/posts" class="btn btn-secondary">
                                <i class="fas fa-times me-1"></i>취소
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-1"></i>게시글 작성
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/includes/footer.jsp" %>