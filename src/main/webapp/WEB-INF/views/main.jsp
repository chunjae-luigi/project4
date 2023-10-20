<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시작페이지</title>
    <style>
        body {
            background-color: black;
        }
        #container {
            overflow: hidden;
            display: block;
            margin: 0;
            padding: 0;
            height: 100%;
            width: auto;
        }
        .item a{
            color: white;
            font-weight: bolder;
            font-size: 30px;
            text-decoration: none;
            position: absolute;
        }
        .item img {
            z-index: -10;
            width: 100%;
            height: 100%;
            border: none;
        }
        #left {
            position: absolute;
            height: 100%;
            width: 50%;
            float: left;
            left: 0;
        }
        #left a {
            left: 30%;
            top: 30%;
        }
        #left a:hover {
            font-size: 50px;
            color: #80aaff;
            transition-duration: 1s ;
        }

        #left:hover {
            transform: translateX(50px);
            transition-duration: 1.5s;
        }
        #right {
            position: absolute;
            height: 100%;
            width: 50%;
            float: right;
            right: 0;
        }
        #right a {
            right: 30%;
            top: 30%;
        }

        #right a:hover {
            font-size: 50px;
            color: #ff5c33;
            transition-duration: 1s ;
        }

        #right:hover {
            transform: translateX(-50px);
            transition-duration: 1.5s;
        }


        .item-content {
            text-align: center;
            color: darkcyan;
            font-size: 50px;
        }

    </style>
</head>
<body>
<div id="container" class="container">
    <div id="left" class="item">
        <img src="${path}/resources/image/leftim.jpg" alt="left">
        <div class="item-content">
            <a href="${path }/main">메인으로</a>
        </div>
    </div>
    <div id="right" class="item">
        <img src="${path}/resources/image/rightim.jpg" alt="right">
        <div class="item-content">
            <a href="${path }/member/login">로그인으로</a>
        </div>
    </div>
</div>
</body>
<script>

</script>
</html>