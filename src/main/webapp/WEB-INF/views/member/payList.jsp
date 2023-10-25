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
                            <li><a href="${path }/user/mypagePaylistMem.do" class="active px-4 py-2">나의 결제정보</a></li>
                            <li><a href="${path }/academy/mypageReservation.do" class="px-4 py-2">나의 예약정보</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-10 p-2">
                    <div class="d-flex flex-column align-items-center justify-content-center right_side">
                        <h5 class="my-4" style="font-size:2.5em;font-weight:600;">결제 내역</h5>

                        <div class="container px-5">
                            <table class="table table-bordered mx-3">
                                <colgroup>
                                    <col style="width:20%;">
                                    <col style="width:auto;">
                                </colgroup>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">강의 이름</th>
                                    <th class="text-center">선생님 이름</th>
                                    <th class="text-center">가 격</th>
                                    <th class="text-center">결제 방법</th>
                                    <th class="text-center">결제 날짜</th>
                                </tr>
                                <tbody>
                                <c:forEach items="${paymentList }" var="pay" varStatus="status">
                                    <tr>
                                        <td class="text-center">${status.count }</td>
                                        <td class="text-center">${pay.plec }</td>
                                        <td class="text-center"> ${pay.tecnm } </td>
                                        <td class="text-center">${pay.price }</td>
                                        <td class="text-center">${pay.pmethod }</td>
                                        <td class="text-center">${pay.resdate }</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <c:if test="${curPage > page.pageCount }">
                                    <li class="page-item"><a class="page-link" href="${path }/admin/paymentList_mypage.do?page=${page.blockStartNum - 1 }" aria-label="Previous"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
                                </c:if>
                                <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                                    <c:choose>
                                        <c:when test="${i == curPage }">
                                            <li class="page-item active"><a class="page-link" href="${path }/admin/paymentList_mypage.do?page=${i }">1</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="${path }/admin/paymentList_mypage.do?page=${i }">1</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${page.blockLastNum < page.totalPageCount }">
                                    <li class="page-item"><a class="page-link" href="${path }/admin/paymentList_mypage.do?page=${page.blockLastNum + 1 }" aria-label="Next"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
                <c:if test="${empty paymentList }">
                    <p class="f-18 f-w-600 text-center mt-3">등록된 결제 내역이 없습니다.</p>
                </c:if>
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