<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../include/head.jsp" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <jsp:include page="../include/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/lecture.css">
    <link rel="stylesheet" href="${path }/resources/css/style.css">
</head>
<body>
<jsp:include page="../include/header.jsp" />
<!-- 페이지 상단 -->
<div class="container-fluid pt-5 bg-primary hero-header">
    <div class="container pt-5">
        <div class="row g-5 pt-5">
            <div class="col-lg-6 align-self-center text-center text-lg-start mb-lg-5">
                <h1 class="display-4 text-white mb-4 animated slideInRight">강의리스트</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center justify-content-lg-start mb-0">
                        <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                        <li class="breadcrumb-item"><a class="text-white" href="#">해법강의</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">강의리스트</li>
                    </ol>
                </nav>
            </div>
            <div class="col-lg-6 align-self-end text-center text-lg-end">
                <img class="img-fluid" src="${path }/resources/img/hero-img.png" alt="" style="max-height: 300px;">
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="searchModal" tabindex="-1">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content" style="background: rgba(20, 24, 62, 0.7);">
            <div class="modal-header border-0">
                <button type="button" class="btn btn-square bg-white btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex align-items-center justify-content-center">
                <div class="input-group" style="max-width: 600px;">
                    <input type="text" class="form-control bg-transparent border-light p-3"
                           placeholder="Type search keyword">
                    <button class="btn btn-light px-4"><i class="bi bi-search"></i></button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 페이지 상단 끝 -->

<div class="content">
<section class="latest-podcast-section section-padding pb-0" id="section_2">

    <form action="${path }/lecture/list.do" method="get" class="field has-addons has-addons-right">
        <p class="control">
                <span class="select">
                    <select id="type" name="type">
                        <option value="title">제목</option>
                    </select>
                </span>
        </p>
        <p class="control">
            <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${keyword }">
        </p>
        <p class="control">
            <input type="submit" class="button is-mainColor" value="검색" />
        </p>
    </form>

    <div class="container">
        <div class="row justify-content-center">

            <div class="col-lg-10 col-12">
                <div class="section-title-wrap mb-5">
                    <h3 class="section-title">테스트</h3>
                </div>

                <c:forEach items="${lectureList }" var="lecture" varStatus="status">

                <div class="lect-frame">
                    <div class="border-00">
                    <div class="d-inline-block img-box-wrap">
                        <div class="img-box">
                            <!-- 썸네일 - 누르면 상세페이지 이동 -->
                            <a href="${path }/lecture/get.do?lno=${lecture.lno }">
                                <img src="${path}/resources/upload/${lecture.thumbnail }">
                            </a>
                        </div>
                    </div>
                    <div class="d-inline-block lect_info">
                        <div class="custom-block-info">

                            <h2 class="mb-2">
                                <a href="${path }/lecture/get.do?lno=${lecture.lno }">${lecture.title }</a>
                            </h2>

                            <h3>${lecture.subTitle }</h3>
                            <p>과목 : ${lecture.sno } </p>
                            <p>강사 : ${lecture.teacherId } 선생님</p>
                            <p>수강인원 : ${lecture.studentCnt }명</p>
                            <p>${lecture.cost }원</p>

                        </div>
                    </div>
                    </div>
                    </div>
                </div>
                </c:forEach>
                <c:if test="${empty lectureList }">
                    없다...
                </c:if>
            </div>

        </div>
    </div>


    <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
        <c:if test="${curPage > page.pageCount }">
            <a href="${path }/lecture/list.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
        </c:if>
        <c:if test="${page.blockLastNum < page.totalPageCount }">
            <a href="${path }/lecture/list.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
        </c:if>
        <ul class="pagination-list">
            <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                <c:choose>
                    <c:when test="${i == curPage }">
                        <li>
                            <a href="${path }/lecture/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page">${i }</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="${path }/lecture/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul>
    </nav>
</section>
</div>
<jsp:include page="../include/footer.jsp" />

</body>
</html>
