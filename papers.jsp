<%@ include file="/includes/footer.jsp" %>

<!-- papers.jsp -->
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
                        <a href="${pageContext.request.contextPath}/departments?universityId=${lab.departmentId}">
                            학과
                        </a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/labs?departmentId=${lab.departmentId}">
                            ${lab.departmentName}
                        </a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">${lab.name}</li>
                </ol>
            </nav>
            
            <h2><i class="fas fa-file-alt me-2"></i>${lab.name} 논문 목록</h2>
            <c:if test="${not empty lab.professor}">
                <p class="text-muted">지도교수: ${lab.professor}</p>
            </c:if>
        </div>
    </div>
    
    <div class="row">
        <c:forEach items="${papers}" var="paper">
            <div class="col-12 mb-4">
                <div class="card paper-card">
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
                            <c:if test="${not empty paper.publicationDate}">
                                <span class="badge bg-success">
                                    <i class="fas fa-calendar me-1"></i>
                                    <fmt:formatDate value="${paper.publicationDate}" pattern="yyyy-MM-dd"/>
                                </span>
                            </c:if>
                        </div>
                        
                        <c:if test="${not empty paper.abstractText}">
                            <p class="card-text abstract-preview">
                                ${paper.abstractText.length() > 200 ? 
                                  paper.abstractText.substring(0, 200).concat('...') : 
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
                            <c:if test="${not empty paper.doi}">
                                <a href="https://doi.org/${paper.doi}" target="_blank" 
                                   class="btn btn-outline-info btn-sm">
                                    <i class="fas fa-external-link-alt me-1"></i>DOI
                                </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        
        <c:if test="${empty papers}">
            <div class="col-12">
                <div class="alert alert-info text-center">
                    <i class="fas fa-info-circle me-2"></i>등록된 논문이 없습니다.
                </div>
            </div>
        </c:if>
    </div>
</div>