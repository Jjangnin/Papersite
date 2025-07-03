<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📚 PaperPortal</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            text-align: center;
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            max-width: 600px;
        }
        h1 {
            color: #2c3e50;
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        .subtitle {
            color: #7f8c8d;
            font-size: 1.2em;
            margin-bottom: 30px;
        }
        .menu {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin: 30px 0;
        }
        .menu a {
            padding: 15px 25px;
            background: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: bold;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        .menu a:hover {
            background: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        .features {
            text-align: left;
            margin-top: 30px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
        }
        .features h3 {
            color: #2c3e50;
            margin-bottom: 15px;
        }
        .features ul {
            list-style: none;
            padding: 0;
        }
        .features li {
            padding: 8px 0;
            border-bottom: 1px solid #ecf0f1;
        }
        .features li:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📚 PaperPortal</h1>
        <p class="subtitle">대학교 연구 논문 포털 시스템</p>
        
        <div class="menu">
            <a href="<%= request.getContextPath() %>/universities">
                🏛️ 대학교 목록
            </a>
            <a href="<%= request.getContextPath() %>/papers">
                📄 논문 목록
            </a>
            <a href="<%= request.getContextPath() %>/posts">
                💬 커뮤니티
            </a>
            <a href="<%= request.getContextPath() %>/crawl-test">
                🕷️ 크롤링 테스트
            </a>
        </div>
        
        <div class="features">
            <h3>🔥 주요 기능</h3>
            <ul>
                <li><strong>대학교별 연구실 탐색</strong> - 다양한 대학교의 연구실을 확인하세요</li>
                <li><strong>논문 검색 및 조회</strong> - 최신 연구 논문들을 찾아보세요</li>
                <li><strong>커뮤니티 기능</strong> - 연구자들과 소통하고 정보를 공유하세요</li>
                <li><strong>자동 논문 크롤링</strong> - arXiv에서 최신 논문을 자동으로 수집합니다</li>
            </ul>
        </div>
    </div>
</body>
</html>