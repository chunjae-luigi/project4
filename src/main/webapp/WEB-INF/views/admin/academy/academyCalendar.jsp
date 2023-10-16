<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP::예약</title>
    <jsp:include page="../../layout/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/sub.css">
</head>
<body>
    <jsp:include page="../../layout/header.jsp" />
    <div class="container-fluid bg-primary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
            <h3 class="display-3 font-weight-bold text-white">2차메뉴</h3>
            <div class="d-inline-flex text-white">
                <p class="m-0"><a class="text-white" href="${path }/">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0"><a class="text-white" href="#">학원 예약</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">3차메뉴</p>
            </div>
        </div>
    </div>

    <div class="container-fluid mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height:50vh">
            <div class="container">
                <h2>${yyyy}년 ${mm}월 달력</h2>
                <div class="d-flex">
                    <div class="calendar me-3">
                        <table class="text-center">
                            <thead>
                            <tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${calList}" var="cal">
                                <tr>
                                    <c:forEach items="${cal}" var="day">
                                        <td class="calendar-day" id="day${day}">
                                            <a href="javascript:selectDay(${day})"  >
                                                <div class="day"><div class="day-field">${day}</div></div>
                                                <div class="event">${event}</div>
                                            </a>
                                        </td>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="reservation">
                        <form id="calForm" action="${path}/academy/insertUnavailable" method="post" onsubmit="return isSubmit(this)">
                            <input type="hidden" id="rdate" name="rdate">
                            <input type="hidden" name="ano" value="${ano}">
                            <div id="timebox" class="rtimes p-3 container justify-content-center text-center">
                                날짜를 선택해주세요.
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../../layout/footer.jsp" />
</body>
</html>


<script>
    let today = ${today};
    let restDays = ${restDayList};
    let unavailableDays = ${unavailableList};

    /*    let isSubmit = function(form){
            var selectedRadio = form.querySelector('input[name="rtime"]:checked');

            if (!selectedRadio) {
                alert("시간대를 선택해주세요.");
                return false;
            }

            return true;
        };*/

    $(document).ready(function(){
        $("#day"+today).addClass("today");
        $("#day"+today).find(".event").text("TODAY");

        for (var [key, value] of Object.entries(unavailableDays)) {
            $("#day"+key).addClass("unavailable");
            $("#day"+key).find(".event").text(value);
        }

        for(var i=1; i<=parseInt(today); i++){
            $("#day"+i).addClass("pastdays");
            $("#day"+i).find("a").removeAttr("href");
        }

        for (var [key, value] of Object.entries(restDays)) {
            $("#day"+key).addClass("holiday");
            $("#day"+key).find(".event").text(value);
            $("#day"+key).find("a").removeAttr("href");
        }

    });

    let selectDay = function(day){
        $(".calendar-day").removeClass("selectDay");

        let rdate = "${yyyy}-${mm}-"+day;

        $("#rdate").val(rdate);
        $("#day"+day).addClass("selectDay");

        $("#timebox").html(`<p>\${day}일 휴일 설정하기</p>`);

        if($("#day"+day).hasClass("unavailable")){
            $("#calForm").attr("action", "${path}/academy/deleteUnavailable");
            $("#timebox").append('<button class="btn btn-danger" type="submit">삭제하기</button>');
        }

        else{
            var time = `<div class="mb-3"><label for="reason" class="form-label">예약 불가 사유</label><input type="text" class="form-control" id="reason" name="reason" placeholder="사유를 입력하세요." required></div>`

            $("#timebox").append(time);
            $("#timebox").append('<button class="btn btn-success" type="submit">등록하기</button>');
        }
    }
</script>