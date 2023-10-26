<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<style>
    .quickMenu ul {margin-bottom: 0;}
</style>

<!-- quickMenu -->
<c:if test="${sid != null}">
<div class="quickMenu">
    <div class="quick_title">
        Quick
        <br>
        Menu
    </div>
    <div class="quick_btn">
        <c:if test="${sid eq 'admin'}">
                <ul>
                    <li class="quick01">
                        <a href="${path }/admin/">
                            <p>관리자페이지</p>
                        </a>
                    </li>
                    <li class="quick02">
                        <a href="${path }/user/myPage.do">
                            <p>마이페이지</p>
                        </a>
                    </li>
                    <li class="quick03">
                        <a href="${path }/chat/userChat">
                            <p>채팅</p>
                        </a>
                    </li>
                    <li class="quick04">
                        <a href="${path }/user/mypageLectList.do">
                            <p>나의 강의실</p>
                        </a>
                    </li>
                </ul>
        </c:if>
        <c:if test="${sid ne 'admin'}">
                <ul>
                    <li class="quick01">
                        <a href="${path }/user/myPage.do">
                            <p>마이페이지</p>
                        </a>
                    </li>
                    <li class="quick02">
                        <a href="${path }/user/mypageLectList.do">
                            <p>나의 강의실</p>
                        </a>
                    </li>
                    <li class="quick03">
                        <a href="${path }/chat/userChat">
                            <p>채팅</p>
                        </a>
                    </li>
                </ul>
        </c:if>
    </div>
    <div class="quick_top">
        <a href="#">TOP</a>
    </div>
</div>
</c:if>
<footer id="ft">

    <div id="footer">
        <div class="footer_in">
            <div><img src="${path}/resources/image/common/logo_ft.png" style="cursor:pointer"></div>
            <div class="footerIn_txt">
                <div>
                    <a href="${path }/intro">회사소개</a>
                    <a href="${path }/map">오시는길</a>
                    <a href="${path }/policy">이용약관</a>
                </div>
                <dl>
                    <dt>(주)해법 </dt>
                    <dd>대표자 : 최상민</dd>
                    <dd>사업자등록번호 : 1004-8282-1004</dd>
                    <dd>부가통신사업 신고 번호 : 54321</dd>
                    <dd>통신판매신고서 : 제2023-서울금천-1501호</dd>
                    <dd>주소 : 서울 금천구 가산로9길 54 (가산동)</dd>
                    <dd>대표번호 :&nbsp;1577-1004</dd>
                    <p class="copy">Copyright ⓒ HAEBEOP Corp. All Rights Reserved</p>
                </dl>
            </div>


            <div class="foot-side">
                <div class="foot-cont cs">
                    <div class="foot-cscenter">
                        <p class="tel">고객센터</p>
                        <h3>1577-1004</h3>
                        <div class="open-time"><span>운영시간</span> <span class="time">오전 10시 ~ 오후 5시 (주말, 공휴일 휴무)</span></div>
                        <div class="open-time lunch"><span>점심시간</span> <span class="time">오후 11시 00분 ~ 오후 1시 00분</span></div>
                    </div>
                </div>
                <div class="foot-sns">
                    <a href="https://www.instagram.com/genia.academy/"><img src="http://fiximage.10x10.co.kr/web2021/cscenter/icon_sns_instagram.png" alt="insta"></a>
                    <a href="#"><img src="http://fiximage.10x10.co.kr/web2021/cscenter/icon_sns_facebook.png" alt="facebook"></a>
                    <a href="https://www.youtube.com/channel/UCgJ8iR8g3_7Cx-kqZZAcRrQ"><img src="http://fiximage.10x10.co.kr/web2021/cscenter/icon_sns_you.png" alt="yotube"></a>
                </div>
            </div>
        </div>
    </div>

</footer>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="${path }/resources/js/common.js"></script>