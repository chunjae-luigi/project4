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
    <link rel="stylesheet" href="${path}/resources/css/calendar.css">
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
            <%--  콘텐츠 영역  --%>
            <div class="card">
                <div class="card-body p-5">
                    <form name="frm1" id="frm1" action="${path}/academy/insertReservation" method="post">
                        <input type="hidden" name="id" value="${member.id}">

                        <h2 class="text-uppercase text-center mt-3 mb-5">예약하기</h2>

                        <div class="form-outline mb-2">
                            <input readonly type="text" name="rdate" id="rdate" value="${rdate}" class="form-control" />
                            <label class="form-label" for="rdate">예약일</label>
                        </div>
                        <div class="form-outline mb-2">
                            <input readonly type="text" name="rtime" id="rtime" value="${rtime}" class="form-control" />
                            <label class="form-label" for="rtime">예약시간</label>
                        </div>

                        <div class="form-outline mb-2">
                            <input type="text" name="name" id="name" placeholder="이름 입력" class="form-control" required />
                            <label class="form-label" for="name">학생 이름</label>
                        </div>

                        <div class="form-outline mb-2">
                            <input type="email" name="email" id="email" placeholder="이메일 입력" class="form-control" required>
                            <label class="form-label" for="email">예약자 이메일</label>
                        </div>

                        <div class="form-outline mb-2">
                            <input type="tel" name="tel" id="tel" maxlength="13" placeholder="전화번호 숫자만 입력 000-0000-0000" class="form-control" required>
                            <label class="form-label" for="tel">예약자 전화번호</label>
                        </div>

                        <div class="form-outline mb-2">
                            <input type="date" name="birth" id="birth" placeholder="생년월일 입력" class="form-control" required>
                            <label class="form-label" for="birth">학생 생년월일</label>
                        </div>

                        <div class="form-outline mb-2">
                            <input type="text" name="school" id="school" placeholder="학교명 입력" class="form-control" required>
                            <label class="form-label" for="school">재학 중인 학교</label>
                        </div>

                        <div class="form-outline mb-2">
                            <input type="number" name="grade" id="grade" placeholder="학년 입력" class="form-control" required min="1" max="6">
                            <label class="form-label" for="grade">현재 학년</label>
                        </div>

                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn btn-primary
                            px-5 py-2 mt-4 me-3" style="font-size:15px">예약하기</button>
                            <button type="button" onclick="getMember()" class="btn btn-primary px-5 py-2 mt-4" style="font-size:15px">회원 정보 불러오기</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../layout/footer.jsp" />
</body>
</html>


<script>
    let getMember = function(){
        $("#name").val("${member.nm}");
        $("#email").val("${member.email}");
        $("#tel").val("${member.tel}");
        $("#birth").val("${member.birth}");
    }
</script>
