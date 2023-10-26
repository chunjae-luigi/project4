<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP::강의</title>
    <jsp:include page="../layout/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/sub.css">
    <link rel="stylesheet" href="${path }/resources/css/lecture.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<!-- 상단 강의 소개-->
<div class="bg-dark py-5">
    <div class="container px-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-6">
                <c:choose>
                    <c:when test="${!empty thumbnail}">
                        <img src="${path }/resources/upload/lecture/${lecture.thumbnail }" />
                    </c:when>
                    <c:otherwise>
                        <img src="${path }/resources/image/lecture/dummy.png" />
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-lg-6">
                <h3 style="color: var(--main-color);">${subject.title } </h3>
                <h1 class="display-5 fw-bolder text-white mb-2">${lecture.title }</h1>
                <h3 class="lead text-white-50 mb-4">${lecture.subTitle }</h3>
                <h3 class="lead text-white-50 mb-4">${lecture.teacherId } 선생님</h3>
                <c:choose>
                    <c:when test="${!empty lvideo}">
                        <a class="btn btn-danger btn-lg px-4 me-sm-3" id="vvv" href="${path }/resources/upload/lecture/${lecture.lvideo }" target="_blank" >강의 맛보기</a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-danger btn-lg px-4 me-sm-3" id="vvv" href="${path }/resources/image/lecture/lectvideo01.mp4" target="_blank" >강의 맛보기</a>
                    </c:otherwise>
                </c:choose>
                <a class="btn btn-warning btn-lg px-4" href="#lect_review" >수강생 후기</a>
            </div>
        </div>
    </div>
    </div>
</div>

<!-- Page content-->
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-12">
            <!-- 내부탭 -->
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <a href="${path }/lecture/get.do?lno=${lecture.lno }#tab-content" class="nav-link" id="tab-content" data-bs-toggle="tab" data-bs-target="#tab-content" role="tab" aria-selected="true">강의내용</a>
                    <a href="${path }/lecture/get.do?lno=${lecture.lno }#tab-curri" class="nav-link" id="tab-curri" data-bs-toggle="tab" data-bs-target="#tab-curri" role="tab" aria-selected="true">커리큘럼</a>
                    <a href="${path }/lecture/get.do?lno=${lecture.lno }#tab-review" class="nav-link" id="tab-review" data-bs-toggle="tab" data-bs-target="#tab-review" role="tab" aria-selected="true">수강후기</a>
                    <%--<button class="nav-link" id="tab-qna" data-bs-toggle="tab" data-bs-target="#tab-qna" type="button" role="tab" aria-selected="false">질문하기</button>--%>
                    <c:forEach var="boardMgn" items="${boardMgnList }">
                        <a href="${path }/lecture/boardList.do?no=${boardMgn.bmNo }&lno=${lecture.lno }" class="nav-link<c:if test="${bmNo == boardMgn.bmNo }"> active</c:if>">${boardMgn.boardNm }</a>
                    </c:forEach>
                </div>
            </nav>
            <div class="my-5">
                <jsp:include page="../board/boardGetForm.jsp" />
            </div>
        </div>
    </div>
</div>



<jsp:include page="../layout/footer.jsp" />

<%--<!-- Bootstrap core JS-->--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--<!-- Core theme JS-->--%>
<%--<script src="js/scripts.js"></script>--%>

<%--<!-- Bootstrap core JS-->--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--<!-- Core theme JS-->--%>
<%--<script src="js/scripts.js"></script>--%>

<!-- 우측탭 스크롤에 맞게 이동-->
<script>
    window.addEventListener("scroll", function() {
        const scrollingDiv = document.querySelector(".col-lg-4");
        const scrollY = window.scrollY;
        if (scrollY >= 500) {
            // 스크롤 위치가 500px 이상이면 div를 상단에 고정
            scrollingDiv.style.top = 100 + scrollY + "px";
        } else {
            // 스크롤 위치가 500px 미만이면 초기 위치로 이동
            scrollingDiv.style.top = "500px";
        }
    });
</script>
</body>
</html>