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
                            <h5 class="m-b-10">강의 재설정</h5>
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
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <h5>${lecture.title }</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block">강의 썸네일</label>
                                            <div class="form-control"><img src="${path}/resources/upload/${lecture.thumbnail }"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <a href="${path}/resources/upload/${lecture.lvideo}" class="btn btn-primary d-inline-block" target="_blank">강의영상</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label">강의 제목</label>
                                        <div class="form-control"> ${lecture.title }</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label">강의 소제목</label>
                                        <div class="form-control"> ${lecture.subTitle }</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label d-block">해당 과목</label>
                                        <div class="form-control">${subject.title }</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label">내용</label>
                                        <textarea class="form-control" readonly>${lecture.content }</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label d-block">강의 유형</label>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" id="lectureType0" name="lectureType" class="custom-control-input" value="true" onclick="return false" <c:if test="${lecture.lectureType }">checked</c:if>>
                                            <label class="custom-control-label" for="lectureType0" onclick="return false">사용</label>
                                        </div>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" id="lectureType1" name="lectureType" class="custom-control-input" value="false" onclick="return false" <c:if test="${!lecture.lectureType }">checked</c:if>>
                                            <label class="custom-control-label" for="lectureType1" onclick="return false">사용안함</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row forOffline">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label d-block">강의 인원수</label>
                                        <div class="form-control"> ${lecture.studentCnt } 명</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row forOffline">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label">강의 하루 일정</label>
                                        <div class="form-control">${lecture.startDate }</div>
                                    </div>
                                </div>
                            </div>



                            <%-- 슨생님 찾는 칸이다 슬비슬비슬비슬비슬비슬비슬비슬비슬비슬비 --%>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label d-block">담당 강사</label>
                                        <div class="form-control">${lecture.teacherId }</div>
                                    </div>
                                </div>
                            </div>
                            <%--              슨생님 찾는 칸이다 슬비슬비슬비슬비슬비슬비슬비슬비슬비슬비 --%>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label d-block">강의 교재</label>
                                        <div class="form-control">${lecture.bookname }</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label d-block">교재</label>
                                        <div class="form-control"><img src="${path}/resources/upload/${lecture.bthumbnail }"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="floating-label d-block">강의 가격</label>
                                        <div class="form-control">${lecture.cost }</div>
                                    </div>
                                </div>
                            </div>

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
                <a href="${path }/admin/lectDelete.do?no=${lecture.lno }" class="btn btn-primary d-inline-block">삭제</a>
                <a href="${path }/admin/lectUpdate.do?no=${lecture.lno }" class="btn btn-success d-inline-block ml-2">수정</a>
            </div>
        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>
<jsp:include page="../layout/adminFooter.jsp" />
</body>
</html>