<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">

<head>
    <title>HEABEOP::</title>
    <jsp:include page="../layout/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/sub.css">
    <script type="text/javascript" src="${path }/resources/ckeditor/ckeditor.js"></script>
</head>

<body id="body">
<jsp:include page="../layout/header.jsp" />
    <c:if test="${!empty lecture }">
                    <c:forEach items="${lecture }" var="lecture" varStatus="status">
                        <ul>
                            <li class="text-center">${status.count }</li>
                            <li class="text-center"> ${lecture.lno }</li>
                            <li class="text-center"><a href="${path}/payment/payinsert.do?lno=${lecture.lno }">${lecture.title }</a></li>
                            <li class="text-center"> ${lecture.subtitle } </li>
                            <li class="text-center">${lecture.content }</li>
                            <li class="text-center">${lecture.lecturetype }</li>
                            <li class="text-center">${lecture.studentcnt }</li>
                            <li class="text-center">${lecture.teacherid }</li>
                        </ul>
                    </c:forEach>
    </c:if>
    <c:if test="${empty lecture }">
        <p class="f-18 f-w-600 text-center mt-3">등록된 강의가 없습니다.</p>
    </c:if>
<jsp:include page="../layout/footer.jsp" />
</body>
</html>