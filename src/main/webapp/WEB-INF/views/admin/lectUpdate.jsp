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
                            <h5 class="m-b-10">강의 정보 재설정</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${path }/admin/"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#!" onclick="return false;">강의 재설정</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->

        <form action="${path }/admin/lectUpdate.do" name="frm1" method="post" onsubmit="return checkVal(this)">
            <input type="hidden" name="lno" value="${lecture.lno }" />
            <div class="row">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <h5>강의 정보 재설정</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label" for="title">강의 제목</label>
                                    <input type="text" class="form-control" name="title" id="title" value="${lecture.title }" aria-describedby="강의 제목 도움" required>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label" for="title">강의 소제목</label>
                                    <input type="text" class="form-control" name="subTitle" id="subTitle" value="${lecture.subTitle }" aria-describedby="강의 소제목 도움" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label d-block">게시판 뎁스</label>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="depth0" name="depth" class="custom-control-input" value="1" onchange="changeType(this)"<c:if test="${boardMgn.depth == 1 }"> checked</c:if>>
                                        <label class="custom-control-label" for="depth0">메인</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="depth1" name="depth" class="custom-control-input" value="2" onchange="changeType(this)"<c:if test="${boardMgn.depth == 2 }"> checked</c:if>>
                                        <label class="custom-control-label" for="depth1">서브</label>
                                    </div>
                                </div>
                            </div>


                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label d-block">해당 과목</label>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="sno1" name="sno" class="custom-control-input" value="1" onchange="changeType(this)"<c:if test="${subject.sno == 1 }"> checked</c:if>>
                                        <label class="custom-control-label" for="sno1">수학</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="sno2" name="sno" class="custom-control-input" value="2" onchange="changeType(this)"<c:if test="${subject.sno == 2 }"> checked</c:if>>
                                        <label class="custom-control-label" for="sno2">영어</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="sno3" name="sno" class="custom-control-input" value="3" onchange="changeType(this)"<c:if test="${subject.sno == 3 }"> checked</c:if>>
                                        <label class="custom-control-label" for="sno3">영어</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label" for="content">내용</label>
                                    <textarea name="content" id="content" class="form-control" rows="8" cols="100" maxlength="1400" value="${lecture.content }" required></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label d-block">강의 유형</label>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="lectureType0" name="lectureType" class="custom-control-input" onchange="changeType(this)"<c:if test="${lecture.lectureType == 0 }"> checked</c:if>>
                                        <label class="custom-control-label" for="lectureType0">온라인</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="lectureType1" name="lectureType" class="custom-control-input" onchange="changeType(this)"<c:if test="${lecture.lectureType == 1 }"> checked</c:if>>
                                        <label class="custom-control-label" for="lectureType1">오프라인</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row forOffline">
                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label d-block" for="studentCnt">강의 인원수</label>
                                    <input type="number" class="form-control wid-150 d-inline-block" name="studentCnt" id="studentCnt" value="${lecture.studentCnt }" aria-describedby="인원수 입력" min="0" max="999"><p class="ml-2 d-inline-block">명</p>
                                </div>
                            </div>
                        </div>
                        <div class="row forOffline">
                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label d-block">강의 일정</label>
                                    <input type="date" class="form-control mr-1 wid-150 d-inline-block" name="startDate" id="startDate" value="${lecture.startDate }"> ~ <input type="date" class="form-control ml-1 wid-150 d-inline-block" name="endDate" id="endDate" value="${lecture.endDate }">
                                </div>
                            </div>
                        </div>
                        <div class="row forOffline">
                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label" for="daily">강의 하루 일정</label>
                                    <input type="text" class="form-control" placeholder="ex) 08:00 - 10:00" name="daily" id="daily" value="${lecture.daily }">
                                </div>
                            </div>
                        </div>



                    <%-- 슨생님 찾는 칸이다 슬비슬비슬비슬비슬비슬비슬비슬비슬비슬비 --%>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label d-block" for="teacherId">강의 강사</label>
                                    <input type="text" class="form-control d-inline-block" name="teacherNm" id="teacherNm" readonly style="width:calc(100% - 170px)" value="${lecture.teacherId }">
                                    <input type="hidden" name="teacherId" id="teacherId">
                                    <button type="button" class="form-control ml-2 wid-150 d-inline-block" onclick="findTeacher()">찾기</button>
                                </div>
                            </div>
                        </div>
                        <%--              슨생님 찾는 칸이다 슬비슬비슬비슬비슬비슬비슬비슬비슬비슬비 --%>




                        <!-- <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label d-block">강의 썸네일 업로드(10MB 이하)</label>
                                    <input type="file" class="form-control uploadThumbnail" name="thumbnail" id="thumbnail" multiple required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label d-block">강의 영상 업로드(10MB 이하)</label>
                                    <input type="file" class="form-control uploadThumbnail" name="lvideo" id="lvideo" multiple required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label d-block">교재 이미지 업로드(10MB 이하)</label>
                                    <input type="file" class="form-control uploadThumbnail" name="bthumbnail" id="bthumbnail" multiple required>
                                </div>
                            </div>
                        </div> -->
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label" for="bookname">강의 교재</label>
                                    <input type="text" class="form-control" name="bookname" id="bookname" value="${lecture.bookname }" placeholder="교재명을 입력해주세요." aria-describedby="강의 소제목 도움" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label class="floating-label d-block" for="cost">강의 가격</label>
                                    <input type="number" class="form-control wid-150 d-inline-block" name="cost" id="cost" value="${lecture.cost }" aria-describedby="강의 가격 입력" min="0"><p class="ml-2 d-inline-block">원</p>
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
        <div class="row justify-content-md-end">
            <div class="col-md-1">
                <button type="submit" class="btn btn-primary" style="width:100%;">등록</button>
            </div>
        </div>
    </form>
    <!-- [ Main Content ] end -->
    </div>
</div>
<jsp:include page="../layout/adminFooter.jsp" />
</body>
</html>