<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP</title>
    <jsp:include page="../layout/adminHead.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/admin.css" />
    <link rel="stylesheet" href="${path }/resources/css/owl.carousel.css" />
    <style>
        .floating-label lect {
            color: var(--main-color) !important;
            font-size: 20px !important;
        }
        .curri-add {
            width: 30%;
            height: 40px;
        }
        .d-flex > span{
            margin-left: 20px;
        }
        .d-flex > .d-inline {
            font-size: 16px;
            color: #0f6674;
            width:10%;
        }
        .curri-list {
            width: 30%;
            margin: 30px 0;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/adminHeader.jsp" />
<div class="pcoded-main-container">
    <div class="pcoded-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">강의 정보</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${path }/admin/"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#!" onclick="return false;">강의 설정</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
        <div>
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header"><h3>${lecture.title }</h3></div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12 col-12 pe-lg-12">
                                <div class="contact-info">
                                    <p style="font-size:20px; color:grey;"> ${lecture.subTitle }</p>
                                    <div class="border-bottom pb-3 mb-5">
                                        <c:choose>
                                            <c:when test="${!empty lvideo}">
                                                <img src="${path }/resources/upload/lecture/${lecture.thumbnail }" width="400" height="225"><br>
                                                <div><a class="btn btn-primary btn-lg px-3" href="${path }/resources/upload/lecture/${lecture.lvideo }" target="_blank" >강의영상</a></div>
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${path }/resources/image/lecture/dummy.png" width="400" height="225"><br>
                                                <div><a class="btn btn-primary btn-lg px-3" href="${path }/resources/image/lecture/lectvideo01.mp4" target="_blank" >강의영상</a></div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <p class="d-flex border-bottom pb-3 mb-4">
                                        <strong class="d-inline me-4">해당 과목 </strong>
                                        <span>${subject.title }</span>
                                    </p>
                                    <p class="d-flex border-bottom pb-3 mb-4">
                                        <strong class="d-inline me-4">강의 유형 </strong>
                                        <span>${lecture.lectureType }</span>
                                    </p>
                                    <p class="d-flex border-bottom pb-3 mb-4">
                                        <strong class="d-inline me-4">강의 내용 </strong>
                                        <span>${lecture.content }</span>
                                    </p>
                                    <p class="d-flex border-bottom pb-3 mb-4">
                                        <strong class="d-inline me-4">강의 인원수 </strong>
                                        <span>${lecture.studentCnt }</span>
                                    </p>

                                    <%-- 온라인 일정--%>
                                    <c:if test="${ lecture.lectureType eq 1}">

                                        <p class="d-flex border-bottom pb-3 mb-4">
                                            <strong class="d-inline me-4">강의 일정 </strong>
                                            <span>${lecture.startDate }</span>
                                        </p>
                                        <p class="d-flex border-bottom pb-3 mb-4">
                                            <strong class="d-inline me-4">강의 시간 </strong>
                                            <span>${lecture.daily }</span>
                                        </p>

                                    </c:if>

                                    <p class="d-flex border-bottom pb-3 mb-4">
                                        <strong class="d-inline me-4">담당 강사 </strong>
                                        <span>${lecture.teacherNm }</span>
                                    </p>

                                    <p class="d-flex border-bottom pb-3 mb-4">
                                        <strong class="d-inline me-4">강의 교재 </strong>
                                        <span>${lecture.bookname }</span><br>
                                        <c:choose>
                                            <c:when test="${!empty lecture.bthumbnail}">
                                                <img src="${path }/resources/upload/lecture/${lecture.bthumbnail }" width="200px">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${path }/resources/image/lecture/booksample.jpg" width="200px">
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                    <p class="d-flex border-bottom pb-3 mb-4">
                                        <strong class="d-inline me-4">강의 가격 </strong>
                                        <span><fmt:formatNumber value="${lecture.cost }" pattern="#,###" />원</span>
                                    </p>
                                    <p class="d-flex border-bottom pb-3 mb-4">
                                        <strong class="d-inline me-4">후기 관리 </strong>
                                        <span><a href="${path}/lecture/get.do?lno=${lecture.lno}#lect_review" class="btn btn-primary px-4 mr-2">수강생후기</a></span>
                                    </p>

                                </div>
                            </div>
                        </div>
                            <!-- 커리큘럼 영역 -->
                        <div class="curriculum">
                            <div>
                                <h4 class="tit">커리큘럼 등록하기</h4>
                                <div>
                                    <form action="${path }/curri/add.do" method="post">
                                        <input type="hidden" name="lno" id="lno" value="${lecture.lno}">
                                        <input type="text" class="curri-add" name="content" id="content" placeholder="커리큘럼 입력" maxlength="98" required>
                                        <input type="submit" class="button is-primary" value="등록">
                                    </form>
                                </div>
                            </div>
                            <!-- 커리큘럼 목록 -->
                            <div class="curri-list">
                                <ul class="list-group">
                                    <c:forEach var="curri" items="${curriList }">
                                        <li class="list-group-item">
                                                ${curri.content}
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <c:if test="${empty curriList }">
                                <tr>
                                    <td colspan="4">목차를 등록해주세요.</td>
                                </tr>
                            </c:if>
                        </div>
                        <!-- 커리큘럼 영역 끝 -->
                        <div class="row justify-content-md-end">
                            <div class="col-md-2 text-right">
                                <a href="${path }/admin/lectUpdate.do?lno=${lecture.lno }" class="btn btn-success d-inline-block ml-2">수정</a>
                                <a href="${path }/admin/lectDelete.do?lno=${lecture.lno }" class="btn btn-primary d-inline-block">삭제</a>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>
<jsp:include page="../layout/adminFooter.jsp" />
</body>
</html>