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
        <div >
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <h5>${lecture.title }</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="card-body">
                                <div class="row-lect">
                                    <div class="col">
                                        <div class="form-group">

                                            <%-- 썸네일 경로 임시로 해놓은거라 수정필요함. //비--%>

                                            <label class="floating-label d-block">강의 썸네일</label>
                                            <div><img src="${path}/resources/image/lecture/thumnail(6).png"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <a href="${path }/resources/image/common/videosample.mp4" class="btn btn-primary d-inline-block" target="_blank">강의영상</a>
                                            <div><img src="${path}/resources/image/lecture/thumnail(6).png" height="225" width="400"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-lect">
                                    <div class="col">
                                        <div class="form-group">
                                            <!-- 경로수정필요//비-->
                                            <a class="btn btn-primary btn-lg px-4 me-sm-3" id="vvv" href="${path }/resources/image/common/videosample.mp4" target="_blank" >강의영상</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-lect">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label">강의 제목</label>
                                            <div> ${lecture.title }</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-lect">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label">강의 소제목</label>
                                            <div> ${lecture.subTitle }</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-lect">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block">해당 과목</label>
                                            <div>${subject.title }</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-lect">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label">강의유형</label>
                                            <div> ${lecture.lectureType }</div>
                                        </div>
                                    </div>
                                </div>
                            <div class="row-lect">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label">내용</label>
                                        <div class="board_view py-3 pl-4">${lecture.content }</div>
                                    </div>
                                </div>
                            </div>
                                <div class="row-lect forOffline">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block">강의 인원수</label>
                                            <div> ${lecture.studentCnt } 명</div>
                                        </div>
                                    </div>
                                </div>


                            <%-- 온라인 일정--%>
                            <c:if test="${ lecture.lectureType eq 0}">
                            <div class="row-lect forOffline">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label">강의 일정</label>
                                        <div >${lecture.startDate }</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row forOffline">
                            <div class="row-lect forOffline">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label">강의 하루 일정</label>
                                        <div >${lecture.daily }</div>
                                    </div>
                                </div>
                            </div>
                            </c:if>
                                <div class="row-lect">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block">담당 강사</label>
                                            <div>${lecture.teacherNm }</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-lect">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block">강의 교재</label>
                                            <div>${lecture.bookname }</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-lect">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block">교재</label>
                                            <div><img src="${path}/resources/image/common/booksample.jpg"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-lect">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block">강의 가격</label>
                                            <div>${lecture.cost }</div>
                                        </div>
                                    </div>
                                </div>

                            <!-- 커리큘럼 영역 -->
                            <div class="comment_add">
                                <h4 class="tit">커리큘럼 등록하기</h4>
                                <div>
                                    <form action="${path }/curri/add.do" method="post">

                                        <input type="hidden" name="lno" id="lno" value="${lecture.lno}">
                                        <input class="input" type="text" name="content" id="content" placeholder="커리큘럼 입력" maxlength="98" required>
                                        <input type="submit" class="button is-primary" value="등록">

                                    </form>
                                </div>
                            </div>
                            <!-- 커리큘럼 목록 -->
                            <div id="lect_list">
                                <ul class="list-group">
                                    <h2> 목차 </h2>
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

                                <%--                                <div class="row">--%>
                                <%--                                    <div class="col">--%>
                                <%--                                        <div class="form-group">--%>
                                <%--                                            <label class="floating-label d-block">사용 설정</label>--%>
                                <%--                                            <div class="custom-control custom-radio custom-control-inline">--%>
                                <%--                                                <input type="radio" id="useYn1" name="useYn" class="custom-control-input" value="true" checked>--%>
                                <%--                                                <label class="custom-control-label" for="useYn1">사용</label>--%>
                                <%--                                            </div>--%>
                                <%--                                            <div class="custom-control custom-radio custom-control-inline">--%>
                                <%--                                                <input type="radio" id="useYn2" name="useYn" class="custom-control-input" value="false">--%>
                                <%--                                                <label class="custom-control-label" for="useYn2">사용안함</label>--%>
                                <%--                                            </div>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                            </div>


                    </div>
                </div>
            </div>
        </div>
        <div class="row justify-content-md-end">
            <div class="col-md-2 text-right">
                <a href="${path }/admin/lectUpdate.do?no=${lecture.lno }" class="btn btn-success d-inline-block ml-2">수정</a>
                <a href="${path }/admin/lectDelete.do?no=${lecture.lno }" class="btn btn-primary d-inline-block">삭제</a>
            </div>
        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>
<jsp:include page="../layout/adminFooter.jsp" />
</body>
</html>