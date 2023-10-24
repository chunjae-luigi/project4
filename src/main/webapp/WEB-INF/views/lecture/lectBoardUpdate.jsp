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
                <img src="${path }/resources/image/lecture/thumnail(1).png">
            </div>
            <div class="col-lg-6">
                <h3 style="color: var(--main-color);">${subject.title } </h3>
                <h1 class="display-5 fw-bolder text-white mb-2">${lecture.title }</h1>
                <h3 class="lead text-white-50 mb-4">${lecture.subTitle }</h3>
                <h3 class="lead text-white-50 mb-4">${lecture.teacherId } 선생님</h3>
                <a class="btn btn-danger btn-lg px-4 me-sm-3" id="vvv" href="${path }/resources/image/lecture/lectvideo01.mp4" target="_blank" >강의 맛보기</a>
                <a class="btn btn-warning btn-lg px-4" href="#lect_review" >수강생 후기</a>
            </div>
        </div>
    </div>
    </div>
</div>

<!-- Page content-->
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-9">
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
                <jsp:include page="../board/boardUpdateForm.jsp" />
            </div>
        </div>
        <!-- 우측 탭-->
        <div class="col-lg-3" id="lect_tab">
            <div class="card mb-4">
                <div class="card-header">
                    <h2>${lecture.cost }원</h2>
                    <a href="${path}/payment/payinsert.do?lno=${lecture.lno }" class="btn btn-primary" id="button-search" >바로 수강신청 하기</a>
                </div>
                <div class="card-body">
                    <div class="input-group">
                        <ul>
                            <li><span>지식 공유자 :</span> 000</li>
                            <li>난이도 : 입문</li>
                            <li>1개의 코딩 연습</li>
                            <li>수강기한 : 무제한</li>
                            <li>수료증 : 발급</li>
                        </ul>
                        <div>지식공유자 답변이 제공되는 강의입니다</div>
                    </div>
                </div>
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
<!-- 동영상 열 때 크기 지정 -->
<%-- 동영상 경로는 임시로 해놓은거라 최종 때 수정해야함 //비--%>
<%-- <script>
    document.getElementById('vvv').addEventListener('click', function() {
        window.open('${path }/resources/image/common/videosample.mp4', 'Video Window', 'width=720, height=540');
    });
</script>--%>
</body>
</html>