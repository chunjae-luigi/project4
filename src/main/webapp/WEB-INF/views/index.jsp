<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP</title>
    <jsp:include page="./layout/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/main.css">
    <link rel="stylesheet" href="${path }/resources/css/owl.carousel.css" />
    <link rel="stylesheet" href="${path }/resources/css/index.css" />
</head>
<body>
    <jsp:include page="./layout/header.jsp" />
    <div class="container-fluid bg-index px-0 px-md-5 mb-5">
        <div class="row align-items-center px-3">
            <div class="col-lg-12 text-center py-5">
                <h4 class="text-white mb-4 mt-5 mt-lg-0">에듀 강의 교육 센터</h4>
                <h1 class="display-4 font-weight-bold text-white">스마트 해법</h1>
                <h3 class="text-white mb-4">
                    지금 당신이 찾는 '그 강의' 해법에 다 있다 !
                </h3>
                <a href="${path}/lecture/list.do" class="btn btn-primary mt-1 py-3 px-5">강의 보러가기</a>
            </div>
        </div>
    </div>

    <div class="container-fluid mb-5">
        <div class="container">
            <div class="text-center pb-2">
                <p class="section-title px-5"><span class="px-2">AN UPCOMING LECTURE</span></p>
                <h1 class="mb-4">마지막 기회를 놓치지 마세요.</h1>
            </div>
            <div class="row">
                <c:forEach var="lec" items="${lectureList}">
                <div class="col-lg-4">
                    <div class="card border-0 bg-light shadow-sm pb-2">
                        <img class="card-img-top mb-2" src="${path }/resources/image/main/class-1.jpg" alt="강의1 이미지" />
                        <div class="card-body text-center">
                            <h4 class="card-title">${lec.lect_tit}</h4>
                            <p class="card-text">
                                ${lec.subTitle}<br/>
                            </p>
                        </div>
                        <div class="card-footer bg-transparent py-4 px-5">
                            <div class="row border-bottom">
                                <div class="col-6 py-1 text-right border-right">
                                    <strong>교육 인원</strong>
                                </div>
                                <div class="col-6 py-1">${lec.studentCnt}</div>
                            </div>
                            <div class="row border-bottom">
                                <div class="col-6 py-1 text-right border-right">
                                    <strong>교육 강사</strong>
                                </div>
                                <div class="col-6 py-1">${lec.teacherNm}</div>
                            </div>
                            <div class="row">
                                <div class="col-6 py-1 text-right border-right">
                                    <strong>교육 가격</strong>
                                </div>
                                <div class="col-6 py-1">${lec.cost}</div>
                            </div>
                        </div>
                        <a href="${path}/lecture/get.do?lno=${lec.lno}" class="btn btn-primary px-4 mx-auto mb-4">신청하기</a>
                    </div>
                </div>
                </c:forEach>
            </div>
            <c:if test="${empty lectureList}">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card border-0 bg-light shadow-sm pb-2">
                        <img class="card-img-top mb-2" src="${path }/resources/image/main/class-1.jpg" alt="강의1 이미지" />
                        <div class="card-body text-center">
                            <h4 class="card-title">강의 추가필요</h4>
                            <p class="card-text">
                                미정
                            </p>
                        </div>
                        <div class="card-footer bg-transparent py-4 px-5">
                            <div class="row border-bottom">
                                <div class="col-6 py-1 text-right border-right">
                                    <strong>교육 인원</strong>
                                </div>
                                <div class="col-6 py-1">미정</div>
                            </div>
                            <div class="row border-bottom">
                                <div class="col-6 py-1 text-right border-right">
                                    <strong>교육 강사</strong>
                                </div>
                                <div class="col-6 py-1">미정</div>
                            </div>
                            <div class="row">
                                <div class="col-6 py-1 text-right border-right">
                                    <strong>교육 가격</strong>
                                </div>
                                <div class="col-6 py-1">미정</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:if>
        </div>
    </div>

    <c:if test="${not empty teacherList }">
        <div class="container-fluid mb-5">
            <div class="container">
                <div class="text-center pb-2">
                    <p class="section-title px-5">
                        <span class="px-2">Our Teachers</span>
                    </p>
                    <h1 class="mb-4">강사님들을 만나보세요.</h1>
                </div>
                <div class="row">
                <c:forEach var="teacher" items="${teacherList }" varStatus="status">
                    <div class="col-md-6 col-lg-3 text-center team">
                        <div class="position-relative overflow-hidden mb-4" style="border-radius: 100%">
                            <img class="img-fluid w-100" src="${path }/resources/upload/member/${teacher.fileNm }" alt="${teacher.nm }의 이미지" />
                            <div class="team-social d-flex align-items-center justify-content-center w-100 h-100 position-absolute">
                                <a class="btn btn-outline-light text-center mr-2 px-0" style="width: 38px; height: 38px" href="tel:${teacher.tel }"><i class="fas fa-phone-alt"></i></a>
                                <a class="btn btn-outline-light text-center px-0" style="width: 38px; height: 38px" href="email:${teacher.email }" ><i class="fas fa-envelope"></i></a>
                            </div>
                        </div>
                        <h4 class="mb-0">${teacher.nm }</h4>
                    </div>
                </c:forEach>
                </div>
            </div>
        </div>
    </c:if>

    <div class="container-fluid py-5">
        <div class="container p-0">
            <div class="text-center pb-2">
                <p class="section-title px-5">
                    <span class="px-2">Testimonial</span>
                </p>
                <h1 class="mb-4">최고의 리뷰를 확인하세요.</h1>
            </div>
            <div class="owl-carousel testimonial-carousel">
                <c:forEach var="rev" items="${reviewList}">
                <div class="testimonial-item px-3">
                    <div class="bg-light shadow-sm rounded mb-4 p-4">
                        <h3 class="fas fa-quote-left text-primary mr-3"></h3>
                        ${rev.content}
                    </div>
                    <div class="d-flex align-items-center pl-4">
                        <h5 class="d-inline mb-0">작성자</h5>
                        <p class="d-inline pl-4 mb-0" style="font-size:1.25rem;">${rev.memId}</p>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="owl-carousel testimonial-carousel">
                <c:if test="${empty reviewList}">
                    <div class="testimonial-item px-3">
                        <div class="bg-light shadow-sm rounded mb-4 p-4">
                            <h3 class="fas fa-quote-left text-primary mr-3"></h3>
                                리뷰가 없습니다. 리뷰를 등록해주세요
                        </div>
                        <div class="d-flex align-items-center pl-4">
                            <h5 class="d-inline mb-0">작성자</h5>
                            <p class="d-inline pl-4 mb-0" style="font-size:1.25rem;">미정</p>
                        </div>
                    </div>
                    </c:if>
                </div>
        </div>
    </div>



    <c:if test="${ sid != null }" >
        <div class="outer-container">
            <img src="${path}/resources/image/main/movingca_remove.png" alt="움직이는 이미지" id="moving-image">
        </div>
        <img src="${path}/resources/image/main/pikachu.png" alt="피카츄"  class="ant" >
    </c:if>
    <jsp:include page="./layout/footer.jsp" />
    <script src="${path }/resources/js/owl.carousel.min.js"></script>
    <script src="${path }/resources/js/main.js"></script>



    <style>
        /*Left moving Image*/
        .outer-container {
            position: absolute;
            top: 25%;
            left: -6%;
            /* transform: translate(-50%, -50%); */
        }

        #moving-image {
            margin: 0;
            padding: 0;
            position: absolute;
            top: 0;
            left: 0;
            width: 90px;
            height: auto;
        }
        /*개미이동*/
        .ant {
            width: 3px;
            height: auto;
            position: absolute;
            border: none;
        }
    </style>
    <%--    Left moving Image--%>
    <script>
        const movingImage = document.getElementById('moving-image');
        let direction = 1; // 이동 방향 (1: 오른쪽, -1: 왼쪽)

        function moveImage() {
            const currentPosition = parseInt(movingImage.style.left) || 0;
            setTimeout(() => {direction = 0}, 15000)
            if (currentPosition >= movingImage.width && direction === 1) {
                direction = 0; // 정지
                setTimeout(() => {
                    direction = -1; // 왼쪽으로 이동
                }, 3000); // 3초 후에 방향 전환
            } else if (currentPosition <= 0 && direction === -1) {
                direction = 0; // 정지
                setTimeout(() => {
                    direction = 1; // 오른쪽으로 이동
                }, 5000); // 5초 후에 방향 전환
            }

            movingImage.style.left = currentPosition + direction + 'px';
            requestAnimationFrame(moveImage);
        }

        moveImage();

        $(document).ready(function (){
            let count = 0;
            $("#moving-image").click(function(){
                if(count === 5 ){
                    $(location).attr("href", "${path}/user/fire")
                    count = 0;
                }else{
                    count = count + 1;
                }
            })
        });
    </script>
    <%--    개미 이동--%>
    <script>
        const ant = document.querySelector('.ant');
        ant.style.top = Math.random() * 900 + 'vh'; // 초기 무작위 Y 좌표
        ant.style.left = Math.random() * 100 + 'vw'; // 초기 무작위 X 좌표

        let x = parseFloat(ant.style.left); // 초기 X 좌표 (실수 값)
        let y = parseFloat(ant.style.top); // 초기 Y 좌표 (실수 값)

        const speed = 0.111111; // 이동 속도
        const directionChangeInterval = 5000; // 2초마다 방향을 변경
        //
        function changeDirection() {
            const randomAngle = 200 * Math.PI * Math.random(); // 0에서 2π까지의 무작위 각도
            x += speed * Math.cos(randomAngle);
            y += speed * Math.sin(randomAngle);

            // 윈도우 바깥으로 벗어나는 경우, 다시 화면 안쪽으로 이동
            if (x < 0) {
                x = 0;
            } else if (x > window.innerWidth) {
                x = window.innerWidth;
            }

            if (y < 0) {
                y = 0;
            } else if (y > window.innerHeight) {
                y = window.innerHeight;
            }

            ant.style.top = y + 'px';
            ant.style.left = x + 'px';
        }

        function moveAnt() {
            changeDirection(); // 방향 변경
            setInterval(changeDirection, directionChangeInterval); // 방향을 2초마다 변경

            requestAnimationFrame(moveAnt);
        }
        moveAnt();


        $(document).ready(function (){
            let count = 0;
            $(".ant").click(function() {
                if(count === 3 ){
                    $(this).css({"width": "50px", "transition-duration": "3s"})
                    count = count + 1;
                } else if (count === 5 ){
                    $(this).css({"width": "200px", "transition-duration": "3s"})
                    count = count + 1;
                } else if (count === 7 ) {
                    $(location).attr("href", "${path}/user/fire")
                    count = 0;
                }else{
                    count = count + 1;
                }
            })
        });
    </script>
</body>
</html>
