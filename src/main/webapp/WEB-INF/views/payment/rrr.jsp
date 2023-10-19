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
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td> ${lecture.title}
                            <input type="hidden" name="plec" id="plec" value="${lecture.title}">
                            <input type="hidden" name="dno" id="dno" value="${lecture.lno}">
                        </td>
                        <td>선생님 이름 추가필요</td>
                        <td>${lecture.price}
                            <input type="hidden" name="price" id="price" value="${lecture.price}">
                        </td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="2" class="text-center">총계</td>
                        <td colspan="3" id="total"></td>
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
                    <div class="col-2"><label for="pnum" class="form-label">결제 번호</label></div>
                    <div class="col-6"><input type="text" class="form-control" id="pnum" name="pnum" required></div>
                    <div class="col-2">
                        <input type="button" id="paybtn" value="결제하기" class="btn btn-primary">
                    </div>
                </div>
                <%--  일단은 pay했다고 치기  --%>
                <input type="hidden" name="payCk" id="payCk" value="yes">
                <input type="submit" id="buy" value="구매" class="btn btn-primary">
                <input type="button" id="naverPayBtn" value="네이버페이 결제 버튼">
                <a href="${path }/payment/list.do" class="btn btn-primary">제품 목록</a>
            </form>

        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" />
</body>
</html>
<script>
    $(document).ready(function(){
        let total = 0;
        $("#price").each(function(){
            total = total + parseInt($(this).val());
        })
        $("#total").text(total+" 원");
    })
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
                    $("#pcon").append("<option value='" + cardArr1[i] + "'>" + cardArr1[i] + "</option>");
                }
            } else if(th==="체크카드"){
                for(var i=0;i<cardArr2.length;i++) {
                    $("#pcom").append("<option value='"+cardArr2[i]+"'>"+cardArr2[i]+"</option>");
                }
            } else {
                for(var i=0;i<bankArr.length;i++) {
                    $("#pcom").append("<option value='"+bankArr[i]+"'>"+bankArr[i]+"</option>");
                }
            }
        }).change();
    });
</script>
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //결제모듈 API 연동
    $(document).ready(function(){
        var totalPay=0;
        var proName;
        $("#paybtn").click(function(){
            var email = $("#email").val();
            var cname = $("#nm").val();
            var tel = $("#tel").val();
            var postcode = $("#postcode").val();
            proName = $("#proName").val();
            if($("#price").val()!="") {
                totalPay = parseInt($("#price").val());
            } else {
                alert("결제 내용이 올바르지 않습니다.");
                $("#price").focus();
                return;
            }
            alert("결제할 금액 : "+totalPay);



            //상품명_현재시간
            var d = new Date();
            var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
            var IMP = window.IMP; // 생략가능
            IMP.init('imp85122075'); // 결제 API를 사용하기 위한 코드 입력!
            IMP.request_pay({		//결제 요청
                pg: "T5102001",
                merchant_uid : '상품명_' + date, //상점 거래 ID
                name : proName,				    // 결제 명
                amount : totalPay,				// 결제금액
                buyer_email : email,            // 구매자 email
                buyer_name : cname,				// 구매자 이름
                buyer_tel : tel,		        // 구매자 전화번호
                buyer_postcode : postcode		// 구매자 우편번호
            }, function(rsp){
                if(rsp.success){
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
                } else{
                    //$("#paymentResult").html('결제실패<br>'+'에러내용 : ' +rsp.error_msg);
                }
                //테스트용이므로 실패시에도 그냥 통과시킴
                $("#payCk").val("yes");
                $("#payAmount").val(totalPay);
                // $("#pmethod").val("신용카드");
                // $("#pcom").val("삼성카드");
                // $("#cnum").val("123-1234-1234-1278");
                $("#paymentResult").text("결제 완료 : "+totalPay);
            });
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

<script>
    var IMP = window.IMP; // 생략가능
    IMP.init('imp85122075'); // 결제 API를 사용하기 위한 코드 입력!
IMP.request_pay({
pg : 'naverpay',
merchant_uid: "order_no_0001", //상점에서 관리하는 주문 번호
name : '주문명:결제테스트',
amount : 14000,
tax_free : 4000, //면세공급가액(누락되면 0원으로 처리)
buyer_email : 'iamport@siot.do',
buyer_name : '구매자이름',
buyer_tel : '010-1234-5678',
buyer_addr : '서울특별시 강남구 삼성동',
buyer_postcode : '123-456',
naverUseCfm : '20201001', //이용완료일자 (네이버페이 계약시 필수 파라미터로 설정된 경우에만 설정합니다.)
naverPopupMode : true, //팝업모드 활성화
m_redirect_url : "{결제 완료 후 리디렉션 될 URL}", //예 : http://yourservice.com/payments/complete
naverPurchaserName: "구매자이름",
naverPurchaserBirthday: "20151201",
naverChainId: "sAMplEChAINid",
naverMerchantUserKey: "가맹점의 사용자 키",
naverProducts : [{
    "categoryType": "BOOK",
    "categoryId": "GENERAL",
    "uid": "107922211",
    "name": "한국사",
    "payReferrer": "NAVER_BOOK",
    "sellerId": "sellerA",
    "count": 10
},
{
    "categoryType": "MUSIC",
    "categoryId": "CD",
    "uid": "299911002",
    "name": "러블리즈",
    "payReferrer": "NAVER_BOOK",
    "sellerId": "sellerB",
    "count": 1
}]
}, function(rsp) { //팝업 방식으로 진행 또는 결제 프로세스 시작 전 오류가 발생할 경우 호출되는 callback
if ( rsp.success ) {
//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
jQuery.ajax({
url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
type: 'POST',
dataType: 'json',
data: {
imp_uid : rsp.imp_uid
//기타 필요한 데이터가 있으면 추가 전달
}
}).done(function(data) {
//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
if ( everythings_fine ) {
var msg = '결제가 완료되었습니다.';
msg += '\n고유ID : ' + rsp.imp_uid;
msg += '\n상점 거래ID : ' + rsp.merchant_uid;
msg += '\n결제 금액 : ' + rsp.paid_amount;
msg += '카드 승인번호 : ' + rsp.apply_num;

alert(msg);
} else {
//[3] 아직 제대로 결제가 되지 않았습니다.
//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
}
});
} else {
var msg = '결제에 실패하였습니다.';
msg += '에러내용 : ' + rsp.error_msg;

alert(msg);
}
});
</script>