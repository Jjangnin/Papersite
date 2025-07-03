<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - PaperPortal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card mt-5">
                    <div class="card-header text-center">
                        <h3>회원가입</h3>
                        <p class="text-muted">PaperPortal에 가입하세요</p>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger" role="alert">
                                ${error}
                            </div>
                        </c:if>
                        
                        <form action="${pageContext.request.contextPath}/register" method="post" id="registerForm">
                            <div class="mb-3">
                                <label for="username" class="form-label">사용자명</label>
                                <input type="text" class="form-control" id="username" name="username" 
                                       value="${param.username}" required>
                                <div class="form-text">영문, 숫자, 언더스코어만 사용 가능합니다.</div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="password" class="form-label">비밀번호</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                                <div class="form-text">최소 6자 이상 입력해주세요.</div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">비밀번호 확인</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="email" class="form-label">이메일</label>
                                <input type="email" class="form-control" id="email" name="email" 
                                       value="${param.email}" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="name" class="form-label">이름</label>
                                <input type="text" class="form-control" id="name" name="name" 
                                       value="${param.name}" required>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">회원가입</button>
                            </div>
                        </form>
                        
                        <div class="text-center mt-3">
                            <p>이미 계정이 있으신가요? <a href="${pageContext.request.contextPath}/login">로그인</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            }
            
            if (password.length < 6) {
                e.preventDefault();
                alert('비밀번호는 최소 6자 이상이어야 합니다.');
                return false;
            }
        });
    </script>
</body>
</html>