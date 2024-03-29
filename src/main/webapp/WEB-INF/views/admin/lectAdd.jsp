<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <jsp:include page="../layout/adminHead.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/admin.css" />
    <link rel="stylesheet" href="${path }/resources/cleditor/jquery.cleditor.css">
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
                                <h5 class="m-b-10">강의 등록</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${path }/admin/"><i class="feather icon-home"></i></a></li>
                                <li class="breadcrumb-item"><a href="${path }/admin/lectList" onclick="return false;">강의 설정</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ breadcrumb ] end -->
            <!-- [ Main Content ] start -->
            <form action="${path }/admin/lectAdd.do" name="frm1" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-header">
                                <h5>강의 등록</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label" for="title">강의 제목</label>
                                            <input type="text" class="form-control" name="title" id="title" placeholder="강의 제목을 입력하세요." aria-describedby="강의 제목 도움" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label" for="subTitle">강의 소제목</label>
                                            <input type="text" class="form-control" name="subTitle" id="subTitle" placeholder="강의 소제목을 입력하세요." aria-describedby="강의 소제목 도움" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block">해당 과목</label>
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" id="sno1" name="sno" class="custom-control-input" value="1" checked>
                                                <label class="custom-control-label" for="sno1">수학</label>
                                            </div>
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" id="sno2" name="sno" class="custom-control-input" value="2">
                                                <label class="custom-control-label" for="sno2">영어</label>
                                            </div>
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" id="sno3" name="sno" class="custom-control-input" value="3">
                                                <label class="custom-control-label" for="sno3">기타</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label" for="content">내용</label>
                                            <textarea name="content" id="content" class="form-control" rows="8" cols="100" maxlength="1400" required></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block">강의 유형</label>
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" id="lectureType0" name="lectureType" class="custom-control-input" value="0" onchange="changeType(this)">
                                                <label class="custom-control-label" for="lectureType0">온라인</label>
                                            </div>
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" id="lectureType1" name="lectureType" class="custom-control-input" value="1" onchange="changeType(this)" checked>
                                                <label class="custom-control-label" for="lectureType1">오프라인</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row forOffline">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block" for="studentCnt">강의 인원수</label>
                                            <input type="number" class="form-control wid-150 d-inline-block" name="studentCnt" id="studentCnt" aria-describedby="인원수 입력" min="0" max="999"><p class="ml-2 d-inline-block">명</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row forOffline">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block">강의 일정</label>
                                            <input type="date" class="form-control mr-1 wid-150 d-inline-block" name="startDate" id="startDate"> ~ <input type="date" class="form-control ml-1 wid-150 d-inline-block" name="endDate" id="endDate">
                                        </div>
                                    </div>
                                </div>
                                <div class="row forOffline">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label" for="daily">강의 하루 일정</label>
                                            <input type="text" class="form-control" placeholder="ex) 08:00 - 10:00" name="daily" id="daily">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block" for="teacherNm">강의 강사</label>
                                            <input type="text" class="form-control d-inline-block" name="teacherNm" id="teacherNm" readonly style="width:calc(100% - 170px)">
                                            <input type="hidden" name="teacherId" id="teacherId">
                                            <button type="button" class="form-control ml-2 wid-150 d-inline-block" onclick="findTeacher()">찾기</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block">강의 썸네일 업로드(10MB 이하)</label>
                                            <input type="file" class="form-control uploadThumbnail" name="thumbnail" id="thumbnail" multiple>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block">강의 영상 업로드(10MB 이하)</label>
                                            <input type="file" class="form-control uploadThumbnail" name="lvideo" id="lvideo" multiple>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block">교재 이미지 업로드(10MB 이하)</label>
                                            <input type="file" class="form-control uploadThumbnail" name="bthumbnail" id="bthumbnail" multiple>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label" for="bookname">강의 교재</label>
                                            <input type="text" class="form-control" name="bookname" id="bookname" placeholder="교재명을 입력해주세요." aria-describedby="강의 소제목 도움" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label class="floating-label d-block" for="cost">강의 가격</label>
                                            <input type="number" class="form-control wid-150 d-inline-block" name="cost" id="cost" aria-describedby="강의 가격 입력" min="0"><p class="ml-2 d-inline-block">원</p>
                                        </div>
                                    </div>
                                </div>
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
    <script type="text/javascript" src="${path }/resources/cleditor/jquery.cleditor.js"></script>
    <script>
        $(document).ready(function() {
            $("#content").cleditor();
        });

        function changeType(obj){
            let type = $(obj).val();
            if(type == 0) {
                $("#studentCnt").val(999);
                $(".forOffline").hide();
                $('input[type="date"]').val(new Date().toISOString().substring(0, 10));
            } else {
                $("#studentCnt").val(0);
                $(".forOffline").show();
                $('input[type="date"]').val("");
            }
        }
        function findPro() {
            let popupOption = "width=650px, height=550px, top=150px, left=300px, scrollbar=yes";
            let popupUrl = "${path }/admin/findPro.do";
            window.open(popupUrl, 'child', popupOption);
        }
        function findTeacher() {
            let popupOption = "width=650px, height=550px, top=150px, left=300px, scrollbar=yes";
            let popupUrl = "${path }/admin/findTeacher.do";
            window.open(popupUrl, 'child', popupOption);
        }
    </script>
</body>
</html>