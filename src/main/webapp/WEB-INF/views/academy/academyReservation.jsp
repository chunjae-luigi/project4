<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP::서브</title>
    <jsp:include page="../layout/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/sub.css">
</head>
<body>
    <jsp:include page="../layout/header.jsp" />
    <div class="container-fluid bg-primary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
            <h3 class="display-3 font-weight-bold text-white">2차메뉴</h3>
            <div class="d-inline-flex text-white">
                <p class="m-0"><a class="text-white" href="${path }/">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0"><a class="text-white" href="#">2차메뉴</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">3차메뉴</p>
            </div>
        </div>
    </div>

    <div class="container-fluid mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height:50vh">
            <div class="container">
                <h2>${yyyy}년 ${mm}월 달력</h2>
                <div class="d-flex mt-3">
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
                        <form action="${rootPath}/reservation/insertReservation" method="post" onsubmit="return isSubmit(this)">
                            <input type="hidden" id="rdate" name="rdate">
                            <div id="timebox" class="rtimes p-3 container justify-content-center text-center">
                                날짜를 선택해주세요.
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../layout/footer.jsp" />
</body>
</html>


<script>

    let today = ${today};
    let restDays = ${restDayList};
    let unavailableDays = ${unavailableList};

    let isSubmit = function(form){
        var selectedRadio = form.querySelector('input[name="rtime"]:checked');

        if (!selectedRadio) {
            alert("시간대를 선택해주세요.");
            return false;
        }

        return true;
    };

    $(document).ready(function(){
        $("#day"+today).addClass("today");
        $("#day"+today).find(".event").text("TODAY");

        for (var [key, value] of Object.entries(unavailableDays)) {
            $("#day"+key).addClass("unavailable");
            $("#day"+key).addClass("pastdays");
            $("#day"+key).find(".event").text(value);
            $("#day"+key).find("a").removeAttr("href");
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

        let data = {"rdate": rdate, "ano": parseInt(${ano})};

        $.ajax({
            type: "post",
            url: "${rootPath}/reservation/selectDay",
            data: data,
            success: function(res){
                $("#timebox").html(`<p>\${day}일 예약 가능 시간 목록</p>`);

                for (var [t, c] of Object.entries(res)) {
                    var tt = parseInt(t);
                    var time = ``;
                    if(c<=0){
                        time = `<div class="time-radio">
                                    <input type="radio" class="btn-check" name="rtime" id="\${tt}" autocomplete="off" value=\${tt} disabled>
                                    <label class="btn btn-outline-primary" for="\${tt}">\${tt}:00 ~ \${tt+1}:00</label> (잔여: \${c}명)
                                </div>`
                    } else {
                        time = `<div class="time-radio">
                                            <input type="radio" class="btn-check" name="rtime" id="\${tt}" autocomplete="off" value=\${tt}>
                                            <label class="btn btn-outline-primary" for="\${tt}">\${tt}:00 ~ \${tt+1}:00</label> (잔여: \${c}명)
                                        </div>`
                    }

                    $("#timebox").append(time);
                }

                $("#timebox").append('<button class="btn btn-success" type="submit">예약하기</button>');
            },
            error: function(res){console.log("실패", res)},
        })
    }
</script>