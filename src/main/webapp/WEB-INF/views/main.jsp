<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시작페이지</title>
    <style>
        * {
            background-color:cornsilk;
            overflow: hidden;
        }


        h1{
            position: absolute;
            top:5%;
            text-align: center;
            left: 38%;
        }
        p{
            position: absolute;
            top:11%;
            text-align: center;
            left: 42%;
        }

        #container {
            overflow: hidden;
            display: block;
            margin: 0;
            padding: 0;
            height: auto;
            width: 100%;
        }

        .item {
            border: none;
            font-weight: bolder;
            font-size: 30px;
            position: absolute;
            overflow: hidden;
        }

        #left {
            position: absolute;
            height: 55%;
            width: 50%;
            float: left;
            left: 0;
            bottom: 0;
            background-size: cover;
            background-color: #8aefdb;

        }

        #left:hover {
            transform: scale(1.1);
            transition-duration: 1.5s;
        }

        #right {
            position: absolute;
            height: 55%;
            width: 50%;
            float: right;
            right: 0;
            bottom: 0;
            background-size: cover;
            background-color: #f9e8a0;
        }

        #right:hover {
            transform: scale(1.1);
            transition-duration: 1.5s;
        }

        #search-container {
            position: absolute;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        #search-box {
            margin-left: 10px;
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 5px;
            width: 400px;
            font-size: 18px;
        }
        #search-button {
            background-color: #0074b7;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            margin-left: 10px;
            cursor: pointer;
        }

    </style>
</head>
<body>
    <h1>성장하는 모두를 위한 곳</h1>
    <p>천재교육에 오신 걸 환영합니다.</p>

    <div id="search-container">
        <img src="해법수학" alt="해법수학">
        <input type="text" id="search-box" placeholder="검색어를 입력하세요">
        <button id="search-button">검색</button>
    </div>


    <div id="container" class="container">
        <a href="${path}/main" class="item" id="left" ></a>
        <a href="http://google.com" class="item" id="right" ></a>
    </div>
</body>
</html>
