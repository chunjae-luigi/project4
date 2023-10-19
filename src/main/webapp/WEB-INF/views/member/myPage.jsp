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
                            <ul>
                                <li><a href="/user/myPage.do" class="active">나의 정보</a></li>
                                <li><a href="/user/myLecture.do">나의 강의정보</a></li>
                                <li><a href="/user/myPay.do">나의 결제정보</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-10 p-2">
                        <div class="d-flex flex-column align-items-center justify-content-center right_side">
                            <h5 class="display-4">회원정보</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <jsp:include page="../layout/footer.jsp" />
</body>
</html>