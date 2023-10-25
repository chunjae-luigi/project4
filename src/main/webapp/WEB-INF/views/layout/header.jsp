<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<div class="container-fluid bg-light position-relative shadow">
    <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0 px-lg-5">
        <a href="${path }/" class="navbar-brand font-weight-bold text-secondary" style="font-size: 50px"><span class="text-primary">
            <img src="${path}/resources/image/common/logo_main.png" alt="해법로고">
        </span></a>

        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">


            <div class="navbar-nav font-weight-bold mx-auto py-0">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">해법</a>
                    <div class="dropdown-menu rounded-0 m-0">
                        <a href="${path }/intro" class="dropdown-item">해법소개</a>
                        <a href="${path }/map" class="dropdown-item">오시는길</a>
                    </div>

                </div>
                <a href="${path }/lecture/list.do" class="nav-item nav-link">온라인강의</a>
                <a href="${path }/academy/calendar" class="nav-item nav-link">방문 상담예약</a>
                <div class="nav-item dropdown board_drop_menu">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
                    <div class="dropdown-menu rounded-0 m-0" id="boardMenuArea"></div>
                </div>
                <a href="${path }/game" class="nav-item nav-link"><i class="fas fa-gamepad" style="color: #000000;"></i></a>

            </div>

            <c:if test="${sid != null}">
                <a href="${path }/user/logout.do" class="btn btn-primary px-4 mr-2"><i class="fas fa-sign-out-alt pr-2" style="color:#ffffff;"></i> 로그아웃</a>
            </c:if>
            <c:if test="${sid == null}">
                <a href="${path }/user/term.do" class="btn btn-primary px-4 mr-2"><i class="fas fa-user-plus pr-2" style="color:#ffffff;"></i>회원가입</a>
                <a href="${path }/user/login.do" class="btn btn-success px-4"><i class="fas fa-sign-in-alt pr-2" style="color:#ffffff;"></i>로그인</a>
            </c:if>
        </div>
    </nav>
</div>
<script>
    $(function (){
        $.ajax({
            url:"${path }/util/getBoardMgnList.do",
            type:"post",
            contentType:"application/json",
            success : function(result) {
                if(result == "") {
                    $(".board_drop_menu").remove();
                }
                for(let i in result) {
                    $("#boardMenuArea").append("<a href='${path }/board/list.do?no=" + result[i].bmNo + "' class='dropdown-item'>" + result[i].boardNm + "</a>");
                }
            },
        });
    });
</script>