<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼</title>
    <%@ include file="../include/head.jsp" %>
    <link rel="stylesheet" href="${headPath}/resources/css/boardget.css">
</head>

<body>
<%@ include file="../include/header.jsp" %>

<div class="content">

    <section class="page-title bg-02">
        <div class="container">
            <div class="columns">
                <div class="column is-12">
                    <div class="block has-text-centered">
                        <h1 class="is-capitalize text-lg font-happy">Qna</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="section blog-wrap container">
        <div class="detail">
            <div class="conwrap">
                <div class="h3group">
                    <div class="location">
                        <span class="depth">홈</span>
                        <span class="depth"> / 커뮤니티</span><strong class="this"> / 문의게시판</strong>
                    </div>
                </div>
                <div class="viewbody">
                    <div class="hgroup">
                        <c:if test="${ sid eq 'admin'}">
                        <div class="no">NO ${courseQna.qno }</div>
                        </c:if>
                        <div class="tit">
                            <c:if test="${courseQna.lev==0}">
                                <p>[질문]</p>
                            </c:if>
                            <c:if test="${courseQna.lev==1}">
                                <p>[답변]</p>
                            </c:if>
                            ${courseQna.title}
                        </div>
                        <div class="util">
                            <div class="name">${courseQna.author }</div>
                            <div class="date">작성일
                                <fmt:parseDate value="${courseQna.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                            </div>
                            <div class="hit">조회수 ${courseQna.visited }</div></div>
                    </div>
                    <div class="content">
                        ${courseQna.content }
                    </div>
                    <div class="buttons is-centered">
                        <a class="button is-mainColor" href="${headPath }/board/courseQnaList.do">목록</a>
                        <c:if test="${not empty sid && (sid eq 'admin' || courseQna.author eq sid)}">
                            <a class="button is-success" href="${headPath }/board/qnaUpdate.do?qno=${courseQna.qno}&author=${courseQna.author}">수정</a>
                            <a class="button is-mainColor" href="${headPath }/board/qnaDelete.do?qno=${courseQna.qno}&author=${courseQna.author}">삭제</a>
                            <c:if test="${courseQna.lev == 0}">
                            <a class="button is-success"  href="${headPath}/board/qnaInsert.do?lev=1&par=${courseQna.qno}" >답변하기</a>
                        </c:if>
                        </c:if>

                    </div>
                </div>

</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>

<script>
    $(document).ready(function(){
        if($("tbody tr").length==0){
            $("tbody").append("<tr><td colspan='5' class='text-center'>해당 목록이 존재하지 않습니다.</td></tr>")
        }
    })
</script>