// main.js - PaperPortal 커스텀 JavaScript

document.addEventListener('DOMContentLoaded', function() {
    console.log('PaperPortal 시스템이 로드되었습니다.');
    
    // 페이지 로드 시 애니메이션
    initializePageAnimations();
    
    // 카드 클릭 이벤트 초기화
    initializeCardEvents();
    
    // 폼 유효성 검사 초기화
    initializeFormValidation();
    
    // 검색 기능 초기화
    initializeSearchFeatures();
    
    // 네비게이션 효과 초기화
    initializeNavigationEffects();
    
    // 툴팁 초기화
    initializeTooltips();
    
    // 알림 메시지 자동 숨김
    initializeAlerts();
});

/**
 * 페이지 로드 애니메이션 초기화
 */
function initializePageAnimations() {
    const cards = document.querySelectorAll('.card');
    cards.forEach((card, index) => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        
        setTimeout(() => {
            card.style.transition = 'all 0.5s ease-in-out';
            card.style.opacity = '1';
            card.style.transform = 'translateY(0)';
        }, index * 100);
    });
}

/**
 * 카드 클릭 이벤트 초기화
 */
function initializeCardEvents() {
    // 대학교 카드 클릭 이벤트
    const universityCards = document.querySelectorAll('.university-card');
    universityCards.forEach(card => {
        card.addEventListener('click', function(e) {
            if (!isClickableElement(e.target)) {
                const link = this.querySelector('.card-footer a');
                if (link) {
                    window.location.href = link.href;
                }
            }
        });
        
        // 호버 효과
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-5px)';
            this.style.boxShadow = '0 8px 25px rgba(0,0,0,0.15)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = '0 2px 10px rgba(0,0,0,0.1)';
        });
    });
    
    // 학과 카드 클릭 이벤트
    const departmentCards = document.querySelectorAll('.department-card');
    departmentCards.forEach(card => {
        card.addEventListener('click', function(e) {
            if (!isClickableElement(e.target)) {
                const link = this.querySelector('.card-footer a');
                if (link) {
                    window.location.href = link.href;
                }
            }
        });
    });
    
    // 연구실 카드 클릭 이벤트
    const labCards = document.querySelectorAll('.lab-card');
    labCards.forEach(card => {
        card.addEventListener('click', function(e) {
            if (!isClickableElement(e.target)) {
                const link = this.querySelector('.card-footer a');
                if (link) {
                    window.location.href = link.href;
                }
            }
        });
    });
}

/**
 * 클릭 가능한 요소인지 확인
 */
function isClickableElement(element) {
    const clickableTags = ['A', 'BUTTON', 'INPUT', 'SELECT', 'TEXTAREA'];
    return clickableTags.includes(element.tagName) || 
           element.closest('a, button, input, select, textarea');
}

/**
 * 폼 유효성 검사 초기화
 */
function initializeFormValidation() {
    // 회원가입 폼 검증
    const registerForm = document.getElementById('registerForm');
    if (registerForm) {
        registerForm.addEventListener('submit', function(e) {
            if (!validateRegisterForm()) {
                e.preventDefault();
                return false;
            }
        });
    }
    
    // 로그인 폼 검증
    const loginForm = document.querySelector('form[action*="login"]');
    if (loginForm) {
        loginForm.addEventListener('submit', function(e) {
            const username = this.querySelector('input[name="username"]').value.trim();
            const password = this.querySelector('input[name="password"]').value.trim();
            
            if (!username || !password) {
                e.preventDefault();
                showAlert('사용자명과 비밀번호를 모두 입력해주세요.', 'warning');
                return false;
            }
        });
    }
    
    // 게시글 작성 폼 검증
    const postForm = document.querySelector('form[action*="community"]');
    if (postForm && postForm.querySelector('input[name="action"][value="create"]')) {
        postForm.addEventListener('submit', function(e) {
            const title = this.querySelector('input[name="title"]').value.trim();
            const content = this.querySelector('textarea[name="content"]').value.trim();
            
            if (!title || !content) {
                e.preventDefault();
                showAlert('제목과 내용을 모두 입력해주세요.', 'warning');
                return false;
            }
            
            if (title.length > 300) {
                e.preventDefault();
                showAlert('제목은 300자 이내로 입력해주세요.', 'warning');
                return false;
            }
        });
    }
}

