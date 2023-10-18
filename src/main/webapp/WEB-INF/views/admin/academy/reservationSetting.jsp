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
                                <h5 class="m-b-10">예약 설정</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${path }/admin/"><i class="feather icon-settings"></i></a></li>
                                <li class="breadcrumb-item"><a href="${path}/academy/reservationList" onclick="return false;">예약 설정</a></li>
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
                            <h5>예약 내역</h5>
                        </div>
                        <div class="card-body table-border-style">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                    <tr>
                                        <th class="text-center">예약자</th>
                                        <td class="text-center">${reservation.name }</td>
                                    </tr>
                                    <tr>
                                        <th class="text-center">예약자 전화번호</th>
                                        <td class="text-center">${reservation.tel}</td>
                                    </tr>
                                    <tr>
                                        <th class="text-center">예약자 이메일</th>
                                        <td class="text-center">${reservation.email}</td>
                                    </tr>
                                    <tr>
                                        <th class="text-center">예약일</th>
                                        <td class="text-center">${reservation.rdate}</td>
                                    </tr>
                                    <tr>
                                        <th class="text-center">예약시간</th>
                                        <td class="text-center">${reservation.rtime}</td>
                                    </tr>
                                    <tr>
                                        <th class="text-center">예약 상태</th>
                                        <td class="text-center ${reservation.status}">
                                            <form name="frm1" id="frm1" action="${path}/academy/reservationUpdate" method="post">
                                                <input type="hidden" name="rno" value="${reservation.rno}">
                                                <div class="d-flex" style="justify-content: space-around; align-items: center;">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="status" id="pending" value="pending">
                                                        <label class="form-check-label" for="pending">보류</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="status" id="approve" value="approve">
                                                        <label class="form-check-label" for="approve">승인</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="status" id="refuse" value="refuse">
                                                        <label class="form-check-label" for="refuse">거절</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="status" id="end" value="end">
                                                        <label class="form-check-label" for="end">상담 완료</label>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">상태 변경</button>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="text-center">예약자 학교</th>
                                        <td class="text-center">${reservation.school} ${reservation.grade}학년</td>
                                    </tr>
                                    <tr>
                                        <th class="text-center">예약자 생일</th>
                                        <td class="text-center">${reservation.birth}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
    $("#${reservation.status}").attr("checked", true);
</script>