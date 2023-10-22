<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP</title>
    <jsp:include page="../layout/adminHead.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/admin.css" />
    <link rel="stylesheet" href="${path }/resources/css/owl.carousel.css" />
</head>
<body>
<jsp:include page="../layout/adminHeader.jsp" />
<div class="pcoded-main-container">
    <div class="pcoded-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">결제 내역</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${path }/admin/"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#!" onclick="return false;">강의 설정</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
        <div class="row justify-content-md-end mb-3">
            <div class="col-md-3 searchArea">
                <form action="" method="get" class="field has-addons has-addons-right">
                    <div class="input-group">
                        <div class="input-group-append">
                            <select id="inputState" name="type" class="form-control">
                                <option value="id"<c:if test="${type eq 'id'}"> selected="selected"</c:if>>회원 아이디</option>
                                <option value="plec"<c:if test="${type eq 'plec'}"> selected="selected"</c:if>>책 제목</option>
                            </select>
                        </div>
                        <input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${keyword }" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="submit">검색</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <h5>강의 내역</h5>
                    </div>
                    <c:if test="${!empty paymentList }">
                        <div class="card-body table-border-style">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th class="text-center">#</th>
                                        <th class="text-center">회원 아이디</th>
                                        <th class="text-center">강의 이름</th>
                                        <th class="text-center">가 격</th>
                                        <th class="text-center">결제 방법</th>
                                        <th class="text-center">결제 날짜</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${paymentList }" var="pay" varStatus="status">
                                        <tr>
                                            <td class="text-center">${status.count }</td>
                                            <td class="text-center"><a href="${path}/admin/memberget.do?id=${pay.id }">${pay.id }</a></td>
                                            <td class="text-center">${pay.plec }</td>
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
                                            <li class="page-item"><a class="page-link" href="${path }/admin/paymentList_admin.do?page=${page.blockStartNum - 1 }" aria-label="Previous"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
                                        </c:if>
                                        <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                                            <c:choose>
                                                <c:when test="${i == curPage }">
                                                    <li class="page-item active"><a class="page-link" href="${path }/admin/paymentList_admin.do?page=${i }">1</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="${path }/admin/paymentList_admin.do?page=${i }">1</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${page.blockLastNum < page.totalPageCount }">
                                            <li class="page-item"><a class="page-link" href="${path }/admin/paymentList_admin.do?page=${page.blockLastNum + 1 }" aria-label="Next"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                                        </c:if>
                                    </ul>
                                </nav>
                        </div>
                    </c:if>
                    <c:if test="${empty paymentList }">
                        <p class="f-18 f-w-600 text-center mt-3">등록된 결제 내역이 없습니다.</p>
                    </c:if>
                </div>
            </div>
        </div>

    </div>
</div>
<jsp:include page="../layout/adminFooter.jsp" />
</body>
</html>