/**
 * 회원가입 폼 유효성 검사
 */
function validateRegisterForm() {
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();
    const confirmPassword = document.getElementById('confirmPassword').value.trim();
    const email = document.getElementById('email').value.trim();
    const name = document.getElementById('name').value.trim();
    
    // 빈 필드 확인
    if (!username || !password || !confirmPassword || !email || !name) {
        showAlert('모든 필드를 입력해주세요.', 'warning');
        return false;
    }
    
    // 사용자명 형식 확인
    if (!/^[a-zA-Z0-9_]{3,20}$/.test(username)) {
        showAlert('사용자명은 3-20자의 영문, 숫자, 언더스코어만 사용 가능합니다.', 'warning');
        return false;
    }
    
    // 비밀번호 길이 확인
    if (password.length < 6) {
        showAlert('비밀번호는 최소 6자 이상이어야 합니다.', 'warning');
        return false;
    }
    
    // 비밀번호 확인
    if (password !== confirmPassword) {
        showAlert('비밀번호가 일치하지 않습니다.', 'warning');
        return false;
    }
    
    // 이메일 형식 확인
    if (!isValidEmail(email)) {
        showAlert('올바른 이메일 형식이 아닙니다.', 'warning');
        return false;
    }
    
    return true;
}

/**
 * 이메일 유효성 검사
 */
function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

/**
 * 검색 기능 초기화
 */
function initializeSearchFeatures() {
    const searchForm = document.querySelector('form[action*="search"]');
    if (searchForm) {
        searchForm.addEventListener('submit', function(e) {
            const keyword = this.querySelector('input[name="keyword"]').value.trim();
            if (keyword.length < 2) {
                e.preventDefault();
                showAlert('검색어는 2자 이상 입력해주세요.', 'warning');
                return false;
            }
        });
    }
    
    // 실시간 검색 (선택사항)
    const searchInput = document.querySelector('input[name="keyword"]');
    if (searchInput) {
        let searchTimeout;
        searchInput.addEventListener('input', function() {
            clearTimeout(searchTimeout);
            const keyword = this.value.trim();
            
            if (keyword.length >= 2) {
                searchTimeout = setTimeout(() => {
                    // 실시간 검색 로직 (AJAX 구현 시)
                    console.log('실시간 검색:', keyword);
                }, 500);
            }
        });
    }
}

/**
 * 네비게이션 효과 초기화
 */
function initializeNavigationEffects() {
    // 스크롤 시 네비게이션 바 효과
    let lastScrollTop = 0;
    window.addEventListener('scroll', function() {
        const navbar = document.querySelector('.navbar');
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        
        if (scrollTop > 100) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
        
        // 스크롤 방향에 따른 네비게이션 바 숨김/표시
        if (scrollTop > lastScrollTop && scrollTop > 200) {
            navbar.style.transform = 'translateY(-100%)';
        } else {
            navbar.style.transform = 'translateY(0)';
        }
        
        lastScrollTop = scrollTop;
    });
    
    // 현재 페이지 메뉴 하이라이트
    highlightCurrentNavItem();
}

/**
 * 현재 페이지 네비게이션 아이템 하이라이트
 */
function highlightCurrentNavItem() {
    const currentPath = window.location.pathname;
    const navLinks = document.querySelectorAll('.navbar-nav .nav-link');
    
    navLinks.forEach(link => {
        const linkPath = new URL(link.href).pathname;
        if (currentPath.includes(linkPath) && linkPath !== '/') {
            link.classList.add('active');
        }
    });
}

/**
 * 툴팁 초기화
 */
function initializeTooltips() {
    // Bootstrap 툴팁 초기화
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
}

/**
 * 알림 메시지 자동 숨김
 */
function initializeAlerts() {
    const alerts = document.querySelectorAll('.alert:not(.alert-permanent)');
    alerts.forEach(alert => {
        // 5초 후 자동 숨김
        setTimeout(() => {
            fadeOut(alert);
        }, 5000);
        
        // 클릭 시 즉시 숨김
        alert.addEventListener('click', function() {
            fadeOut(this);
        });
    });
}

