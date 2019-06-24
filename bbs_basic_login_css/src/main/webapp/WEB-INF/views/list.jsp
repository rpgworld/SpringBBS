<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8383/bbs/resources/css/reset.css?ver=1.0">
<link rel="stylesheet" href="#">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>

/* 모바일용 css */
/* 기본 css */
#wrap {
display: flex;
flex-flow: column nowrap;
width: 80%;
margin: 0 auto;
max-width: 1200px;
}
#wrap section {
box-sizing: border-box;
}
/* 인포메이션 영역 css */
.info_section {
order: 1;
width: 100%;
background: #2ecc71;
border-bottom: 1px solid #39d67c;
}
.info_list {
display: flex;
}
.info_list li {
width: 25%;
text-align: center;
}
.info_list li a {
display: block;
padding: 15px 0;
padding: 0.938rem 0;
}
/* 헤더 영역 css */
.header {
display: flex;
order: 2;
flex-direction: column; /* 모바일의 경우, 로고 다음에 메뉴가 세로로 배치 */
position: relative; /* 토글이 놓일 기준을 설정하기 위해서 */
width: 100%;
}
.logo {
width: 100%;
padding: 30px 0;
padding: 1.875rem 0;
font-size: 1.188em;
font-size: 1.188rem;
line-height: 21px;
line-height: 1.313rem;
text-align: center;
text-transform: uppercase;
background: #2ecc71;
text-shadow: 0px 1px 1px #25ab5e;
}
.nav {
order: 2;
width: 100%;
}
/* 자바스크립트로 클릭 이벤트 구현 후에 추가 */
.gnb {
display: none;
}
.gnb li {
display: flex;
background: #2c3e50;
}
.gnb li a {
width: 80%;
padding: 20px 0;
padding: 1.250rem 0;
font-size: 0.938em;
font-size: 0.938rem;
text-indent: 20px;
text-indent: 1.250rem;
font-weight: bold;
text-transform: uppercase;
}
.gnb li span {
width: 20%;
text-indent: -9999px;
background: url(http://localhost:8383/bbs/resources/images/s_images/sub_menu_toggle_btn.png) center center no-repeat;
cursor: pointer; /* 마우스 모양 손모양으로 변경 */
}
.menu_toggle_btn {
display: block;
width: 30px;
width: 1.875rem;
height: 30px;
height: 1.875rem;
position: absolute;
top: 10px;
top: 0.625rem;
right: 10px;
right: 0.625rem;
text-indent: -9999px;
background: url(http://localhost:8383/bbs/resources/images/s_images/menu_toggle_btn.png) no-repeat;
cursor: pointer;
}
/* 서브 헤더 영역 css */
.sub_header_section {
order: 3;
padding: 48px 0;
padding: 3.000rem 0;
text-align: center;
background: #219af7;
}
.sub_header_section h2 {
margin-bottom: 12px;
margin-bottom: 0.750rem;
font-size: 1.313em;
font-size: 1.313rem;
color: #fff;
}
.breadcrum_list li{
display: inline;
font-size: 0.813em;
font-size: 0.813rem;
font-weight: bold;
}
/* 컨텐츠 영역 css */
.content_section {
order: 4;
padding: 20px;
padding: 1.250rem;
background: #fff;
}
.bbs_table {
width: 100%;
}
.bbs_table caption {
position: absolute;
top: -9999px;
left: -9999px;
width: 1px;
height: 1px;
overflow: hidden;
visibility: hidden;
}
.bbs_table thead, .bbs_table tbody {
font-size: 0.813em;
font-size: 0.813rem;
text-align: center;
font-weight: bold;
}
.bbs_table thead {
color: #fff;
background: #2c3e50;
}
.bbs_table tbody, .bbs_table tbody a {
color: #333;
}
.bbs_table tbody tr:nth-child(odd) {
background: #f6f6f6;
}
.bbs_table thead tr th {
padding: 18px 0;
padding: 1.125rem 0;
}
.bbs_table tbody tr td {
padding: 22px 0;
padding: 1.375rem 0;
}
.bbs_table thead tr th:first-child, .bbs_table thead tr th:nth-child(3), .bbs_table thead tr th:nth-child(4), .bbs_table thead tr th:nth-child(5), .bbs_table thead tr th:nth-child(6), .bbs_table thead tr th:nth-child(7),
.bbs_table tbody tr td:first-child, .bbs_table tbody tr td:nth-child(3), .bbs_table tbody tr td:nth-child(4), .bbs_table tbody tr td:nth-child(5), .bbs_table tbody tr td:nth-child(6), .bbs_table tbody tr td:nth-child(7) {
    display: none;
}
.bbs_search {
width: 100px;
height: 25px;
}
.content_row_2{
margin-top: 20px;
margin-top: 1.25rem;
display: flex;
align-items: flex-start;
justify-content: space-between;
}

.search_select_box { 
-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
-moz-appearance: none; 
appearance: none; 
height: 27px;
padding: 0 0.3em; /* 여백값 설정 */
background: #e65d5d;
color: #fff;
}
.seach_btn {
height: 25px;
width: 50px;
background: #e65d5d;
color: #fff;
}
/* 모바일 화면에서 select, btn 안보이게 하기 */
.search_select_box, .seach_btn {
display: none;
}
.write_box a{
display:block;
width:70px;
width:4.375rem;
height:30px;
height:1.875rem;
font-size:0.813em;
font-size:0.813rem;
line-height:30px;
line-height:1.875rem;
text-align:center;
background:#e65d5d;
color:#fff;
}
.content_row_3 {
display: flex;
justify-content: center;
margin-top: 20px;
margin-top: 1.250rem;
}
.content_row_3 span {
width: 28px;
width: 1.750rem;
height: 28px;
height: 1.750rem;
text-indent: -9999px;
}
.content_row_3 span.list_prev_btn {
margin-right: 10px;
margin-right: 0.625rem;
background: #2ecc71 url(http://localhost:8383/bbs/resources/images/s_images/list_prev_btn.png) center center no-repeat;
}
.content_row_3 span.list_next_btn {
margin-left: 10px;
margin-left: 0.625rem;
background: #2ecc71 url(http://localhost:8383/bbs/resources/images/s_images/list_next_btn.png) center center no-repeat;
}
.content_row_3 a {
width: 26px;
width: 1.625rem;
font-size: 0.813em;
font-size: 0.813rem;
line-height: 26px;
line-height: 1.625rem;
text-align: center;
border: 1px solid #219af7;
color: #219af7;
transition: all 0.2s;
}
.content_row_3 a{ /* nth-of-type(n) : 같은 유형의 n 번째 형제 */
margin: 0 3px;
margin: 0 0.1875rem;
}
.content_row_3 a:hover {
color: #fff;
background: #219af7;
}

/* 푸터 css */
.footer {
order: 5;
width: 100%;
background: #474747;
}
.footer p {
padding: 20px;
padding: 1.250rem;
font-size: 0.813em;
font-size: 0.813rem;
text-align: center;
text-transform: uppercase;
font-weight: bold;
color: #fff;
text-shadow: 0px 1px 1px #191919;
}

/* 태블릿용 css */
@media all and (min-width: 768px) {
/* #wrap {
flex-flow: row wrap;
} */
/* 헤더 영역 css */
.header {
flex-direction: row;
}
.logo {
position: absolute;
top: 0;
left: 0;
z-index: 10;
width: 15.625%; /* 로고 너빗갓 : 120px / 768px */
padding: 0;
}
.logo a {
display: block;
padding: 50px 0;
padding: 3.125rem 0;
}
.nav {
position: relative;
min-height: 80px;
min-height: 5.000rem;
background: #2ecc71;
}
.gnb {
position: absolute;
top: 100%;
right: 0;
z-index: 20;
width: 40.10416667%; /* 308px / 768px */
}
.menu_toggle_btn {
top: 50%;
right: 30px;
right: 1.875rem;
z-index: 20;
margin-top: -15px; /* 위쪽으로 50% 이기 때문에 정확히 중앙으로 맞추기 위해서 */
margin-top: -0.938rem;
}
/* 컨텐츠 영역 css */
.content_section {
padding: 40px;
padding: 2.500rem;
}
.bbs_table thead tr th:first-child, .bbs_table thead tr th:nth-child(3), .bbs_table thead tr th:nth-child(4), .bbs_table thead tr th:nth-child(5), .bbs_table thead tr th:nth-child(6), .bbs_table thead tr th:nth-child(7),
.bbs_table tbody tr td:first-child, .bbs_table tbody tr td:nth-child(3), .bbs_table tbody tr td:nth-child(4), .bbs_table tbody tr td:nth-child(5), .bbs_table tbody tr td:nth-child(6), .bbs_table tbody tr td:nth-child(7) {
display: table-cell; /* block 으로 설정해서 보이도록 만듭니다. */
}
.bbs_table thead tr th:first-child {
width: 10%;
}
.bbs_table thead tr th:nth-child(2) {
width: 30%;
}
.bbs_table thead tr th:nth-child(3) {
width: 10%;
}
.bbs_table thead tr th:nth-child(4) {
width: 15%;
}
.bbs_table thead tr th:nth-child(5) {
width: 15%;
}
.bbs_table thead tr th:nth-child(6) {
width: 10%;
}
.bbs_table thead tr th:nth-child(7) {
width: 10%;
}
.bbs_table tbody tr td:nth-child(2){
text-align: left;
}
/* 모바일 화면에서 select, btn 안보이게 하기 */
.search_select_box, .seach_btn {
display: inline-block;
}
/* 푸터 css */
.footer {
padding: 40px 0;
padding: 2.500rem 0;
}
}

/* PC 용 css */
@media all and (min-width: 960px) {
#wrap {
position: relative;
width: 90%;
}
/* 인포메이션 영역 css */
.info_section {
order: 0; /* order 값을 초기화. 기존값 : 1 */
position: absolute; /* 상단 오른쪽으로 배치하기 위해서 */
top: 30px;
top: 1.875rem;
right: 30px;
right: 1.875rem;
z-index: 30;
width: auto;
border-bottom: 0;
}
.info_list li {
width: auto;
margin-left: 15px;
margin-left: 0.625rem;
}
.info_list li a {
padding: 0;
}
.header {
order: 1;
justify-content:flex-end; /* 로고와 네비가 겹치는 걸 대비해 주축의 끝을 기준으로 배치 */
position: static; /* 위치를 상대적으로 할 필요가 없기 때문에 고정 */
}
.logo {
width: 12.5%; /* 120px / 960px */
}
.nav {
display: flex;
align-items: center; /* 교차축의 세로 중앙으로 세우기 위해 */
position: static; 
width: 87.5%; /* 840px / 960px */
}
.gnb {
display: flex !important; /* !important : 다른것보다 최우선으로 적용 */
flex-direction: row;
position: static;
width: 100%;
text-shadow: 0px 1px 1px #25ab5e;
}
.gnb li {
display: block;
margin-left: 5.208333%; /* 50px / 840px */
background:none;
}
.gnb li a {
width: auto;
padding: 0;
text-indent: 0;
}
.gnb li span {
display: none;
}
.menu_toggle_btn {
display: none;
}
/* 서브 헤더 영역 css */
.sub_header_section {
order: 2;
}
/* 컨텐츠 영역 css */
.content_section {
order: 3;
padding: 60px;
padding: 3.750rem;
}
/* 푸터 영역 css */
.footer {
order: 4;
}
.footer p {
padding-left: 3.125%; /* 30px / 960px */
text-align: left;
}
}
</style>

</head>
<body>

<c:if test="${sessionScope.id != null }">
	<c:set var="id" value="${sessionScope.id }" />
</c:if>
<c:if test="${sessionScope.msgType != null }" >
	<c:set var="msgType" value="${sessionScope.msgType }"/>
	<c:set var="msgContent" value="${sessionScope.msgContent }"/>
</c:if>
<script>
	var msgType = '${msgType}';
	var msgContent = '${msgContent}';
	
$('document').ready(function(){
	if(msgType != '') {
		alert(msgType + ' + ' + msgContent);
	}
});

$(function(){
    $(".menu_toggle_btn").click(function(){
        $(".gnb").stop().slideToggle("fast");
        // stop() : 현재 실행중인 효과를 모두 중지, slideToggle : 숨겨진 요소를 펴고 접는 기능
    });
});

</script>

    <div id="wrap">
        <section class="info_section">
            <ul class="info_list">
                <li><a href="index.html"><img src="http://localhost:8383/bbs/resources/images/s_images/info_icon_01.png" alt=""></a></li>
                <li><a href="#"><img src="http://localhost:8383/bbs/resources/images/s_images/info_icon_02.png" alt=""></a></li>
                <li><a href="#"><img src="http://localhost:8383/bbs/resources/images/s_images/info_icon_03.png" alt=""></a></li>
                <li><a href="#"><img src="http://localhost:8383/bbs/resources/images/s_images/info_icon_04.png" alt=""></a></li>
            </ul>
        </section>
        <header class="header">
            <h1 class="logo">
                <a href="index">Movie<br>Cafe</a>
            </h1>
            <nav class="nav">
                <ul class="gnb">
                    <li><a href="index">홈</a><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span></li>
                    <li><a href="#">소개</a><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span></li>
                    <li><a href="list">게시판</a><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span></li>
                    <li><a href="#">문의사항</a><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span></li>
                </ul>
            </nav>
            <span class="menu_toggle_btn">전체 메뉴 토글 버튼</span>
        </header>
        <section class="sub_header_section">
            <h2>게시판</h2>
            <ul class="breadcrum_list">
                <li><a href="index">홈 / </a></li>
                <li><a href="list">게시판</a></li>
            </ul>
        </section>
        <section class="content_section">
            <div class="content_row_1">
                <table class="bbs_table">
                    <caption>게시판</caption>
                    <thead>
                        <tr>
                            <th>글번호</th>
                            <th>글제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>작성시간</th>
                            <th>조회수</th>
                            <th>답글수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list }" var="dto">
                            <tr>
                                <td><a href="read?num=${dto.num }">${dto.num }</a></td>
                                <td>
                                    <c:forEach begin="1" end="${dto.lev }">
                                        <c:out value="&nbsp; &nbsp;" escapeXml="false"/>
                                    </c:forEach>
                                    <a href="read?num=${dto.num }"><c:out value="${dto.title }"/></a>
                                </td>
                                <td>${dto.name }</td>
                                <td>${dto.writeDate }</td>
                                <td>${dto.writeTime }</td>
                                <td>${dto.hit }</td>
                                <td>${dto.replyCnt }</td>
                            </tr>
					    </c:forEach>
                    </tbody>
                </table>    
            </div>
            <div class="content_row_2">
                <div class="search_box">
                    <form action="search" method="get">
                        <select class="search_select_box" name="searchOption">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                            <option value="both">제목+내용</option>
                            <option value="name">작성자</option>
                        </select>
                        <input type="search" name="searchWord" class="bbs_search" placeholder="검색어">
                        <input type="submit" class="seach_btn" value="검색">
                    </form>
                </div>
                <div class="write_box">
                    <a href="writeForm">글 쓰기</a>
                </div>
            </div>
            <div class="content_row_3">
                <span class="list_prev_btn">이전 버튼</span>
                <c:forEach var="i" begin="1" end="${pageCnt }">
                    <a href="list?curPage=${i }">${i }</a>
                </c:forEach>
                <span class="list_next_btn">다음 버튼</span>
            </div>
        </section>
        <footer class="footer">
            <p>copyright&copy;2014.data world blog all right reserved.</p>
        </footer>
    </div>
<c:if test="${sessionScope.msgType != null }">
	<c:remove var="msgType" scope="session" />
	<c:remove var="msgContent" scope="session" />
</c:if>
</body>
</html>