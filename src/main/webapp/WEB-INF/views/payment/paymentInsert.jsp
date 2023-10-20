<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">

<head>
    <title>HEABEOP::</title>
    <jsp:include page="../layout/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/sub.css">
    <script type="text/javascript" src="${path }/resources/ckeditor/ckeditor.js"></script>
    <style>
        /* Add your custom styles here */
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .page-header {
            padding: 50px 0;
            background-color: #f5f5f5;
        }

        .page-name {
            font-size: 36px;
            margin: 0;
        }

        .breadcrumb {
            margin: 10px 0;
            padding: 0;
            list-style: none;
        }

        .breadcrumb li {
            display: inline;
            margin-right: 5px;
        }

        .breadcrumb li.active {
            font-weight: bold;
        }

        .box_wrap {
            padding: 20px;
            border: 1px solid #ccc;
            margin-top: 20px;
        }

        .form_row {
            width: 100%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        input[type="number"]{
            width: 100px;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
        }

        .form-select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
        }

        .btn {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #007BFF;
            color: #fff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        #naverPayBtn {
            background-image: url(${path}/resources/image/main/npay.png);
            background-size: cover;
            background-color: #03c75a;
            width: 120px;
            height: 50px;
            border: none;
        }
    </style>
</head>

<body id="body">
<jsp:include page="../layout/header.jsp" />

<section class="page-header" style="margin-top:0!important;">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="content">
                    <h1 class="page-name">상품 결제</h1>
                    <ol class="breadcrumb">
                        <li><a href="${path }/">Home</a></li>
                        <li class="active">상품 결제</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="container contents">
    <div class="container">
        <div class="box_wrap">
            <form action="${path }/payment/payinsert.do" method="post" class="form_row" onsubmit="return payCheck(this)">
                <table class="table" id="tb1">
                    <thead>
                    <tr>
                        <th>강의 이름</th>
                        <th>선생님</th>
                        <th>강의 가격</th>
                        <th>포인트 사용</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td> ${lecture.title}
                            <input type="hidden" name="plec" id="plec" value="${lecture.title}">
                            <input type="hidden" name="dno" id="dno" value="${lecture.lno}">
                        </td>
                        <td>선생님 이름 추가필요</td>
                        <td>
                            <input type="number" name="total" id="total" style="border: none; text-align: center;" readonly value="${lecture.price}">원
                        </td>
                        <td><input type="number" name="inpt" id="inpt" value="">

                            <input type="button" name="ptbtn" id="ptbtn" class="btn btn-primary" value="사용" onclick= "pointuse()">
                            <input type="button" name="ptbre" id="ptre" class="btn btn-primary" value="취소" onclick= "pointreset()">
                            <br>
                            <br>
                            사용가능한 포인트 :
                            <input type="text" name="pt" id="pt" value="" readonly style="border: none"/>

                        </td>

                    </tr>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="2" class="text-center">총계</td>
                        <td>
                            <input type="number" name="price" id="price" value="" readonly style="border: none; text-align: center;"/>원
                        </td>
                    </tr>
                    </tfoot>
                </table>

                <h3>주문자 정보</h3>
                <div class="row">
                    <div class="col-2"><label for="nm" class="form-label">이름</label></div>
                    <div class="col-8"><input type="text" class="form-control" id="nm" name="nm" readonly value="${mem.nm}"></div>
                    <div class="col-8"><input type="hidden" class="form-control" id="id" name="id" readonly value="${mem.id}"></div>
                </div>
                <div class="row">
                    <div class="col-2"><label for="email" class="form-label">이메일</label></div>
                    <div class="col-4"><input type="email" class="form-control" id="email" name="email" readonly value="${mem.email}"></div>
                    <div class="col-2"><label for="tel" class="form-label">전화번호</label></div>
                    <div class="col-4"><input type="tel" class="form-control" id="tel" name="tel" readonly value="${mem.tel}"></div>
                    <input type="hidden" class="form-control" id="amount" name="amount" readonly value="1">
                </div>

                <div class="form-outline mb-4">
                    <input type="text" name="address1" id="address1" placeholder="기본 주소 입력" class="form-control" required />
                    <input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="form-control" required />
                    <input type="text" name="postcode" id="postcode" placeholder="우편번호" class="form-control">
                    <button type="button" id="post_btn" onclick="findAddr()" class="btn">우편번호 검색</button>
                    <label class="form-label blind" for="address1">주소</label>
                </div>

                <hr>
                <h3>결제 정보</h3>
                <%--  Payment의 method, pcom, paccount --%>
                <div class="row">
                    <div class="col-2"><label for="pmethod" class="form-label">결제 수단</label></div>
                    <div class="col-4">
                        <select name="pmethod" id="pmethod" class="form-select">
                            <option value="선택">선택</option>
                            <option value="신용카드">신용카드</option>
                            <option value="체크카드">체크카드</option>
                            <option value="계좌이체">계좌이체</option>
                        </select>
                    </div>
                    <div class="col-2"><label for="pcom" class="form-label">결제 회사</label></div>
                    <div class="col-4">
                        <select name="pcom" id="pcom" class="form-select">
                            <option value="선택안함">선택안함</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2" id="labels1" >
                        <label for="pnum" class="form-label" >결제 번호</label></div>
                    <div class="col-2" id="labels2" style="display: none">
                        <label class="form-label" >계좌 번호</label></div>

                    <div class="col-6" id="labels3">
                        <input type="text" class="form-control" id="pnum" name="pnum" value="" required></div>
                    <div class="col-6" id="labels4" style="display: none; color: black;">
                        <label class="form-label" >061702 - 04 - 152352</label></div>


                    <div class="col-2">
                        <input type="button" id="paybtn" value="결제하기" class="btn btn-primary">
                    </div>
                    <div class="col-2">
                        <input type="button" id="naverPayBtn" >
                    </div>

                </div>

                <%--  일단은 pay했다고 치기  --%>
                <input type="hidden" name="payCk" id="payCk" value="yes">
                <input type="submit" id="buy" value="구매" class="btn btn-primary">
                <a href="${path }/payment/list.do" class="btn btn-primary">제품 목록</a>
            </form>

        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" />
