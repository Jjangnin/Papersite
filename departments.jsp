<!-- departments.jsp -->
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
                    <li class="breadcrumb-item active" aria-current="page">${university.name}</li>
                </ol>
            </nav>
            
            <h2><i class="fas fa-building me-2"></i>${university.name} 학과 목록</h2>
            <p class="text-muted">학과를 선택하여 연구실을 확인하세요.</p>
        </div>
    </div>
    
    <div class="row">
        <c:forEach items="${departments}" var="department">
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card h-100 department-card">
                    <div class="card-body">
                        <h5 class="card-title">${department.name}</h5>
                        <c:if test="${not empty department.website}">
                            <p class="card-text">
                                <small class="text-muted">
                                    <a href="${department.website}" target="_blank" class="text-decoration-none">
                                        <i class="fas fa-external-link-alt me-1"></i>학과 웹사이트
                                    </a>
                                </small>
                            </p>
                        </c:if>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/labs?departmentId=${department.id}" 
                           class="btn btn-primary w-100">
                            <i class="fas fa-arrow-right me-1"></i>연구실 보기
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
        
        <c:if test="${empty departments}">
            <div class="col-12">
                <div class="alert alert-info text-center">
                    <i class="fas fa-info-circle me-2"></i>등록된 학과가 없습니다.
                </div>
            </div>
        </c:if>
    </div>
</div>

<%@ include file="/includes/footer.jsp" %>