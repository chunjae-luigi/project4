<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP::${boardMgn.boardNm }</title>
    <jsp:include page="../layout/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/sub.css">
    <link rel="stylesheet" href="${path }/resources/css/lecture.css">

</head>
<body>

<jsp:include page="../layout/header.jsp" />
<%-- 페이지 상단 --%>
<div class="container-fluid bg-primary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
        <h3 class="display-3 font-weight-bold text-white">온라인 강의</h3>
        <div class="d-inline-flex text-white">
            <p class="m-0"><a class="text-white" href="${path }/">Home</a></p>
            <p class="m-0 px-2">/</p>
            <p class="m-0"><a class="text-white" href="${path }/lecture/list.do?no=1">해법강의</a></p>
            <p class="m-0 px-2">/</p>
            <p class="m-0"><a class="text-white" href="${path }/lecture/list.do?no=1">온라인강의</a></p>
        </div>
    </div>
</div>
<%-- 페이지 상단 끝 --%>

<div class="container-fluid mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height:50vh">
        <section class="latest-podcast-section section-padding pb-0" id="section_2">

            <!-- 과목탭 -->
            <nav class="nav nav-pills flex-column flex-sm-row" style="width: 1200px; margin: 0 auto;">
                <a class="flex-sm-fill text-sm-center nav-link<c:if test="${sno == 0}"> active</c:if>" aria-current="page" href="${path }/lecture/list.do">전체보기</a>
                <a class="flex-sm-fill text-sm-center nav-link<c:if test="${sno == 1}"> active</c:if>" href="${path }/lecture/list.do?sno=1">영어</a>
                <a class="flex-sm-fill text-sm-center nav-link<c:if test="${sno == 2}"> active</c:if>" href="${path }/lecture/list.do?sno=2">수학</a>
                <a class="flex-sm-fill text-sm-center nav-link<c:if test="${sno == 3}"> active</c:if>" href="${path }/lecture/list.do?sno=3">기타</a>
            </nav>

            <div class="row justify-content-md-end my-5">
                <div class="col-md-4 searchArea">
                    <form action="${path }/lecture/list.do" method="get" class="field has-addons has-addons-right">
                        <input type="hidden" name="no" value="${lecture.lno }" />
                        <input type="hidden" name="sno" value="${sno }" />
                        <div class="input-group">
                            <div class="input-group-append">
                                <select id="inputState" name="type" class="form-control rounded-0 border-right-0">
                                    <option value="lect_tit"<c:if test="${type eq 'lect_tit'}"> selected="selected"</c:if>>강의명</option>
                                    <option value="teacherNm"<c:if test="${type eq 'teacherNm'}"> selected="selected"</c:if>>강사</option>
                                </select>
                            </div>
                            <input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${keyword }" aria-label="Recipient's username" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary rounded-0" type="submit">검색</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="container" style="margin:0 auto !important;">
                <c:forEach items="${lectviewList }" var="lecture" varStatus="status">
                    <div class="lect-frame">
                        <div class="border-00">
                            <div class="d-inline-block lectviewwrap">
                                <div class="img-box">
                                    <!-- 썸네일 - 누르면 상세페이지 이동 -->
                                    <a href="${path }/lecture/get.do?lno=${lecture.lno }">
                                    <c:choose>
                                        <c:when test="${!empty lecture.thumbnail}">
                                           <img src="${path }/resources/upload/lecture/${lecture.thumbnail }" />
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${path }/resources/image/lecture/dummy.png" />
                                        </c:otherwise>
                                    </c:choose>
                                    </a>
                                </div>
                            </div>
                            <div class="d-inline-block lect_info">
                                <div class="custom-block-info">
                                    <h5>${lecture.sub_tit }</h5>
                                    <h1><a href="${path }/lecture/get.do?lno=${lecture.lno }">${lecture.lect_tit }</a></h1>
                                    <h4>${lecture.teacherNm } 선생님</h4>
                                    <h5>${lecture.subTitle }</h5><br>
                                    <div>
                                        <p style="font-size: 20px; color: #5A6268; font-weight: bold"><fmt:formatNumber value="${lecture.cost }" pattern="#,###" />원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>


                <c:if test="${empty lectviewList }">
                    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height:20vh;">
                        <h5 class="font-weight-bold">새로운 강의를 기대해주세요!</h5>
                    </div>
                </c:if>
            </div>

            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${curPage > page.pageCount }">
                        <li class="page-item"><a class="page-link" href="${path }/lecture/list.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" aria-label="Previous"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
                    </c:if>
                    <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                        <c:choose>
                            <c:when test="${i == curPage }">
                                <li class="page-item active"><a class="page-link" href="${path }/lecture/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>">1</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a class="page-link" href="${path }/lecture/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>">1</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${page.blockLastNum < page.totalPageCount }">
                        <li class="page-item"><a class="page-link" href="${path }/lecture/list.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" aria-label="Next"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                    </c:if>
                </ul>
            </nav>

        </section>
    </div>
</div>

<div class="content">

</div>

<jsp:include page="../layout/footer.jsp" />
</body>
</html>
