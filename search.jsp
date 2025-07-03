<!-- search.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/navbar.jsp" %>

<div class="container mt-4">
    <div class="row">
        <div class="col-12">
            <h2><i class="fas fa-search me-2"></i>논문 검색</h2>
        </div>
    </div>
    
    <div class="row mb-4">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/search" method="get" class="row g-3">
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="keyword" 
                                   placeholder="논문 제목, 저자, 키워드로 검색..." 
                                   value="${keyword}">
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="fas fa-search me-1"></i>검색
                            </button>
                        </div>
                        <div class="col-md-2">
                            <a href="${pageContext.request.contextPath}/search?action=recent" 
                               class="btn btn-outline-info w-100">
                                <i class="fas fa-clock me-1"></i>최근 논문
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 검색 결과 -->
    <c:if test="${showSearch}">
        <div class="row">
            <div class="col-12">
                <h4>검색 결과: "${keyword}" (${searchResults.size()}건)</h4>
                <hr>
            </div>
        </div>
        
        <div class="row">
            <c:forEach items="${searchResults}" var="paper">
                <div class="col-12 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">
                                <a href="${pageContext.request.contextPath}/papers?paperId=${paper.id}" 
                                   class="text-decoration-none">
                                    ${paper.title}
                                </a>
                            </h5>
                            
                            <div class="paper-meta mb-2">
                                <c:if test="${not empty paper.authors}">
                                    <span class="badge bg-secondary me-2">
                                        <i class="fas fa-users me-1"></i>${paper.authors}
                                    </span>
                                </c:if>
                                <c:if test="${not empty paper.journal}">
                                    <span class="badge bg-info me-2">
                                        <i class="fas fa-book me-1"></i>${paper.journal}
                                    </span>
                                </c:if>
                                <c:if test="${not empty paper.labName}">
                                    <span class="badge bg-success me-2">
                                        <i class="fas fa-flask me-1"></i>${paper.labName}
                                    </span>
                                </c:if>
                                <c:if test="${not empty paper.publicationDate}">
                                    <span class="badge bg-warning text-dark">
                                        <i class="fas fa-calendar me-1"></i>
                                        <fmt:formatDate value="${paper.publicationDate}" pattern="yyyy-MM-dd"/>
                                    </span>
                                </c:if>
                            </div>
                            
                            <c:if test="${not empty paper.abstractText}">
                                <p class="card-text">
                                    ${paper.abstractText.length() > 150 ? 
                                      paper.abstractText.substring(0, 150).concat('...') : 
                                      paper.abstractText}
                                </p>
                            </c:if>
                            
                            <div class="paper-actions">
                                <a href="${pageContext.request.contextPath}/papers?paperId=${paper.id}" 
                                   class="btn btn-primary btn-sm">
                                    <i class="fas fa-eye me-1"></i>상세보기
                                </a>
                                <c:if test="${not empty paper.pdfUrl}">
                                    <a href="${paper.pdfUrl}" target="_blank" class="btn btn-outline-danger btn-sm">
                                        <i class="fas fa-file-pdf me-1"></i>PDF
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty searchResults}">
                <div class="col-12">
                    <div class="alert alert-info text-center">
                        <i class="fas fa-info-circle me-2"></i>검색 결과가 없습니다.
                    </div>
                </div>
            </c:if>
        </div>
    </c:if>
    
    <!-- 최근 논문 -->
    <c:if test="${showRecent}">
        <div class="row">
            <div class="col-12">
                <h4><i class="fas fa-clock me-2"></i>최근 논문 동향</h4>
                <hr>
            </div>
        </div>
        
        <div class="row">
            <c:forEach items="${recentPapers}" var="paper">
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h6 class="card-title">
                                <a href="${pageContext.request.contextPath}/papers?paperId=${paper.id}" 
                                   class="text-decoration-none">
                                    ${paper.title.length() > 50 ? 
                                      paper.title.substring(0, 50).concat('...') : 
                                      paper.title}
                                </a>
                            </h6>
                            
                            <c:if test="${not empty paper.authors}">
                                <p class="card-text">
                                    <small class="text-muted">
                                        <i class="fas fa-users me-1"></i>${paper.authors}
                                    </small>
                                </p>
                            </c:if>
                            
                            <c:if test="${not empty paper.journal}">
                                <p class="card-text">
                                    <small class="text-muted">
                                        <i class="fas fa-book me-1"></i>${paper.journal}
                                    </small>
                                </p>
                            </c:if>
                            
                            <c:if not empty paper.publicationDate}">
                                <p class="card-text">
                                    <small class="text-muted">
                                        <i class="fas fa-calendar me-1"></i>
                                        <fmt:formatDate value="${paper.publicationDate}" pattern="yyyy-MM-dd"/>
                                    </small>
                                </p>
                            </c:if>
                        </div>
                        <div class="card-footer">
                            <a href="${pageContext.request.contextPath}/papers?paperId=${paper.id}" 
                               class="btn btn-sm btn-primary w-100">
                                <i class="fas fa-eye me-1"></i>상세보기
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty recentPapers}">
                <div class="col-12">
                    <div class="alert alert-info text-center">
                        <i class="fas fa-info-circle me-2"></i>최근 논문이 없습니다.
                    </div>
                </div>
            </c:if>
        </div>
    </c:if>
</div>

<%@ include file="/includes/footer.jsp" %>