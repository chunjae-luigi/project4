<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP::마이페이지</title>
    <jsp:include page="../layout/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/sub.css">
</head>
<body class="myPage">
    <jsp:include page="../layout/header.jsp" />

    <div class="container-fluid">
        <div class="row justify-content-md-center my-5">
            <div class="col-8">
                <div class="row">
                    <div class="col-2 p-2">
                        <div class="d-flex flex-column align-items-center justify-content-center border left_side">
                            <div class="left_top">
                                <p>마이페이지</p>
                            </div>
                            <ul class="my-2" style="width:100%;">
                                <li><a href="${path }/user/myPage.do" class="px-4 py-2">나의 정보</a></li>
                                <li><a href="${path }/user/mypageLectList.do" class="px-4 py-2">나의 강의실</a></li>
                                <li><a href="${path }/user/mypagePaylistMem.do" class="px-4 py-2">나의 결제정보</a></li>
                                <li><a href="${path }/academy/mypageReservation.do" class="active px-4 py-2">나의 예약정보</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-10 p-2">
                        <div class="d-flex flex-column align-items-center justify-content-center right_side">
                            <h5 class="my-4" style="font-size:2.5em;font-weight:600;">예약 내역</h5>

                            <div class="container px-5">
                                <table class="table table-bordered mx-3">
                                    <thead>
                                    <tr>
                                        <th>예약자 성함</th>
                                        <th>예약일</th>
                                        <th>예약시간</th>
                                        <th>승인 상태</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${reservations}" var="r">
                                            <tr>
                                                <td>${r.name}</td>
                                                <td>${r.rdate}</td>
                                                <td>${r.rtime}</td>
                                                <td class="${r.status}">${r.status}</td>
                                            </tr>
                                        </c:forEach>
                                    <c:if test="${empty reservations}">
                                        <tr><td colspan="4" style="text-align: center;">예약 내역이 존재하지 않습니다.</td></tr>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <jsp:include page="../layout/footer.jsp" />
    <script>
        <c:if test="${msg eq 'pwSuccess'}">
        alert("비밀번호가 성공적으로 변경되었습니다.");
        </c:if>
    </script>
</body>
</html>

<script>
    $(".pending").each(function(){
        $(this).text("보류");
    })

    $(".approve").each(function(){
        $(this).text("승인");
    })

    $(".refuse").each(function(){
        $(this).text("거절");
    })

    $(".end").each(function(){
        $(this).text("상담 완료");
    })
</script>