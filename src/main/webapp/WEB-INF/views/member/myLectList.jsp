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
    <style>
        .myPage {background-color:#e1e1e1;}

        .left_side, .right_side {background-color:#fff}

        .left_top {
            display: block;
            width: 100%;
            text-align: center;
            height: 80px;
            line-height: 80px;
            background-color: var(--main-color);
            color: #fff;
            font-weight: 800;
            font-size: 1.4em;
            letter-spacing: 4px;
        }

        .left_side ul a {display: block;width: 100%;font-weight: 500;}
        .left_side ul a.active {text-decoration:underline;color:#333;}
    </style>

    <style>
        .custom-block-full {
            background-color: palegoldenrod;
            border-color: transparent;
        }
        .custom-block {
            position: relative;
            border: 2px solid gray;
            border-radius: 20px;
            overflow: hidden;
            padding: 30px;
            transition: all 0.3s ease 0s;

            width: 400px;
        }
        .custom-block-image-wrap {
            position: relative;
            display: block;
            height: 100%;
        }
        .mb-2 a {
            display: inline-block;
            color: palevioletred;
            text-decoration: none;
        }
        .custom-block-full .custom-block-image {
            width: 100%;
        }
        .custom-block-full .custom-block-info {
            padding: 10px;
        }
    </style>


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
                            <li><a href="${path }/user/myPage.do" class="active px-4 py-2">나의 정보</a></li>
                            <li><a href="${path }/user/myLectList.do" class="px-4 py-2">나의 강의실</a></li>
                            <li><a href="${path }/user/myPay.do" class="px-4 py-2">나의 결제정보</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-10 p-2">
                    <div class="d-flex flex-column align-items-center justify-content-center right_side">
                        <h5 class="my-4" style="font-size:2.5em;font-weight:600;">나의 강의 목록</h5>

                        <c:forEach items="${myLectList }" var="lecture" varStatus="status">
                        <div class="col-lg-4 col-12 mb-4 mb-lg-0">
                            <div class="custom-block custom-block-full">
                                <div class="custom-block-image-wrap">
                                    <a href="detail-page.html">
                                        <img src="assets/thumnail(4).png" class="custom-block-image img-fluid"
                                             alt="">
                                    </a>
                                </div>

                                <div class="custom-block-info">
                                    <h3 class="mb-2">
                                        <a href="detail-page.html">
                                            ${lecture.title }
                                        </a>
                                    </h3>
                                    <div class="profile-block d-flex">
                                        <p> ${lecture.teacherNm } 선생님</p>
                                    </div>

                                    <div class="profile-block d-flex">

                                        <p>수강상태(완강ㄹ여부)
                                        </p>
                                    </div>
                                    <button>후기작성</button>
                                    <button>질문하기</button>
                                </div>

                                <div class="social-share d-flex flex-column ms-auto">
                                    <a href="#" class="badge ms-auto">
                                        <i class="bi-heart"></i>
                                    </a>

                                    <a href="#" class="badge ms-auto">
                                        <i class="bi-bookmark"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        </c:forEach>









                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>