/**
 * 알림 메시지 표시
 */
function showAlert(message, type = 'info') {
    const alertDiv = document.createElement('div');
    alertDiv.className = `alert alert-${type} alert-dismissible fade show position-fixed`;
    alertDiv.style.cssText = 'top: 20px; right: 20px; z-index: 9999; min-width: 300px;';
    alertDiv.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;
    
    document.body.appendChild(alertDiv);
    
    // 3초 후 자동 제거
    setTimeout(() => {
        fadeOut(alertDiv);
    }, 3000);
}

/**
 * 요소 페이드아웃 효과
 */
function fadeOut(element) {
    element.style.transition = 'opacity 0.5s ease-out';
    element.style.opacity = '0';
    
    setTimeout(() => {
        if (element.parentNode) {
            element.parentNode.removeChild(element);
        }
    }, 500);
}

/**
 * 로딩 스피너 표시/숨김
 */
function showLoading() {
    const loadingDiv = document.createElement('div');
    loadingDiv.id = 'loading-spinner';
    loadingDiv.className = 'position-fixed top-0 start-0 w-100 h-100 d-flex justify-content-center align-items-center';
    loadingDiv.style.cssText = 'background: rgba(255,255,255,0.8); z-index: 9999;';
    loadingDiv.innerHTML = `
        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;">
            <span class="visually-hidden">Loading...</span>
        </div>
    `;
    
    document.body.appendChild(loadingDiv);
}

function hideLoading() {
    const loadingDiv = document.getElementById('loading-spinner');
    if (loadingDiv) {
        loadingDiv.remove();
    }
}

/**
 * 날짜 포맷팅
 */
function formatDate(date, format = 'ko') {
    const d = new Date(date);
    
    if (format === 'ko') {
        return d.toLocaleDateString('ko-KR', {
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        });
    } else if (format === 'datetime') {
        return d.toLocaleDateString('ko-KR', {
            year: 'numeric',
            month: '2-digit',
            day: '2-digit',
            hour: '2-digit',
            minute: '2-digit'
        });
    }
    
    return d.toISOString().split('T')[0];
}

/**
 * 텍스트 자르기
 */
function truncateText(text, maxLength) {
    if (text.length <= maxLength) {
        return text;
    }
    return text.substring(0, maxLength) + '...';
}

/**
 * 쿠키 관리
 */
const CookieManager = {
    set: function(name, value, days = 7) {
        const expires = new Date();
        expires.setTime(expires.getTime() + (days * 24 * 60 * 60 * 1000));
        document.cookie = `${name}=${value};expires=${expires.toUTCString()};path=/`;
    },
    
    get: function(name) {
        const nameEQ = name + "=";
        const ca = document.cookie.split(';');
        for(let i = 0; i < ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) === ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
        }
        return null;
    },
    
    delete: function(name) {
        document.cookie = `${name}=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;`;
    }
};

/**
 * 네트워크 상태 모니터링
 */
window.addEventListener('online', function() {
    showAlert('인터넷 연결이 복구되었습니다.', 'success');
});

window.addEventListener('offline', function() {
    showAlert('인터넷 연결이 끊어졌습니다. 연결을 확인해주세요.', 'warning');
});

/**
 * 개발자 도구 감지 (보안)
 */
let devtools = {
    open: false,
    orientation: null
};

if (typeof window !== 'undefined') {
    setInterval(function() {
        if (window.outerHeight - window.innerHeight > 200 || 
            window.outerWidth - window.innerWidth > 200) {
            if (!devtools.open) {
                devtools.open = true;
                console.warn('개발자 도구가 감지되었습니다.');
            }
        } else {
            devtools.open = false;
        }
    }, 500);
}

/**
 * 전역 오류 처리
 */
window.addEventListener('error', function(e) {
    console.error('JavaScript 오류 발생:', e.error);
    // 프로덕션 환경에서는 오류 로깅 서비스로 전송
});

window.addEventListener('unhandledrejection', function(e) {
    console.error('처리되지 않은 Promise 거부:', e.reason);
    e.preventDefault();
});

// 전역 함수로 노출
window.PaperPortal = {
    showAlert,
    hideLoading,
    showLoading,
    formatDate,
    truncateText,
    CookieManager
};