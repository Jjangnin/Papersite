<!-- labs.jsp -->
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
                        <a href="${pageContext.request.contextPath}/universities">대학교</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/departments?universityId=${department.universityId}">
                            ${department.universityName}
                        </a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">${department.name}</li>
                </ol>
            </nav>
            
            <h2><i class="fas fa-flask me-2"></i>${department.name} 연구실 목록</h2>
            <p class="text-muted">연구실을 선택하여 논문을 확인하세요.</p>
        </div>
    </div>
    
    <div class="row">
        <c:forEach items="${labs}" var="lab">
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card h-100 lab-card">
                    <div class="card-body">
                        <h5 class="card-title">${lab.name}</h5>
                        <c:if test="${not empty lab.professor}">
                            <p class="card-text">
                                <i class="fas fa-user-tie me-1"></i><strong>지도교수:</strong> ${lab.professor}
                            </p>
                        </c:if>
                        <c:if test="${not empty lab.description}">
                            <p class="card-text">${lab.description}</p>
                        </c:if>
                        <c:if test="${not empty lab.website}">
                            <p class="card-text">
                                <small class="text-muted">
                                    <a href="${lab.website}" target="_blank" class="text-decoration-none">
                                        <i class="fas fa-external-link-alt me-1"></i>연구실 웹사이트
                                    </a>
                                </small>
                            </p>
                        </c:if>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/papers?labId=${lab.id}" 
                           class="btn btn-primary w-100">
                            <i class="fas fa-file-alt me-1"></i>논문 보기
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
        
        <c:if test="${empty labs}">
            <div class="col-12">
                <div class="alert alert-info text-center">
                    <i class="fas fa-info-circle me-2"></i>등록된 연구실이 없습니다.
                </div>
            </div>
        </c:if>
    </div>
</div>

<%@ include file="/includes/footer.jsp" %>
