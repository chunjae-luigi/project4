<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>HEABEOP::오시는길</title>
  <jsp:include page="../layout/head.jsp" />
  <link rel="stylesheet" href="${path }/resources/css/sub.css">
  <link rel="stylesheet" href="${path }/resources/css/lecture.css">

  <style>
    .container-fluid.mb-5.intro {
      display: flex;
    }
    .intro_con {
      font-size: 20px;
    }
    .container {
      display: flex;
      align-items: center;
    }
    .image {
      width: 500px;
      height: auto;
    }
    .intro_con {
      padding: 10px;
    }
    .intro_box {
      display: flex;
      margin: 50px auto;
    }

  </style>
</head>
<body>

<jsp:include page="../layout/header.jsp" />
<%-- 페이지 상단 --%>
<div class="container-fluid bg-primary mb-5">
  <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
    <h3 class="display-3 font-weight-bold text-white">해법소개</h3>
    <div class="d-inline-flex text-white">
      <p class="m-0"><a class="text-white" href="${path }/">Home</a></p>
      <p class="m-0 px-2">/</p>
      <p class="m-0"><a class="text-white" href="${path }/lecture/list.do?no=1">해법</a></p>
      <p class="m-0 px-2">/</p>
      <p class="m-0"><a class="text-white" href="${path }/lecture/list.do?no=1">해법소개</a></p>
    </div>
  </div>
</div>
<%-- 페이지 상단 끝 --%>

<div class="container-fluid mb-5 intro">
  <div class="intro_box">
  <div class="intro_text">
  <h2><strong>해법은,</strong></h2>
  <div class="intro_con">
    <p>아동의 성장과 올바른 교육을 높이 가치있게 생각하는 교육회사입니다.</p>
    <p>교육을 통해 아이들의 잠재력을 최대한 끌어내고, 학습 경험을 풍부하게 만들기 위해 노력하고 있습니다.</p>
    <p>다양한 교육 솔루션을 제공하여 학생들이 더 효과적으로 학습할 수 있도록 돕고 있습니다.</p>
    <p>아동들의 학습을 지원하기 위해 혁신적인 기술과 방법을 도입하고 있으며, </p>
    <p>학생들의 개별적인 학습 스타일과 요구에 맞게 맞춤 교육 솔루션을 개발합니다.</p>
    <p>최신의 교육 트렌드와 기술을 적극적으로 활용하여 학생들이 언제 어디서나 학습할 수 있도록 지원합니다.</p>
    <p>우리의 가치관은 아동의 성장과 교육에 대한 열정과 헌신입니다.</p>
    <p>아이들이 미래에 대비하고 긍정적인 영향을 미칠 수 있도록 합니다.</p>
    <p>해법은 아이들의 미래를 밝게 비춰가는 교육회사로 자리잡고 있습니다.</p>
  </div>
  </div>
  <img src="${path}/resources/image/sub/intro.png" alt="회사 로고" class="image">
  </div>
</div>

<jsp:include page="../layout/footer.jsp" />
</body>
</html>