</body>
</html>
<script>
    $(document).ready(function() {
        let total = 0;
        total = $("#total").val()
        $("#price").val(total);
        $("#pt").val(${mem.pt})
    });
    function pointuse() {
        var total = $("#total").val();
        var inpoint = $("#inpt").val();
        var point = ${mem.pt}
            total = total - inpoint;
        point = point - inpoint;
        //포인트 정산
        if((0 < point) && (0 <= total) ){
            $("#pt").val(point);
            $("#price").val(total);
        }else if((0 > point) && (0 <= total) ) {
            $("#inpt").val(0).focus;
        }else if((0 === point) && (0 <= total) ){
            $("#pt").val(0);
            $("#price").val(total);
        }else{
            return false;
            $("#inpt").focus;
        }
    }
    function pointreset() {
        $("#price").val($("#total").val());
        $("#inpt").val(0);
        var point = ${mem.pt};
        $("#pt").val(point);
    }


</script>

<script>
    $(document).ready(function(){
        var cardArr1 = ["현대카드","농협카드","BC카드","KB카드"];
        var cardArr2 = ["하나카드","농협카드","BC카드"];
        var bankArr = ["카카오뱅크","농협은행","신한은행","기업은행","국민은행"];
            $("#pmethod").change(function(){
                var th = $(this).val();
                if(th==="신용카드"){
                    for(var i=0;i<cardArr1.length;i++) {
                        $("#pcom").append("<option value='" + cardArr1[i] + "'>" + cardArr1[i] + "</option>");
                    }
                    $("#labels1").css("display", "block");
                    $("#labels3").css("display", "block");
                    $("#labels2").css("display", "none");
                    $("#labels4").css("display", "none");
                    $("#pnum").val("");
                } else if(th==="체크카드"){
                    for(var i=0;i<cardArr2.length;i++) {
                        $("#pcom").append("<option value='"+cardArr2[i]+"'>"+cardArr2[i]+"</option>");
                    }
                    $("#labels1").css("display", "block");
                    $("#labels3").css("display", "block");
                    $("#labels2").css("display", "none");
                    $("#labels4").css("display", "none");
                    $("#pnum").val("");
                } else if(th==="계좌이체"){
                    for (var i = 0; i < bankArr.length; i++) {
                        $("#pcom").append("<option value='" + bankArr[i] + "'>" + bankArr[i] + "</option>");
                    }
                    $("#labels1").css("display", "none");
                    $("#labels3").css("display", "none");
                    $("#pnum").val("계좌이체");
                    $("#labels2").css("display", "block");
                    $("#labels4").css("display", "block");
                }
        }).change();
    });
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //주소 연동 API
    function findAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                console.log(data);
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress;
                document.getElementById("postcode").value = data.zonecode;
                if(roadAddr !== '') {
                    document.getElementById("address1").value = roadAddr;
                } else if(jibunAddr !== ''){
                    document.getElementById("address1").value = jibunAddr;
                }
                document.getElementById("address2").focus();
            }
        }).open();
    }
</script>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script>
    var oPay = Naver.Pay.create({
        "mode" : "production", // development or production
        "clientId": "u86j4ripEt8LRfPGzQ8", // clientId
    });

    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
    var elNaverPayBtn = document.getElementById("naverPayBtn");
    var totalPayAmount = ${lecture.price};
    elNaverPayBtn.addEventListener("click", function() {
        oPay.open({
            merchantUserKey: "12341234",
            merchantPayKey: "1524213",
            productName: "GitHub 마스터 강좌",
            totalPayAmount: totalPayAmount,
            taxScopeAmount: totalPayAmount,
            taxExScopeAmount: "0",
            returnUrl: "${path}/payment/list.do"
        });
    });

