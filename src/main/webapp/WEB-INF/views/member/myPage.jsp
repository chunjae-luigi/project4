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
                                <li><a href="/user/myLecture.do">나의 강의실</a></li>
                                <li><a href="/user/myPay.do">나의 결제정보</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-10 p-2">
                        <div class="d-flex flex-column align-items-center justify-content-center right_side">
                            <h5 class="display-4">회원정보</h5>

                            <table class="table">
                                <tbody>
                                <tr>
                                    <th>이름</th>
                                    <td>${member.nm }</td>
                                </tr>
                                <tr>
                                    <th>아이디</th>
                                    <td>${member.id }</td>
                                </tr>
                                <tr>
                                    <th>비밀번호</th>
                                    <td><a href="${path }/user/changePw.do?id=${member.id }">비밀번호 변경</td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>${member.email }</td>
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td>${member.tel }</td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>[${member.postcode }] ${member.addr1} ${member.addr2}</td>
                                </tr>
                                <tr>
                                    <th>생일</th>
                                    <td>${member.birth }</td>
                                </tr>
                                <tr>
                                    <th>포인트</th>
                                    <td>${member.birth }</td>
                                </tr>
                                <tr>
                                    <th>등급</th>
                                    <td>
                                        <c:choose>
                                            <c:when test="${member.grade == 1 }">선생님</c:when>
                                            <c:when test="${member.grade == 2 }">회원</c:when>
                                            <c:otherwise>관리자</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="d-flex justify-content-end">
                                <a href="#" class="btn btn-primary px-5 py-2 mt-4">수정하기</a>
                                <a href="#" class="btn btn-success px-5 py-2 mt-4">탈퇴하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <jsp:include page="../layout/footer.jsp" />
</body>
</html>