<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=no">
<link rel="stylesheet" type="text/css" href="resources/css/reset.css?ver=1.0">
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
.pw_check {
display: none;
text-align: right;
}
.join_table {
width: 100%;
}
.join_table th {
width: 40%;
}
.join_table td {
width: 60%;
}
.join_table thead {
color: #fff;
background: #2c3e50;
font-size: 0.813em;
font-size: 0.813rem;
}
.join_table thead tr th {
padding: 18px 0;
padding: 1.125rem 0;
}
.join_table tbody {
font-size: 0.813em;
font-size: 0.813rem;
}
.join_table tbody tr td {
padding: 10px 2%;
}
td input{
height: 30px;
width: 96%;
border: 0;
}
.id_input {
border-right: none;
}
.id_check {
/* border-left: none; */
padding: 0px;
width: 40px;
}
.id_check input{
/* border-left: none; */
padding: 0px;
width: 100px;
}
td input:focus {
outline: 1px solid auto;
}
th, td {
vertical-align: middle;
}
.join_table tbody th {
background: #f6f6f6;
}
/* .read_subject::placeholder {
color: black;
} */
.join_btn, .id_check_btn{
float: right;
width:50px;
width:3.125rem;
height:30px;
height:1.875rem;
font-size:0.7em;
font-size:0.7rem;
line-height:30px;
line-height:1.875rem;
text-align:center;
background:#e65d5d;
color:#fff;
}
.join_btn {
margin-top: 10px;
float: right;
width: 100%;
}
table, tr, td {
border: 1px solid #e9e9e9;
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
<script>
$(function(){
    $(".menu_toggle_btn").click(function(){
        $(".gnb").stop().slideToggle("fast");
        // stop() : 현재 실행중인 효과를 모두 중지, slideToggle : 숨겨진 요소를 펴고 접는 기능
    });
});
function pw_check() {
    var pw1 = $('.pw1').val();
    var pw2 = $('.pw2').val();

    if (pw1 != pw2) {
        $('.pw_check').css('display', 'table-cell');
        $('.pw_check').html('비밀번호가 일치하지 않습니다.').css('color', 'red');
    } else {
        $('.pw_check').css('display', 'none');
        $('.pw_check').empty();
    }
}
</script>
</head>
<body>
	<div id="wrap">
        <section class="info_section">
            <ul class="info_list">
                <li><a href="index"><img src="http://localhost:8383/bbs/resources/images/s_images/info_icon_01.png" alt=""></a></li>
                <li><a href=""><img src="http://localhost:8383/bbs/resources/images/s_images/info_icon_02.png" alt=""></a></li>
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
            <h2>글열람</h2>
            <ul class="breadcrum_list">
                <li><a href="index">홈 / </a></li>
                <li><a href="list">게시판 / </a></li>
                <li><a href="#">글열람 </a></li>
            </ul>
        </section>
        <section class="content_section">
            <form action="join" method="post">
            <table class="join_table">
                <thead>
                    <tr>
                        <th colspan="4">회원가입</th>
                    </tr>
                </thead>
                <tbody>
                   <tr>
                    <th>아이디</th>
                    <td class="id_input"><input type="text" name="id" maxlength="20"></td>
                    <td class="id_check"><input type="button" class="id_check_btn" onclick="id_check()" value="중복확인"></td>
                   </tr>
                   <tr>
                    <th>비밀번호</th>
                    <td colspan="2"><input type="password" name="pw1" class="pw1" onkeyup="pw_check()" maxlength="20"></td>
                   </tr>
                   <tr>
                    <th>비밀번호 확인</th>
                    <td colspan="2"><input type="password" name="pw2" class="pw2" onkeyup="pw_check()" maxlength="20"></td>
                   </tr>
                   <tr>
                    <th>이름</th>
                    <td colspan="2"><input type="text" name="name" maxlength="20"></td>
                   </tr>
                   <tr>
                    <th>나이</th>
                    <td colspan="2"><input type="text" name="age" maxlength="20"></td>
                   </tr>
                   <tr>
                    <th>이메일</th>
                    <td colspan="2"><input type="email" name="id" maxlength="20"></td>
                   </tr>
                   <tr>
                       <td colspan="3" class="pw_check"></td>
                   </tr>
                </tbody>
            </table>
            <div>
                <input type="submit" class="join_btn" value="가입하기">
            </div>
            </form>
        </section>
        <footer class="footer">
            <p>copyright&copy;2014.data world blog all right reserved.</p>
        </footer>
    </div>
</body>
</html>