</script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
    //결제모듈 API 연동
    $(document).ready(function(){
        $("#paybtn").click(function(){
            var email = $("#email").val();
            var cname = $("#nm").val();
            var tel = $("#tel").val();
            var postcode = $("#postcode").val();
            proName = $("#proName").val();
            if($("#amount").val()!="") {
                totalPay = parseInt($("#price").val());
            } else {
                alert("구매할 수량을 입력하지 않으셨습니다.");
                $("#amount").focus();
                return;
            }
            alert("결제할 금액 : " + totalPay);
            //상품명_현재시간
            var d = new Date();
            var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
            var IMP = window.IMP; // 생략가능
            alert("date: "+ date)

            IMP.init('imp67615784'); // 결제 API를 사용하기 위한 코드 입력!
                IMP.request_pay({		//결제 요청
                    pg: "iamport00m",     //iamport00m  //T5102001
                    merchant_uid: '상품명_' + date, //상점 거래 ID
                    name: proName,				// 결제 명
                    amount: totalPay,					// 결제금액
                    buyer_email: email, // 구매자 email
                    buyer_name: cname,				// 구매자 이름
                    buyer_tel: tel,		// 구매자 전화번호
                    buyer_postcode: postcode			// 구매자 우편번호
                }, function (rsp) {
                    if (rsp.success) {
                        console.log(rsp);
                        var msg = '결제가 완료 되었습니다.';
                        var r1 = '고유 아이디 : ' +rsp.imp_uid;
                        var r2 = '상점 거래 아이디 : ' +rsp.merchant_uid;
                        var r3 = '결제 금액 : ' +rsp.paid_amount;
                        var r4 = '카드 승인 번호 : '+rsp.apply_num;

                        // 실제 결제 창
                        // $("#payCk").val("yes");
                        // $("#payAmount").val(rsp.paid_amount);
                        // $("#pmethod").val(rsp.pay_method);
                        // $("#pcom").val(rsp.pg_provider);
                        // $("#cnum").val(rsp.apply_num);
                        // alert(msg);
                        // $("#paymentResult").html(r1+"<br>"+r2+"<br>"+r3+"<br>"+r4);
                    } else {
                        //$("#paymentResult").html('결제실패<br>'+'에러내용 : ' +rsp.error_msg);
                    }
                    //테스트용이므로 실패시에도 그냥 통과시킴
                    $("#payCk").val("yes");
                    $("#payAmount").val(totalPay);
                    // $("#pmethod").val("신용카드");
                    // $("#pcom").val("삼성카드");
                    // $("#cnum").val("123-1234-1234-1278");
                    $("#paymentResult").text("결제 완료 : " + totalPay);
                });
                console.log(totalPay, proName, email, cname, tel, postcode, totalPay, IMP)

        });
    });
</script>
<script>
    function payCheck(f){
        var payCk = f.payCk.value;
        console.log(payCk);
        if(payCk!="yes"){
            alert("아직 결제 전 입니다.");
            return false;
        }
    }
</script>

<%--<script>--%>
<%--    $(document).ready(function(){--%>
<%--        $("#paybtn").click(function() {--%>
<%--            var IMP = window.IMP; // 생략가능--%>
<%--            alert(IMP)--%>
<%--            IMP.request_pay({--%>
<%--                pg : 'chai',--%>
<%--                pay_method : 'trans',--%>
<%--                merchant_uid: "order_no_0001", //상점에서 생성한 고유 주문번호--%>
<%--                name : '주문명:결제테스트',--%>
<%--                amount : 14000,--%>
<%--                buyer_email : 'iamport@siot.do',--%>
<%--                buyer_name : '구매자이름',--%>
<%--                buyer_tel : '010-1234-5678',--%>
<%--                buyer_addr : '서울특별시 강남구 삼성동',--%>
<%--                buyer_postcode : '123-456',--%>
<%--                m_redirect_url : '{결제 완료 후 리디렉션 될 URL}' // 예: https://www.my-service.com/payments/complete--%>
<%--            }, function(rsp) {--%>
<%--                if ( !rsp.success ) {--%>
<%--                    //결제 시작 페이지로 리디렉션되기 전에 오류가 난 경우--%>
<%--                    var msg = '오류로 인하여 결제가 시작되지 못하였습니다.';--%>
<%--                    msg += '에러내용 : ' + rsp.error_msg;--%>

<%--                    alert(msg);--%>
<%--                }--%>
<%--            });--%>
<%--        })--%>
<%--    })--%>
<%--</script>--%>
