<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP</title>
    <jsp:include page="../../layout/adminHead.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/admin.css" />
    <link rel="stylesheet" href="${path }/resources/css/owl.carousel.css" />
    <style>
        .time {width: fit-content;}
        .row.reservation {margin: 0;}
    </style>
</head>
<body>
    <jsp:include page="../../layout/adminHeader.jsp" />
    <div class="pcoded-main-container">
        <div class="pcoded-content">
            <!-- [ breadcrumb ] start -->
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">예약 설정</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${path }/admin/"><i class="feather icon-home"></i></a></li>
                                <li class="breadcrumb-item"><a href="${path}/academy/adminReservationList" onclick="return false;">예약 설정</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ breadcrumb ] end -->
            <!-- [ Main Content ] start -->
            
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-header">
                            <h5>예약 설정</h5>
                        </div>
                        <div class="card-body table-border-style">
                            <div class="table-responsive">
                                <form action="${path}/academy/adminReservationSettingUpdate" method="post">
                                    <h5>영업일 설정</h5>
                                    <table class="table table-striped">
                                        <tbody>
                                        <c:forEach var="day" items="${weekday}">
                                            <tr>
                                                <th class="business-${day} text-center">
                                                    <input class="form-check-input" type="checkbox" id="business-${day}" name="${day}">
                                                    <label class="form-check-label" for="business-${day}"><spring:message code="weekday.${day}" /></label>
                                                </th>
                                                <td class=" text-center"><div class="d-flex hours justify-content-around ${day}" style="visibility: hidden"></div></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                    <h5>예약 설정</h5>
                                    <div class="row reservation mb-3">
                                        <label for="interval" class="col-sm-2 col-form-label">예약 간격(분단위, 가급적 수정 금지)</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="interval" id="interval" min="1" value="${reservation.interval}">
                                        </div>
                                    </div>
                                    <div class="row reservation mb-3">
                                        <label for="capactiy" class="col-sm-2 col-form-label">예약 최대 정원</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" name="capacity" id="capactiy" min="1" value="${reservation.capacity}">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-danger">수정</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>
    <jsp:include page="../../layout/adminFooter.jsp" />
</body>
</html>

<script>
    let business = ${business};
    let open = ${open};
    let close = ${close};

    $(document).ready(function(){
        for (var [key, value] of Object.entries(open)) {
            let openInput = `<div class="d-flex align-items-center"><input class="form-control time" type="time" id="open-\${key}" name="open\${key}" value="\${value}">
                             <label class="form-label" for="open-\${key}" style="margin-left: 1rem;">개점 시간</label></div>`;
            $(".hours").each(function(){
                if($(this).hasClass(key)){
                    $(this).append(openInput)
                }
            })
        }

        for (var [key, value] of Object.entries(close)) {
            let closeInput = `<div class="d-flex align-items-center"><input class="form-control time" type="time" id="close-\${key}" name="close\${key}" value="\${value}">
                             <label class="form-label" for="close-\${key}" style="margin-left: 1rem;">폐점 시간</label></div>`;
            $(".hours").each(function(){
                if($(this).hasClass(key)){
                    $(this).append(closeInput)
                }
            })
        }

        for (var [key, value] of Object.entries(business)) {
            if (value === "true") {
                $("#business-" + key).attr("checked", true);
                $(".hours").each(function(){
                    if($(this).hasClass(key)){
                        $(this).css("visibility", "visible");
                        return false;
                    }
                })
            }
        }

        $("input[type='checkbox']").change(function(){
            let name = this.name;
            if(this.checked){
                $(".hours").each(function(){
                    if($(this).hasClass(name)){
                        $(this).css("visibility", "visible");
                        return false;
                    }
                })
            } else{
                $(".hours").each(function(){
                    if($(this).hasClass(name)){
                        $(this).css("visibility", "hidden");
                        return false;
                    }
                });
            }
        })
    })

</script>