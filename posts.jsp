<!-- posts.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/navbar.jsp" %>

<div class="container mt-4">
    <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2><i class="fas fa-comments me-2"></i>커뮤니티 게시판</h2>
                <a href="${pageContext.request.contextPath}/posts?action=write" 
                   class="btn btn-primary">
                    <i class="fas fa-pen me-1"></i>글쓰기
                </a>
            </div>
        </div>
    </div>
    
    <!-- 카테고리 필터 -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h6>카테고리 필터:</h6>
                    <div class="btn-group" role="group">
                        <a href="${pageContext.request.contextPath}/posts" 
                           class="btn btn-outline-primary ${empty currentCategory ? 'active' : ''}">
                            전체
                        </a>
                        <a href="${pageContext.request.contextPath}/posts?category=discussion" 
                           class="btn btn-outline-primary ${'discussion' eq currentCategory ? 'active' : ''}">
                            토론
                        </a>
                        <a href="${pageContext.request.contextPath}/posts?category=question" 
                           class="btn btn-outline-primary ${'question' eq currentCategory ? 'active' : ''}">
                            질문
                        </a>
                        <a href="${pageContext.request.contextPath}/posts?category=announcement" 
                           class="btn btn-outline-primary ${'announcement' eq currentCategory ? 'active' : ''}">
                            공지사항
                        </a>
                        <a href="${pageContext.request.contextPath}/posts?category=resource" 
                           class="btn btn-outline-primary ${'resource' eq currentCategory ? 'active' : ''}">
                            자료
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 게시글 목록 -->
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <c:forEach items="${posts}" var="post">
                        <div class="post-item border-bottom py-3">
                            <div class="row">
                                <div class="col-md-8">
                                    <h5 class="post-title mb-1">
                                        <a href="${pageContext.request.contextPath}/posts?action=view&id=${post.id}" 
                                           class="text-decoration-none">
                                            ${post.title}
                                        </a>
                                    </h5>
                                    <div class="post-meta">
                                        <span class="badge bg-secondary me-2">${post.category}</span>
                                        <small class="text-muted">
                                            <i class="fas fa-user me-1"></i>${post.username}
                                            <i class="fas fa-calendar ms-2 me-1"></i>
                                            <fmt:formatDate value="${post.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
                                            <i class="fas fa-eye ms-2 me-1"></i>${post.views}
                                        </small>
                                    </div>
                                </div>
                                <div class="col-md-4 text-md-end">
                                    <a href="${pageContext.request.contextPath}/posts?action=view&id=${post.id}" 
                                       class="btn btn-outline-primary btn-sm">
                                        <i class="fas fa-eye me-1"></i>보기
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    
                    <c:if test="${empty posts}">
                        <div class="text-center py-5">
                            <i class="fas fa-inbox fa-3x text-muted mb-3"></i>
                            <p class="text-muted">게시글이 없습니다.</p>
                            <a href="${pageContext.request.contextPath}/posts?action=write" 
                               class="btn btn-primary">
                                <i class="fas fa-pen me-1"></i>첫 번째 글 작성하기
                            </a>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/includes/footer.jsp" %>