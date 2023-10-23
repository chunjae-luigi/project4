<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>해법::강의</title>
    <jsp:include page="../layout/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/style.css">
</head>
<style>
    /* 바디 */
    body {
        margin: 0 !important;
        padding: 0!important;
    }
    .container {
        display: flex; /* Flexbox 레이아웃 사용 */
    }
    .main-content {
        flex: 1; /* 좌측 영역이 남은 공간을 모두 차지하도록 설정 */
        background-color: #f0f0f0; /* 좌측 영역 배경색 (선택 사항) */
        padding: 20px;
    }

    .sidebar {
        width: 250px; /* 우측 탭 메뉴의 너비 설정 */
        background-color: #333; /* 우측 탭 메뉴 배경색 (선택 사항) */
        color: #fff; /* 우측 탭 메뉴 텍스트 색상 (선택 사항) */
        padding: 20px;
    }

    .tab-menu {
        list-style: none;
        padding: 0;
    }

    .tab-menu li {
        margin-bottom: 10px;
    }

    .tab-menu a {
        text-decoration: none;
        color: #fff; /* 탭 메뉴 항목의 텍스트 색상 (선택 사항) */
    }

    .tab-content {
        display: none;
    }

    .tab-content:target {
        display: block;
    }


    /* 강의상세 템플릿 css */

    .star-icon {
        background-image:url("${path }/resources/image/common/heart0.png");
        background-repeat:no-repeat;
        width:20px;
        height:20px;
        background-size:cover;
    }
    .star-icon.click-star {
        cursor:pointer;
    }
    /* 색칠된 상태 */
    .star-icon.filled {
        background-image:url("${path }/resources/image/common/heart1.png");
    }
    .star-rating {
        display:flex;
        align-items:center;
    }
    .star-rating label {
        margin-right:10px;
    }
    .star-icons {
        display:flex;
    }



</style>

<body>

