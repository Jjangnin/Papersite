<!-- universities.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/navbar.jsp" %>

<div class="container mt-4">
    <div class="row">
        <div class="col-12">
            <h2><i class="fas fa-university me-2"></i>대학교 목록</h2>
            <p class="text-muted">대학교를 선택하여 학과를 확인하세요.</p>
        </div>
    </div>
    
    <div class="row">
        <c:forEach items="${universities}" var="university">
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card h-100 university-card">
                    <div class="card-body">
                        <h5 class="card-title">${university.name}</h5>
                        <p class="card-text">
                            <i class="fas fa-map-marker-alt me-1"></i>${university.location}
                        </p>
                        <c:if test="${not empty university.website}">
                            <p class="card-text">
                                <small class="text-muted">
                                    <a href="${university.website}" target="_blank" class="text-decoration-none">
                                        <i class="fas fa-external-link-alt me-1"></i>공식 웹사이트
                                    </a>
                                </small>
                            </p>
                        </c:if>
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/departments?universityId=${university.id}" 
                           class="btn btn-primary w-100">
                            <i class="fas fa-arrow-right me-1"></i>학과 보기
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
        
        <c:if test="${empty universities}">
            <div class="col-12">
                <div class="alert alert-info text-center">
                    <i class="fas fa-info-circle me-2"></i>등록된 대학교가 없습니다.
                </div>
            </div>
        </c:if>
    </div>
</div>