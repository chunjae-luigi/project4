<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시작페이지</title>
    <style>

        * {
            box-sizing: border-box;
            padding: 0;
            margin: 0;
        }

        body{
            margin: 0;
            padding: 0;
            height: auto;
            width: 1000px;
            overflow: hidden;
        }

        .all{
            margin: 0;
            padding: 0;
            width: 100%;
            height: 600px;
            position: absolute;
            overflow: hidden;
            left: 0;
            top: 0;
        }


        .container{
            margin: 0;
            padding: 0;
            width: 100%;
            display: flex;
            flex-wrap: nowrap;
            flex-direction: row;
            justify-content: space-between;
            position: absolute;
            overflow: hidden;
            left: 0;
            bottom: 0;
        }

        .container2{
            margin: 0;
            padding: 0;
            width: 100%;
            display: flex;
            flex-wrap: nowrap;
            flex-direction: row;
            justify-content: space-between;
            position: absolute;
            overflow: hidden;
            left: 0;
            bottom: -5%;
        }

        .sort {
            height: 450px;
            width: 20%;
            border: 0.1px solid #d1d1e0;
            background-size: cover;
        }
        .sugar {
            height: 450px;
            width: 20%;
            background-size: cover;
            border: 0.01px solid #d1d1e0;
            z-index: 10;
        }

        .txt_wr {
            z-index: 100;
            margin-left: 11%;
            width: 20%;
            bottom: 10%;
            position: absolute;
            text-decoration: none;
            font-size: 30px;
            font-weight: bold;
            color:cornflowerblue;
        }
        .main{
            position: absolute;
            left: 15%;
            top: 5%;
            z-index: 100;
        }



    </style>
</head>
<body>
<div class="main" >
    <img src="../../resources/image/mainbanner.png" alt="매인배너">
</div>
<div class="all">
    <img src="../../resources/image/hh.jpg" alt="배경">
</div>
<div class="container">
    <div class="sort n1"  aria-hidden="true" tabindex="0">
        <a href="https://github.com/chunjae-luigi/project1" class="hover_wr" tabindex="-1">
            <div class="hover_inner">
                <div class="img_box">
                    <img src="../../resources/image/main/pc_sec02_img01.png" alt="사진">
                </div>
                <div class="txt_wr">
                    <p class="tit ko">Project 1</p>
                </div>
            </div>
        </a>
    </div>
    <div class="sort n2"  aria-hidden="true" tabindex="-1">
        <a href="https://github.com/chunjae-luigi/project2" class="hover_wr" tabindex="-1">
            <div class="hover_inner">
                <div class="img_box">
                    <img src="../../resources/image/main/pc_sec02_img02.png" alt="사진">
                </div>
                <div class="txt_wr">
                    <p class="tit ko">Project 2</p>
                </div>
            </div>
        </a>
    </div>
    <div class="sort n3"  aria-hidden="true" tabindex="-1">
        <a href="http://10.41.1.198:8080/team43/" class="hover_wr" tabindex="-1">
            <div class="hover_inner">
                <div class="img_box">
                    <img src="../../resources/image/main/pc_sec02_img03.png" alt="사진">
                </div>
                <div class="txt_wr">
                    <p class="tit ko">Project 3</p>
                </div>
            </div>
        </a>
    </div>
    <div class="sort n4"  aria-hidden="true" tabindex="-1">
        <a href="http://10.41.1.198:8080/team44/" class="hover_wr" tabindex="-1">
            <div class="hover_inner">
                <div class="img_box">
                    <img src="../../resources/image/main/pc_sec02_img04.png" alt="사진">
                </div>
                <div class="txt_wr">
                    <p class="tit ko">Project 4</p>
                </div>
            </div>
        </a>
    </div>
    <div class="sort n5" aria-hidden="true" tabindex="-1">
        <div class="hover_inner">
            <div class="img_box">
                <img src="../../resources/image/main/pc_sec02_img05.png" alt="사진">
            </div>
            <div class="txt_wr">
                <p class="tit ko">To be <br>Continued</p>
            </div>
        </div>
        </a>
    </div>
</div>


<div class="container2">
    <div class="sugar m1"  data-num="n1" aria-hidden="true" tabindex="0">
        <div class="hover_inner">
            <div class="img_cover">

                <img src="../../resources/image/main/white.png" alt="사진">
            </div>
        </div>
    </div>
    <div class="sugar m2"  data-num="n2" aria-hidden="true" tabindex="-1">
        <div class="hover_inner">
            <div class="img_cover">
                <img src="../../resources/image/main/white.png" alt="사진">
            </div>
        </div>
    </div>
    <div class="sugar m3" data-num="n3" aria-hidden="true" tabindex="-1">
        <div class="hover_inner">
            <div class="img_cover">
                <img src="../../resources/image/main/white.png" alt="사진">
            </div>
        </div>
    </div>
    <div class="sugar m4" data-num="n4" aria-hidden="true" tabindex="-1">
        <div class="hover_inner">
            <div class="img_cover">
                <img src="../../resources/image/main/white.png" alt="사진">
            </div>
        </div>
    </div>
    <div class="sugar m5" data-num="n5" aria-hidden="true" tabindex="-1">
        <a href="https://namu.wiki/w/To%20Be%20Continued" class="hover_wr" tabindex="-1">
            <div class="hover_inner">
                <div class="img_cover">
                    <img src="../../resources/image/main/white.png" alt="사진">
                </div>
            </div>
        </a>
    </div>
</div>
</body>

</html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script>
    $(document).ready(function(){
        $(".container2").mouseover(function(){
            $(".m1").css({"transform": "translateY(700px)", "transition-duration":"1.2s"});
            $(".m2").css({"transform": "translateY(700px)", "transition-duration":"1.2s", "transition-delay":"0.2s"});
            $(".m3").css({"transform": "translateY(700px)", "transition-duration":"1.2s", "transition-delay":"0.4s"});
            $(".m4").css({"transform": "translateY(700px)", "transition-duration":"1.2s", "transition-delay":"0.6s"});
            $(".m5").css({"transform": "translateY(700px)", "transition-duration":"1.2s", "transition-delay":"0.8s"});
            $(".txt_wr").css("color", "aliceblue");

        })
        // let classNm = "." + $(".sugar").data("num") + " .txt_wr";
    })
</script>