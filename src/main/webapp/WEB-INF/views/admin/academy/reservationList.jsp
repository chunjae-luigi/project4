<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP</title>
    <jsp:include page="../../layout/adminHead.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/admin.css" />
    <link rel="stylesheet" href="${path }/resources/css/owl.carousel.css" />
</head>
<body>
    <jsp:include page="../../layout/adminHeader.jsp" />
    <div class="pcoded-main-container">
        <div class="pcoded-content">
            <!-- [ breadcrumb ] start -->
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">예약 목록</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${path }/admin/"><i class="feather icon-home"></i></a></li>
                                <li class="breadcrumb-item"><a href="#!" onclick="return false;">예약 목록</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ breadcrumb ] end -->
            <!-- [ Main Content ] start -->
            
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-header">
                            <h5>예약 목록</h5>
                        </div>
                        <c:if test="${!empty reservationList }">
                            <div class="card-body table-border-style">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th class="text-center">#</th>
                                            <th class="text-center">예약자</th>
                                            <th class="text-center">예약자 전화번호</th>
                                            <th class="text-center">예약일</th>
                                            <th class="text-center">예약시간</th>
                                            <th class="text-center">예약 상태</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${reservationList }" var="reservation" varStatus="status">
                                            <tr>
                                                <td class="text-center">${status.count }</td>
                                                <td class="text-center"><a href="${path }/academy/adminReservationGet?rno=${reservation.rno}">${reservation.name }</a></td>
                                                <td class="text-center">${reservation.tel}</td>
                                                <td class="text-center">${reservation.rdate}</td>
                                                <td class="text-center">${reservation.rtime}</td>
                                                <td class="text-center ${reservation.status}">${reservation.status}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <c:if test="${curPage > page.pageCount }">
                                            <li class="page-item"><a class="page-link" href="${path }/academy/adminReservationList?page=${page.blockStartNum - 1 }" aria-label="Previous"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
                                        </c:if>
                                        <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                                            <c:choose>
                                                <c:when test="${i == curPage }">
                                                    <li class="page-item active"><a class="page-link" href="${path }/academy/adminReservationList?page=${i }">1</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="${path }/academy/adminReservationList?page=${i }">1</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${page.blockLastNum < page.totalPageCount }">
                                            <li class="page-item"><a class="page-link" href="${path }/academy/adminReservationList?page=${page.blockLastNum + 1 }" aria-label="Next"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                                        </c:if>
                                    </ul>
                                </nav>
                            </div>
                        </c:if>
                        <c:if test="${empty reservationList }">
                            <p class="f-18 f-w-600 text-center mt-3">등록된 강의가 없습니다.</p>
                        </c:if>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>
    <jsp:include page="../../layout/adminFooter.jsp" />
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