<div class="container-fluid p-0">
    <div class="row">
        <div class="col-lg-8 main-content">


            <h1>My learning</h1>
            <video id="myVideo" src="${path}/resources/image/lecture/lectvideo01.mp4" controls poster="${path}/resources/image/lecture/thumnail(4).png" style="width: 1200px; height: 780px;"></video>



            <!-- Page content-->
            <div>
                <div>
                    <div>

                        <!-- 탭 -->
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">강의내용</button>
                                <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">수강후기</button>
                                <button class="nav-link" id="nav-contact-tab2" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">질문하기</button>
                            </div>
                        </nav>


                        <!-- 강의 내용 -->
                        <article id="lect_con">
                            <!-- Post header-->
                            <header class="mb-4">
                                <!-- Post title-->
                                <h1 class="fw-bolder mb-1">${lecture.lno }${lecture.title }</h1>
                                <!-- Post meta content-->
                                <div class="text-muted fst-italic mb-2">${lecture.subTitle }</div>
                                <!-- Post categories-->
                            </header>
                            <!-- Post content-->
                            <section class="mb-5">

                                ${lecture.content }
                                ${lecture.lectureType }
                            </section>
                        </article>



                        <!-- 수강후기(review) 영역 -->
                        <section class="mb-5" id="lect_review">
                            <h2> 수강후기 </h2>
                            <div class="card bg-light">

                                <div class="card-body">
                                    <!-- 수강후기 입력칸-->
                                    <form action="${path }/review/add.do" method="post" class="mb-4">
                                        ddd
                                        <input type="hidden" name="id" id="id"  value="${sid}">
                                        <input type="hidden" name="lno" id="lno" value="${lecture.lno}">




                                        <%-- 별점 테스트 중입니다 --%>
                                        <div class="star-rating">
                                            <label for="star">별점:</label>
                                            <div class="star-icons">
                                                <!-- 이 부분에 원하는 아이콘 또는 글꼴 아이콘을 넣을 수 있습니다 -->
                                                <span class="star-icon click-star" data-star="1"></span>
                                                <span class="star-icon click-star" data-star="2"></span>
                                                <span class="star-icon click-star" data-star="3"></span>
                                                <span class="star-icon click-star" data-star="4"></span>
                                                <span class="star-icon click-star" data-star="5"></span>
                                            </div>
                                            <input type="hidden" name="star" id="star" value="5">
                                        </div>
                                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                        <script>
                                            $(document).ready(function () {
                                                // 별 아이콘 클릭 시
                                                $('.click-star').click(function () {
                                                    const selectedStar = $(this).data('star');
                                                    $('#star').val(selectedStar); // 'star' 입력란 값을 업데이트
                                                    // 선택한 별 이하의 별 아이콘을 색칠
                                                    $('.click-star').removeClass('filled');
                                                    $(this).prevAll().addBack().addClass('filled');
                                                });
                                                // 초기 별점 설정
                                                const initialStar = $('#star').val();
                                                $('.click-star').slice(0, initialStar).addClass('filled');
                                            });
                                        </script>









                                        <textarea name="content" id="content" class="form-control" rows="3" required placeholder="수강생만 댓글입력창 뜨게하기!"></textarea>
                                        <input type="submit" class="button is-primary" value="등록">
                                    </form>

                                    <!-- 수강후기 리스트 -->
                                    <div>
                                        <c:forEach var="review" items="${reviewList }">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                                <div class="ms-3">

                                                    <div class="star-rating">
                                                            <%-- 별점 출력 --%>
                                                        <c:forEach begin="1" end="${review.star}" var="i">
                                                            <span class="star-icon filled"></span>
                                                        </c:forEach>

                                                        <c:forEach begin="${review.star + 1}" end="5" var="i">
                                                            <span class="star-icon"></span>
                                                        </c:forEach>
                                                    </div>


                                                    <div class="fw-bold">${review.memId }</div>
                                                    <div>${review.content } </div>
                                                    <p id="reg">
                                                        <fmt:parseDate value="${review.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                                        <fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
                                                    </p>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>
                                    <c:if test="${empty reviewList }">
                                        <tr>
                                            <td colspan="4">수강후기가 존재하지 않습니다.</td>
                                        </tr>
                                    </c:if>

                                </div>
                            </div>
                        </section>

                        <%-- 수강후기 영역 끝 --%>



                    </div>



                </div>
            </div>
        </div>



        <!-- 우측 탭-->
        <div class="col-lg-4" id="lect_tab">
            <div class="card mb-4">
                <div class="card-header">
                    <h2>커리큘럼</h2>
                </div>
                <div class="card-body">
                    <h3>안녕하세요 ${member.id}님!</h3>
                    <p>커리큘럼을 누르면 해당 강의가 재생됩니다.</p>
                    <!-- 목차 -->
                    <div id="lect_list">
                        <ul class="list-group">
                            <h2> 목차 </h2>
                            <c:forEach var="curri" items="${curriList }">
                                <li class="list-group-item">${curri.content}</li>
                            </c:forEach>
                        </ul>
                    </div>
                    <button class="btn btn-primary" id="button-search" type="button">수강완료</button>
                    <div>질문게시판을 통해 담당 강사에게 강의 내용에 대한 질문을 할 수 있습니다!</div>
                </div>


            </div>
        </div>
    </div>
</div>
</body>
<jsp:include page="../layout/footer.jsp" />

<script>
    // tab click 하면 지정 구역으로 이동
    document.addEventListener('DOMContentLoaded', function() {
        const lectureTab = document.getElementById('nav-home-tab');
        const lectureContent = document.getElementById('lect_con');
        lectureTab.addEventListener('click', function() {
            const scrollPosition = lectureContent.offsetTop - 100;
            window.scrollTo({ top: scrollPosition, behavior: 'smooth' });
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        const lectureTab = document.getElementById('nav-profile-tab');
        const lectureContent = document.getElementById('lect_list');
        lectureTab.addEventListener('click', function() {
            const scrollPosition = lectureContent.offsetTop - 100;
            window.scrollTo({ top: scrollPosition, behavior: 'smooth' });
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        const lectureTab = document.getElementById('nav-contact-tab');
        const lectureContent = document.getElementById('lect_review');
        lectureTab.addEventListener('click', function() {
            const scrollPosition = lectureContent.offsetTop - 100;
            window.scrollTo({ top: scrollPosition, behavior: 'smooth' });
        });
    });
</script>



</html>

