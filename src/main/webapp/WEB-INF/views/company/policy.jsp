<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>HEABEOP::이용약관</title>
  <jsp:include page="../layout/head.jsp" />
  <link rel="stylesheet" href="${path }/resources/css/sub.css">
  <link rel="stylesheet" href="${path }/resources/css/lecture.css">

  <style>
    .policy_con {
      position: relative;
      overflow: hidden;
    }
    .basic_cont {
      width: 1170px;
      margin: 0 auto 140px;
    }
  </style>
</head>
<body>

<jsp:include page="../layout/header.jsp" />
<%-- 페이지 상단 --%>
<div class="container-fluid bg-primary mb-5">
  <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
    <h3 class="display-3 font-weight-bold text-white">이용약관</h3>
    <div class="d-inline-flex text-white">
      <p class="m-0"><a class="text-white" href="${path }/">Home</a></p>
      <p class="m-0 px-2">/</p>
      <p class="m-0"><a class="text-white" href="${path }/lecture/list.do?no=1">해법</a></p>
      <p class="m-0 px-2">/</p>
      <p class="m-0"><a class="text-white" href="${path }/lecture/list.do?no=1">이용약관</a></p>
    </div>
  </div>
</div>
<%-- 페이지 상단 끝 --%>
<div class="policy_con basic_cont">
  <p class="cont_stit">제 1 장 총 칙</p>
  <p class="dep_tit">제 1 조 (목적)</p>
  <div class="cont_txt2">이 이용약관(이하 "약관")은 해법(이하 "회사")와 이용 고객(이하 "회원")간에 회사가 제공하는 인터넷서비스(이하 "서비스")의 가입조건 및 이용에 관한 제반 사항과 기타 필요한 사항을 구체적으로 규정함을 목적으로 합니다.</div>
  <p class="dep_tit">제 2 조 (이용약관의 효력 및 변경)</p>
  <div class="cont_txt2">1. 이 약관은 <span style="font-family: &quot;Noto Sans KR&quot;, GmarketSans, sans-serif;">해법&nbsp;</span>웹사이트 <span style="font-family: &quot;Noto Sans KR&quot;, GmarketSans, sans-serif;">해법</span>(http://www.smarthb-math.co.kr)에서 온라인으로 공시함으로써 효력을 발생하며, 합리적인 사유가 발생할 경우 관련법령에 위배되지 않는 범위 안에서 개정될 수 있습니다. 개정된 약관은 온라인에서 공지함으로써 효력을 발휘하며, 이용자의 권리 또는 의무 등 중요한 규정의 개정은 사전에 공지합니다.<br>2. 회사는 합리적인 사유가 발생될 경우에는 이 약관을 변경할 수 있으며, 약관을 변경할 경우에는 지체 없이 이를 사전에 공시합니다.<br>3. 이 약관에 동의하는 것은 정기적으로 웹을 방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 회사에서 책임지지 않습니다.<br>4. 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이후에도 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.</div>
  <p class="dep_tit">제 3 조 (약관 외 준칙)</p>
  <div class="cont_txt2">1. 이 약관은 회사가 제공하는 개별서비스에 관한 이용안내(이하 "서비스별 안내")와 함께 적용합니다.<br>2. 이 약관에 명시되지 아니한 사항에 대해서는 관계법령 및 서비스별 안내의 취지에 따라 적용할 수 있습니다.</div>
  <p class="dep_tit">제 4 조 (용어의 정의)</p>
  <div class="cont_txt2">1. 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
    <div class="cont_box">① "이용고객" 또는 "회원"이라 함은 회원제서비스를 이용하는 이용자를 말합니다.<br>② "이용계약"이라 함은 서비스 이용과 관련하여 회사와 이용고객 간에 체결 하는 계약을 말합니다.<br>③ "이용자 ID"라 함은 이용고객의 식별과 이용고객의 서비스 이용을 위하여 이용고객이 선정 하고 회사가 부여하는 문자와 숫자의 조합을 말합니다.<br>④ "비밀번호"라 함은 이용고객이 부여 받은 이용자번호와 일치된 이용고객 임을 확인하고 이용고객의 권익보호를 위하여 이용고객이 선정한 문자와 숫자의 조합을 말합니다.<br>⑤ "단말기"라 함은 회사가 제공하는 서비스를 이용하기 위해 이용고객이 설치한 개인용 컴퓨터 및 모뎀 등을 말합니다.<br>⑥ "해지"라 함은 회사 또는 회원이 이용계약을 해약하는 것을 말합니다.</div>
    2. 이 약관에서 사용하는 용어의 정의는 관계법령 및 서비스별 안내에서 정하는 바에 의합니다.</div>
  <p class="cont_stit">제 2 장 이용계약 체결</p>
  <p class="dep_tit">제 5 조 (서비스 이용 계약의 성립)</p>
  <div class="cont_txt2">1. 가입 신청 양식을 기재한 후 "회원가입" 단추를 누르면 이 약관에 본인과 보호자가 동의하는 것으로 간주됩니다.<br>2. 이용 계약은 이용자의 이용 신청에 대하여 회사가 승낙함으로써 성립합니다.<br>3. 회원에 가입하여 서비스를 이용하고자 하는 희망자는 회사가 요청하는 개인 신상 정보를 제공해야 합니다.<br>4. 이용자의 이용 신청에 대하여 회사가 이를 승낙한 경우, 회사는 회원 아이디와 기타 회사가 필요하다고 인정하는 내용을 이용자에게 통지합니다.</div>
  <p class="dep_tit">제 6 조 (회원 가입 신청)</p>
  <div class="cont_txt2">1. 회원 가입을 원하는 희망자는 회사에서 요청하는 개인 신상정보를 회사가 지정하는 방법으로 신청하여야 합니다.<br>2. 회원 아이디와 비밀번호는 회원이 결정합니다. 단, 회원 아이디는 기존 회원들의 것과 중복되지 않아야 하며, 그 의미가 미풍양속을 저해하는 것이 아니어야 합니다.</div>
  <p class="dep_tit">제 7 조 (회원 가입 신청의 승낙)</p>
  <div class="cont_txt2">1. 회원 가입 신청자가 올바르게 개인 신상 정보를 절차에 따라 제공하면 서비스를 이용할 수 있는 회원이 됩니다.<br>2. 회사는 다음 각 호의 1에 해당하는 경우 이용신청에 대한 승낙을 제한할 수 있고, 그 사유가 해소될 때까지 승낙을 유보할 수 있습니다.
    <div class="cont_box">① 본인의 실명으로 신청하지 않은 경우<br>② 다른 사람의 명의를 사용하여 신청한 경우<br>③ 이용 신청 시 필요 내용을 허위로 기재하여 신청하는 경우<br>④ 기타 회사가 정한 이용 신청 요건이 미비한 경우<br>⑤ 사회의 안녕과 질서 혹은 미풍양속을 저해할 목적으로 신청한 경우<br>⑥ 신용정보의 이용과 보호에 관한 법률에 의한 PC통신, 인터넷 서비스의 신용 불량자로 등록되어 있는 경우</div>
  </div>
  <p class="dep_tit">제 8 조 (서비스의 이용)</p>
  <div class="cont_txt2">1. 회원은 가입 신청시 회원이 지정한 회원 아이디와 비밀번호를 통해 서비스에 로그인하여 서비스를 이용합니다.<br>2. 서비스 이용은 연중무휴, 1일 24시간을 원칙으로 합니다. 단, 회사가 업무 또는 기술상의 사유로 서비스가 일시 중지되거나 운영상의 목적으로 일시 중지할 수 있습니다.<br>3. 회원은 서비스 이용 중 필요에 따라 아이디를 제외한 비밀번호와 개인 신상 정보를 변경할 수 있습니다.</div>
  <p class="dep_tit">제 9 조 (서비스 이용 제한 및 계약 해지)</p>
  <div class="cont_txt2">1. 회원은 회사에서 지정한 절차에 의해서 탈퇴할 수 있으며, 탈퇴 즉시 본 약관에 따른 서비스 이용 계약은 해지됩니다.<br>2. 회사는 회원이 다음 사항에 해당하는 행위를 하였을 경우 별도의 사전통보 없이 서비스 이용 계약을 해지할 수 있습니다.
    <div class="cont_box">① 서비스에서 제공되는(얻은) 자료나 정보를 복제, 유통 시키거나 상업적으로 이용하려는 경우<br>② 공공 질서 및 미풍양속에 반하는 경우<br>③ 범죄적 행위에 관련되는 경우<br>④ 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행할 경우<br>⑤ 타인의 회원 아이디 및 비밀번호를 도용한 경우<br>⑥ 타인의 명예를 손상시키거나 불이익을 주는 경우<br>⑦ 같은 사용자가 다른 회원 아이디로 이중 등록한 경우<br>⑧ 특정 회원 아이디를 여러 사람이 공동으로 사용하는 경우<br>⑨ 서비스에 위해를 가하는 등 서비스의 건전한 이용을 저해하는 경우<br>⑩ 사용 중인 회원 아이디의 의미가 미풍양속을 저해한다고 판단될 경우<br>⑪ 기타 관련 법령이나 회사가 정한 이용조건에 위배되는 경우</div>
  </div>
  <p class="dep_tit">제 10 조 (손해배상 및 기타사항)</p>
  <div class="cont_txt2">1. 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.<br>2. 회사는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그밖에 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.<br>3. 회사는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.<br>4. 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 회사의 본사 소재지를 관할하는 법원을 전속 관할법원으로 합니다.</div>
  <p class="cont_stit">제 3 장 계약 당사자의 의무</p>
  <p class="dep_tit">제 11 조 (회원의 의무)</p>
  <div class="cont_txt2">1. 회원은 관계법령, 이 약관의 규정 이용안내 및 주의사항 등 회사가 통지하는 사항을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는 아니됩니다.<br>2. 아이디와 비밀번호에 관한 모든 관리책임은 회원에게 있습니다. 회원에게 부여된 아이디와 비밀번호의 관리 소홀, 부정 사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.<br>3. 회원은 내용별로 회사가 서비스 공지사항에 게시하거나 별도로 공지한 이용제한 사항을 준수하여야 합니다.<br>4. 회원은 회사의 사전승낙 없이는 서비스를 이용하여 영업활동을 할 수 없으며, 그 영업활동의 결과와 회원이 약관에 위반한 영업활동에 대하여 회사에 손해배상 의무를 집니다.<br>5. 회원은 서비스의 이용권한, 기타 이용 계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.<br>6. 자신의 아이디가 부정하게 사용된 경우 회원은 반드시 회사에 그 사실을 통보해야 합니다.<br>7. 회원은 서비스의 일부로 보내지는 회사의 전자우편을 받는 것에 동의합니다.<br>8. 회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 아니됩니다.
    <div class="cont_box">① 다른 회원의 아이디를 부정하게 사용하는 행위<br>② 서비스에서 얻은 정보를 회사의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 출판 및 방송 등에 사용하거나 제3자에게 제공하는 행위<br>③ 회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위<br>④ 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위<br>⑤ 범죄와 결부된다고 객관적으로 판단되는 행위<br>⑥ 기타 관계법령에 위배되는 행위</div>
  </div>
  <p class="dep_tit">제 12 조 (회사의 의무)</p>
  <div class="cont_txt2">1. 회사는 서비스의 제공과 관련하여 알게 된 이용자의 신상정보를 본인의 승낙없이 타인에게 누설, 배포하거나 상업적 목적으로 사용할 수 없습니다. 단, 관계 법령에 근거하여 관계 기관의 요구가 있는 경우 회사는 이에 응할 수 있습니다.<br>2. 회사는 이용자로부터 서비스 이용과 관련되어 제기되는 의견이나 불만이 정당하다고 인정되는 경우 이를 즉시 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우에는 이용자에게 그 사유와 처리 일정을 통보하여야 합니다.<br>3. 회사는 이용계약의 체결, 계약사항의 변경 및 해지 등 이용고객과의 계약 관련 절차 및 내용 등에 있어 이용고객에 편의를 제공하도록 노력해야 합니다.</div>
  <p class="dep_tit">제 13 조 (자료 및 게시물 관리)</p>
  <div class="cont_txt2">1. 회사는 회원이 서비스 상에 게재한 자료나 회원의 필요에 의해 회사의 시설에 저장하고 있는 자료에 대해 게시기간 또는 저장기간을 정할 수 있으며, 이에 따라 특정 자료를 삭제할 수 있습니다.<br>2. 회원이 게시하거나 등록하는 서비스 내의 내용물이 다음 각 항에 해당된다고 회사가 판단할 경우, 회사는 사전 통보 없이 이를 삭제할 수 있습니다.
    <div class="cont_box">① 제3자를 비방하거나 명예를 손상시키는 내용인 경우<br>② 공공질서 및 미풍양속에 위반되는 내용인 경우<br>③ 범죄적 행위와 결부된다고 판단되는 내용인 경우<br>④ 타인의 저작권 등 기타 권리를 침해하는 내용인 경우<br>⑤ 기타 관계 법령 및 회사가 정한 게시판 운영기준에 위배된다고 판단되는 경우</div>
    3. 회사는 회원이 서비스 내에 게시한 게시물이 타인의 저작권, 프로그램 저작권 등을 침해하더라도 이에 대한 민/형사상의 일체의 책임을 부담하지 않습니다. 만일 회원이 타인의 저작권, 프로그램 저작권 등을 침해하였음을 이유로 회사가 타인으로부터 손해배상청구 등 이의 제기를 받은 경우 회원은 회사의 면책을 위하여 노력하여 하며, 회사가 면책되지 못한 경우 회원은 그로 인해 회사에 발생한 모든 손해를 부담하여야 합니다.</div>
</div>

<jsp:include page="../layout/footer.jsp" />
</body>
</html>
