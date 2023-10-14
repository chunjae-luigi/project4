<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼</title>
    <%@ include file="../include/head.jsp" %>
    <script type="text/javascript" src="${headPath }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="content">

    <section class="page-title bg-04">
        <div class="container">
            <div class="columns">
                <div class="column is-12">
                    <div class="block has-text-centered">
                        <h1 class="is-capitalize text-lg font-happy">학습 자료실</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="section blog-wrap container">

        <form action="${headPath }/board/dataBoardUpdate.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="bno" id="bno" value="${dto.bno}">
            <table class="table">
                <tbody>
                <tr>
                    <th class="has-text-centered has-text-white"><label for="title">제목</label></th>
                    <td><input type="text" class="input" name="title" id="title" value="${dto.title}"></td>
                </tr>
                <tr>
                    <th class="has-text-centered has-text-white">업로드 파일</th>
                    <td colspan="2">
                        <c:if test="${!empty storages}">
                            <c:forEach var="file" items="${storages}">
                                <div class="dataBoardFile">
                                    <a href="${headPath}/resources/upload/${file.saveFolder}/${file.saveName}" download="${file.fileName}"><i class="icofont-ui-file mr-2"></i>${file.fileName}</a>
                                    <a href="${headPath}/storage/delete.do?fno=${file.fno}&bno=${dto.bno}" onclick=" return deleteFile()"><i class="icofont-ui-delete"></i></a>
                                </div>
                            </c:forEach>
                        </c:if>
                        <input class="input" type="file" name="uploadFiles" id="uploadFiles" multiple="true">
                    </td>
                </tr>
                <tr>
                    <th class="has-text-centered has-text-white"><label for="contents">내용</label></th>
                    <td>
                        <textarea name="contents" id="contents" class="textarea" maxlength="1500">${dto.content}</textarea>
                        <script>
                            CKEDITOR.replace('contents', {filebrowserUploadUrl: '${headPath}/storage/upload.do'});
                        </script>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="buttons is-centered">
                <input class="button is-mainColor" type="submit" value="수정 완료">
                <a href="${headPath }/board/dataBoardList.do" class="button is-success">글 목록</a>
            </div>
        </form>

    </section>





</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>


<script>
    function deleteFile(fno){
        let deleteTrue = confirm("파일을 삭제하시겠습니까?")
        if(deleteTrue){
            return true;
        } else{
            return false;
        }
    }
</script>