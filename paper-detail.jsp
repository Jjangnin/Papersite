<%@ include file="/includes/footer.jsp" %>

<!-- paper-detail.jsp -->
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
                        <a href="${pageContext.request.contextPath}/universities">대학교</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="javascript:history.back()">연구실</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">논문 상세</li>
                </ol>
            </nav>
        </div>
    </div>
    
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h1 class="h3 mb-0">${paper.title}</h1>
                </div>
                <div class="card-body">
                    <div class="paper-meta mb-4">
                        <div class="row">
                            <c:if test="${not empty paper.authors}">
                                <div class="col-md-6 mb-2">
                                    <strong><i class="fas fa-users me-2"></i>저자:</strong>
                                    <span>${paper.authors}</span>
                                </div>
                            </c:if>
                            <c:if test="${not empty paper.journal}">
                                <div class="col-md-6 mb-2">
                                    <strong><i class="fas fa-book me-2"></i>저널:</strong>
                                    <span>${paper.journal}</span>
                                </div>
                            </c:if>
                            <c:if test="${not empty paper.publicationDate}">
                                <div class="col-md-6 mb-2">
                                    <strong><i class="fas fa-calendar me-2"></i>발행일:</strong>
                                    <span><fmt:formatDate value="${paper.publicationDate}" pattern="yyyy년 MM월 dd일"/></span>
                                </div>
                            </c:if>
                            <c:if test="${not empty paper.labName}">
                                <div class="col-md-6 mb-2">
                                    <strong><i class="fas fa-flask me-2"></i>연구실:</strong>
                                    <span>${paper.labName}</span>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    
                    <c:if test="${not empty paper.abstractText}">
                        <div class="abstract-section mb-4">
                            <h4><i class="fas fa-file-text me-2"></i>초록</h4>
                            <div class="abstract-content p-3 bg-light rounded">
                                <p class="mb-0">${paper.abstractText}</p>
                            </div>
                        </div>
                    </c:if>
                    
                    <div class="paper-actions">
                        <c:if test="${not empty paper.pdfUrl}">
                            <a href="${paper.pdfUrl}" target="_blank" class="btn btn-danger me-2">
                                <i class="fas fa-file-pdf me-1"></i>PDF 다운로드
                            </a>
                        </c:if>
                        <c:if test="${not empty paper.doi}">
                            <a href="https://doi.org/${paper.doi}" target="_blank" class="btn btn-info me-2">
                                <i class="fas fa-external-link-alt me-1"></i>DOI 링크
                            </a>
                        </c:if>
                        <button onclick="history.back()" class="btn btn-secondary">
                            <i class="fas fa-arrow-left me-1"></i>뒤로가기
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>