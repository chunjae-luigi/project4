-- ※필독!!!!!!※
-- teacher1, teacher2로 선생님 만들기
-- 강의 더미데이터 넣은 후, 관리자 수정 페이지에서 추가 데이터 삽입해야함.
-- 썸네일, 영상, 도서이미지를 수정페이지에서 선택하여 수정 완료하면 더미데이터 입력 완료.
-- resources/image/lecture에 썸네일, 영상, 도서이미지 있음.
-- 강의썸네일은 [lect01] 형태로 번호 매겨놓음. 나머진 자유선택.


-- 강의(꼭!!! 하나씩 등록하기)
INSERT INTO lecture VALUES
(DEFAULT, '깃허브 마스터 클래스' , '깃허브 A-Z까지, 마스터로 협업 고수되기' , 
'"깃과 버전 관리 마스터클래스"는 현대 소프트웨어 개발 분야에서 핵심적인 역할을 하는 깃(Git)과 버전 관리 시스템에 대한 깊고 포괄적인 학습 경험을 제공하는 고급 강의입니다. 이 강의는 소프트웨어 개발자, 소프트웨어 엔지니어, 프로젝트 관리자, 웹 개발자, 데이터 과학자, 그리고 모든 프로그래밍 관련 분야에서 활동하는 전문가와 학생을 대상으로 합니다.<br><br>
강의는 다음과 같은 주요 내용을 다룰 것입니다.<br>
깃과 버전 관리 개요: 깃의 중요성과 역할, 버전 관리의 필요성, 및 깃의 작동 원리에 대한 깊은 이해를 제공합니다.<br><br>
깃 저장소 생성 및 관리: 깃 저장소를 생성하고 관리하는 방법을 학습하며, 파일 및 디렉토리 관리, 커밋, 및 변경 내역 추적에 대한 실무 능력을 키웁니다.<br><br>
브랜치와 병합 전략: 브랜치 개념 및 다양한 병합 전략을 이해하고, 병합 및 리베이스의 활용법을 배웁니다.<br><br>
협업과 깃허브 활용: 원격 저장소를 활용하여 프로젝트 협업을 간편하게 관리하며, 깃허브를 통한 협업의 핵심 원리와 도구를 활용합니다.
<br><br>깃허브 페이지 개발과 호스팅: 정적 웹페이지를 개발하고 GitHub Pages를 통해 호스팅하는 방법을 단계별로 실습하여 웹 개발 역량을 강화합니다.
<br><br>문제 해결과 이슈 관리: 이슈 트래킹 및 관리, 문제 해결, 그리고 이슈에 대한 협업을 위한 최적 사례 및 전략을 다루며, 팀 협업 능력을 향상시킵니다.
<br><br>깃플로우 전략: 프로덕션 워크플로우를 향상시키는 깃플로우 전략을 구현하여 소프트웨어 개발 프로세스를 최적화합니다.
<br><br>깃허브 액션과 CI/CD: 지속적 통합(CI) 및 지속적 배포(CD)를 자동화하는 깃허브 액션을 설정하고, 소프트웨어 릴리스 프로세스를 개선합니다.
<br><br>깃허브 보안과 권한 관리: 깃허브의 접근 권한 및 보안 설정을 관리하는 방법을 학습하며, 프로젝트의 보안성을 강화합니다.
<br><br>깃허브 API와 확장 기능: 깃허브 API를 활용하여 사용자 정의 기능 및 확장 기능을 개발하며, 깃허브를 커스터마이징합니다.
<br><br>수강 대상:<br>"깃과 버전 관리 마스터클래스"는 소프트웨어 개발과 관련된 모든 분야에서 업무를 수행하는 분들을 위한 것으로, 개발자, 소프트웨어 엔지니어, 프로젝트 관리자, 웹 개발자, 데이터 과학자, 그리고 모든 프로그래밍 분야에서 작업하는 모든 전문가와 학생을 대상으로 합니다.
<br><br>학습 목표:<br>이 강의를 통해 학생들은 깃과 버전 관리 시스템을 전문적으로 다룰 수 있는 능력을 키우게 됩니다. 또한, 깃허브를 활용하여 프로젝트 협업, 지속적 통합 및 배포, 보안 설정, 그리고 확장 기능 개발을 실제로 구현하는 방법을 배우게 됩니다.
<br><br>강의 형식:<br>강의는 비디오 강의, 실습 과제, 토론 및 질문 세션, 그리고 실제 프로젝트 적용을 통해 학생들이 실무에서 적용 가능한 능력을 배우도록 설계되었습니다. "깃과 버전 관리 마스터클래스"는 현대 소프트웨어 개발 분야에서 반드시 알아야 하는 핵심 기술을 제공하며, 학생들은 개발 역량을 향상시키고 프로젝트 관리 능력을 혁신적으로 향상시킬 수 있는 기회를 제공합니다.
<br><br>',
0, 200, 0, 0, 0, 'teacher1', '최상민', '', '', 3, 35000, '깃허브 마스터', '' );

INSERT INTO lecture VALUES
(DEFAULT, '김기태의 코딩콘서트' , 'HTML, CSS, JavaScript 기초' ,
'웹 개발 프로그래밍 강의는 학생들에게 웹 개발의 포괄적인 이해와 능력을 제공하는 목적으로 설계되었습니다. 이 강의는 웹 기술의 다양한 측면을 다루며, 학생들에게 웹 애플리케이션을 구축하고 관리하는 데 필요한 기본 도구와 개념을 제공합니다.<br><br>
강의의 시작은 HTML(HyperText Markup Language), CSS(Cascading Style Sheets), 그리고 JavaScript로 웹 페이지를 구성하고 상호작용을 개발하는 부분입니다. 학생들은 웹 페이지의 구조, 디자인, 사용자 경험을 개선하는 방법을 배우며, 이는 웹 개발의 핵심입니다.<br><br>
또한, 강의는 백엔드 프로그래밍과 데이터베이스 관리에도 초점을 맞춥니다. 학생들은 서버 측 로직을 작성하고 데이터베이스를 효과적으로 활용하는 방법을 익힙니다. RESTful API 설계 및 서버 개발을 통해 학생들은 동적인 웹 애플리케이션을 구축하는 방법을 배우며, 이는 현대 웹 애플리케이션의 필수 구성 요소입니다.<br><br>
이 강의는 이론뿐만 아니라 실습 중심으로 진행되어 학생들이 직접 웹 애플리케이션을 개발하고 배포하는 경험을 쌓을 수 있습니다. 프로젝트 기반 학습을 통해 학생들은 문제 해결 능력을 향상시키고 협업 기술을 개선할 수 있습니다.<br><br>
웹 개발은 현재와 미래에 걸쳐 중요한 역할을 합니다. 강의를 통해 학생들은 웹 개발자로서의 경력을 시작하거나 이미 존재하는 기술을 확장하는 데 필요한 기반을 갖추게 됩니다. 이러한 기술은 현대의 디지털 시대에서 매우 가치 있으며, 다양한 분야에서 새로운 기회를 창출할 수 있는 역량을 제공합니다.<br><br>',
0, 100, 0, 0, 0, 'teacher1', '김기태', '', '', 3, 24000, '노베이스 웹개발 시작하기','' );

INSERT INTO lecture VALUES
(DEFAULT, 'CSS 정복하기' , '개발자의 숨겨진 감각을 일깨우자!' , 
'안녕하세요, CSS 강의에 관심을 가지신 여러분! <br><br>
CSS (Cascading Style Sheets)는 웹 디자인과 개발에서 핵심적인 역할을 하는 기술로, 웹페이지의 시각적인 모습을 조절하는 데 필수적입니다. <br>이 강의를 통해 여러분은 CSS의 기본 개념부터 고급 기술까지 학습하고, 웹페이지 디자인의 마법을 만들 수 있는 기술을 습득할 것입니다.<br><br>강의 내용:<br>
CSS 기초: CSS의 기본 구문과 선택자를 이해하고, HTML과 함께 사용하여 웹페이지 스타일링을 시작합니다.<br>
반응형 웹 디자인: 다양한 디바이스에서 웹페이지가 잘 보이도록 하는 방법과 미디어 쿼리 활용법을 학습합니다.<br>
CSS 레이아웃: 레이아웃 설계와 Flexbox, Grid를 활용한 웹페이지 구성을 다룹니다.<br>
폰트와 텍스트 스타일링: 텍스트의 폰트, 크기, 색상 및 여백 조절을 다루며 웹페이지의 가독성을 향상시킵니다.<br>
애니메이션과 변환: CSS를 사용한 웹페이지 애니메이션 및 요소 변환을 배우고 동적인 화면을 만들 수 있게 됩니다.<br><br>
공부 방법:<br>이 강의는 온라인으로 제공되며, 여러분은 편안한 환경에서 직접 학습할 수 있습니다. 강의 동영상, 예제 코드, 프로젝트 과제 등을 통해 실습 중심으로 학습할 수 있습니다. 또한, 커뮤니티 및 토론 포럼을 통해 질문을 하거나 다른 학습자와 경험을 공유할 수 있습니다.<br><br>
프로젝트 실습:<br>강의 내용을 바탕으로 실제 웹프로젝트를 진행하며, 습득한 스킬을 응용할 기회를 제공합니다. 이를 통해 이론을 실무에 적용해보며 더 나은 웹 디자인 및 개발 능력을 개선할 수 있습니다.<br><br>
자유로운 창의력 향상:<br>CSS는 창의력을 펼치는 데 큰 역할을 합니다. 여러분은 웹페이지 디자인에서 자유로워질 수 있으며, 고유하고 맞춤형 디자인을 구현할 수 있습니다. 자신만의 스타일을 개발하고 웹페이지에 독특한 개성을 부여하세요.<br><br>
커리어 기회:<br>CSS 스킬은 현업 웹 개발자나 디자이너로서의 경력에 큰 도움이 됩니다. 이 강의를 통해 취업 기회를 늘리고 더 많은 프로젝트에 참여할 수 있으며, 현업에서 웹 개발 및 디자인 분야에서 더 높은 신뢰와 역량을 얻을 수 있습니다.<br><br>
이 CSS 강의를 통해 여러분은 웹의 시각적 요소를 완벽하게 다룰 수 있는 능력을 키우고, 미래의 웹 개발 및 디자인 프로젝트에서 성공을 이룰 준비가 될 것입니다. 무엇을 기다리고 계신가요? 지금 시작해보세요!<br><br>',
0, 300, 0, 0, 0, 'teacher1', '박너욘', '', '', 3, 21000, '초보자도 할 수 있는 CSS 배우기', '' );

INSERT INTO lecture VALUES
(DEFAULT, '자바 프로그래밍 마스터클래스' , '자바를 잡을 수 있는 단 한번의 기회!' , 
'강의 소개:<br>"자바 프로그래밍 마스터클래스"는 모든 수강생이 자바 프로그래밍 언어와 생태계를 체계적으로 이해하고 뛰어난 개발 능력을 갖추도록 돕는 강의입니다. 이 강의는 모든 경험 수준의 학생들을 대상으로 하며, 자바 언어를 다루는 데 필요한 기초부터 고급 주제까지 다루게 됩니다. 이 강의는 프로그래밍 초보자부터 경험 있는 개발자까지 모두에게 도움이 될 것입니다.
<br><br>강의 내용:<br>강의는 다음과 같은 핵심 주제를 포함하며, 학생들은 각 주제에 대한 깊은 이해와 실무 능력을 배우게 됩니다:
<br><br>자바 기초: 변수, 자료형, 연산자, 제어문, 함수, 클래스 및 객체 지향 프로그래밍의 기초를 배웁니다.<br>
컬렉션과 데이터 구조: 리스트, 맵, 집합 등의 자료 구조를 활용하고 데이터를 효율적으로 관리하는 방법을 습득합니다.<br>
입출력과 파일 처리: 파일 읽기/쓰기, 스트림 처리, 네트워크 통신 등을 다루며, 입출력 프로그래밍 기술을 향상시킵니다.<br>
다중 스레딩 및 병렬 프로그래밍: 다중 스레드 활용, 병렬 프로그래밍 개념, 그리고 동시성 문제 해결 방법을 학습합니다.<br>
자바 디자인 패턴: 주요 디자인 패턴을 소개하고, 각 패턴을 프로젝트에 적용하는 방법을 연구합니다.<br>
자바 프레임워크와 라이브러리: Spring, Hibernate, 그리고 자바 생태계의 핵심 프레임워크 및 라이브러리를 활용하여 실제 프로젝트를 구축합니다.<br>
자바 개발 도구: 이클립스, IntelliJ IDEA, 그래들, 메이븐 등의 개발 도구를 사용하여 자바 프로젝트를 관리하는 방법을 숙지합니다.<br><br>
자바 최적화와 보안: 성능 최적화, 보안 측면에서 자바 애플리케이션을 개발하고 관리하는 방법을 학습합니다.<br>
실전 프로젝트: 강의 중에는 현실적인 프로젝트를 수행하며, 이론을 실무에 적용하는 기회를 제공합니다.<br><br>
수강 대상:<br>이 강의는 자바 프로그래밍을 처음 배우려는 초보자부터, 이미 자바를 사용하고 있는 개발자들에게 모든 수준의 학생들을 대상으로 합니다. 이론과 실무 경험을 통해 자바 개발 능력을 향상시키고 싶은 모든 이에게 적합합니다.
<br><br>학습 목표:<br>"자바 프로그래밍 마스터클래스"를 통해 학생들은 자바 프로그래밍 언어와 생태계에 대한 깊은 이해를 얻으며, 뛰어난 개발자로 성장하는데 필요한 기술과 지식을 습득합니다. 학생들은 다양한 프로젝트를 수행하고, 효과적인 자바 코드를 작성하는 방법을 마스터합니다.
<br><br>강의 형식:<br>강의는 이론 강의, 실습 과제, 토론 및 질문 세션, 그리고 실제 프로젝트를 통해 학생들이 자바 프로그래밍을 깊이 이해하고 응용할 수 있도록 구성되었습니다. 또한, 학생들은 강사와 동료들과 협업하며 실무적인 프로젝트 경험을 쌓을 기회를 갖게 됩니다. "자바 프로그래밍 마스터클래스"를 통해 학생들은 현대 소프트웨어 개발 분야에서 뛰어난 자바 개발자로 성장하는데 필요한 도구와 기술을 확보할 것입니다.<br><br>',
0, 300, 0, 0, 0, 'teacher1', '헤이호', '', '', 3, 21000, '자바의 정석', '' );

INSERT INTO lecture VALUES
(DEFAULT, '중등 영어 마스터', '기초부터 탄탄한 영어교육',
'수강생 대상:<br>이 강의는 중학교 1학년부터 3학년까지의 학생들을 대상으로 합니다. 수강생들은 영어를 처음 접하는 초보자부터 어느 정도 영어를 알고 있는 학생까지 다양한 수준의 학생을 위한 내용으로 구성되어 있습니다.
<br><br>강의 내용:<br>이 영어 강의는 다음과 같은 내용을 다룰 것입니다:<br><br>
영어 언어의 기초: 알파벳, 발음, 기초 어휘, 그리고 간단한 문법 규칙을 배웁니다.<br><br>
듣기와 말하기: 기본 회화 능력을 향상시키기 위해 영어 청취 및 발음 연습을 통해 의사소통 능력을 강화합니다.<br><br>
읽기와 쓰기: 영어 텍스트를 읽고 이해하는 기술을 개발하며, 주제와 관련된 글을 작성하는 방법을 배웁니다.<br><br>
영어 어휘와 문법: 어휘 확장 및 문법 규칙을 습득하여 영어 작문 능력을 향상시킵니다.<br><br>
문화와 역사: 영어권 국가들의 문화, 역사, 전통, 그리고 일상 생활에 대한 이해를 통해 영어권 국가들과의 연결을 강화합니다.<br><br>
실제 대화 및 상황 대화: 일상 대화와 다양한 상황에서의 대화를 연습하여 실제 상황에서 영어를 사용할 수 있는 능력을 개발합니다.<br><br>
영어 리스닝: 영어로 이루어진 오디오 자료를 듣고 이해하며, 언어 환경에서 영어 실력을 향상시킵니다.<br><br>
영어 미디어와 자료 활용: 영어 영화, 음악, 뉴스, 그리고 인터넷 자료를 활용하여 언어 이해와 영어 독해 능력을 향상시킵니다.<br><br>
영어 프로젝트 및 발표: 주제별 프로젝트를 수행하고, 영어로 발표하는 기회를 통해 커뮤니케이션 및 발표 능력을 향상시킵니다.<br><br>
영어 시험 준비: 중학교 이수 시험 및 영어 자격증 시험 준비를 위한 스킬과 전략을 학습합니다.<br><br>학습 목표:<br>
"중학교 영어 강의"의 주요 목표는 학생들이 영어 언어를 자신감 있게 사용하고, 영어로 의사소통할 수 있는 능력을 키우는 것입니다. 학생들은 다음과 같은 능력을 향상시킬 것입니다:
<br>듣기와 말하기 능력: 영어로 대화를 나누고 리스닝 능력을 향상시키며, 영어로 의사소통할 수 있게 됩니다.<br><br>
읽기와 쓰기 능력: 영어 텍스트를 읽고 이해하며, 주제와 관련된 글을 작성하는 능력을 갖추게 됩니다.<br><br>
어휘와 문법: 어휘 확장과 문법 규칙을 습득하여 영어 실력을 향상시키며, 영어로 효과적으로 표현할 수 있게 됩니다.<br><br>
문화 이해: 영어권 국가들의 문화와 역사에 대한 이해를 통해 다양한 문화에 대한 개방적인 시각을 갖추게 됩니다.<br><br>
실생활 대화: 다양한 상황에서의 대화 능력을 향상시키며, 현실에서 영어를 자신있게 사용할 수 있게 됩니다.<br><br>
강의 형식:<br>"중학교 영어 강의"는 다양한 학습 활동을 통해 학생들의 영어 실력을 향상시킵니다. 이론 강의, 실습 문제, 그룹 토론 및 질문 세션, 프로젝트 및 발표, 그리고 영어 영상 및 오디오 자료를 활용한 학습이 포함됩니다. 학생들은 수업을 통해 영어를 능숙하게 사용하며, 교실 내외에서 언어 실력을 증진시킬 수 있는 기회를 갖게 됩니다. "중학교 영어 강의"를 통해 학생들은 영어를 자신있게 사용하며, 미래의 학업 및 진로에 대비할 수 있는 강력한 언어 능력을 키우게 될 것입니다.<br><br>',
0, 200, 0, 0, 0, 'teacher2', '황교진', '', '', 1, 19000, '영어의 정석', '' );


INSERT INTO lecture VALUES
(DEFAULT, '초등 재미있는 영어' , '재미로 시작하는 초등 영어 공부' , 
'초등학교 영어 강의는 학생들이 영어 언어를 배우고 의사소통하는 능력을 향상시키는 데 중요한 역할을 합니다. 이 강의는 초등학교 학년별 영어 교육 커리큘럼을 기반으로 하며, 학생들이 영어를 재미있게 배우며, 국제적으로 소통할 수 있는 능력을 키우는 것을 목표로 합니다.<br><br>
수강생 대상:<br>이 강의는 초등학교 1학년부터 6학년까지의 학생들을 대상으로 합니다. 수강생들은 영어를 처음 배우는 초보자부터 어느 정도 영어를 알고 있는 학생까지 다양한 수준의 학생을 위한 내용으로 구성되어 있습니다.<br><br>
강의 내용:<br>초등학교 영어 강의는 다음과 같은 내용을 다룰 것입니다<br>
영어 기초: 영어 알파벳, 발음, 간단한 어휘, 기초 문법 규칙을 배우며, 영어 언어의 기초를 다진다.<br>
듣기와 말하기: 기본 회화 능력을 향상시키기 위해 영어 청취 및 발음 연습을 통해 의사소통 능력을 강화한다.<br>
읽기와 쓰기: 영어 텍스트를 읽고 이해하며, 주제와 관련된 글을 작성하는 방법을 배운다.<br>
영어 어휘와 문법: 어휘 확장 및 문법 규칙을 습득하여 영어로 효과적으로 표현할 수 있는 능력을 향상시킨다.<br>
영어 문화와 역사: 영어권 국가들의 문화, 역사, 전통, 그리고 일상 생활에 대한 이해를 통해 영어권 국가들과의 연결을 강화한다.<br>
실제 대화와 상황 대화: 다양한 상황에서의 대화를 연습하여 실제 상황에서 영어를 사용할 수 있는 능력을 개발한다.<br><br>
학습 목표:<br>초등학교 영어 강의의 주요 목표는 학생들이 영어를 자신감 있게 사용하고, 영어로 의사소통할 수 있는 능력을 키우는 것입니다. 학생들은 다음과 같은 능력을 향상시킬 것입니다:<br>
듣기와 말하기 능력: 영어로 대화를 나누고 리스닝 능력을 향상시키며, 영어로 의사소통할 수 있게 됩니다.<br>
읽기와 쓰기 능력: 영어 텍스트를 읽고 이해하며, 주제와 관련된 글을 작성하는 능력을 갖추게 됩니다.<br>
어휘와 문법: 어휘 확장과 문법 규칙을 습득하여 영어 실력을 향상시키며, 영어로 효과적으로 표현할 수 있게 됩니다.<br>
문화 이해: 영어권 국가들의 문화와 역사에 대한 이해를 통해 다양한 문화에 대한 개방적인 시각을 갖추게 됩니다.<br>
실생활 대화: 다양한 상황에서의 대화 능력을 향상시키며, 현실에서 영어를 자신있게 사용할 수 있게 됩니다.<br><br><br>
강의 형식:<br>초등학교 영어 강의는 다양한 학습 활동을 통해 진행됩니다. 이론 강의, 실습 문제, 그룹 토론 및 질문 세션, 프로젝트 및 발표, 그리고 영어 영상 및 오디오 자료를 활용한 학습이 포함됩니다. 학생들은 수업을 통해 영어를 능숙하게 사용하며, 교실 내외에서 언어 실력을 증진시킬 수 있는 기회를 갖게 됩니다.<br><br>
"초등학교 영어 강의"를 통해 학생들은 영어를 자신있게 사용하며, 미래의 학업 및 진로에 대비할 수 있는 강력한 언어 능력을 키우게 될 것입니다.<br><br>',
0, 300, 0, 0, 0, 'teacher2', '이슬비', '', '', 1, 16500, '우리아이 영어 재미키우기', '' );

select * from lectview;
SELECT * FROM lecture;
SELECT * FROM curri;


-- 커리큘럼(한 번에 등록가능)
INSERT INTO curri VALUES 
(DEFAULT, 1, '1. 깃과 버전 관리 개요'),
(DEFAULT, 1, '2. 깃 저장소 생성 및 관리'),
(DEFAULT, 1, '3. 브랜치와 병합'),
(DEFAULT, 1, '4. 협업과 깃허브'),
(DEFAULT, 1, '5. 깃허브 페이지 개발'),
(DEFAULT, 1, '6. 문제 해결과 이슈 관리'),
(DEFAULT, 1, '7. 깃플로우 전략'),
(DEFAULT, 1, '8. 깃허브 액션과 CI/CD'),
(DEFAULT, 1, '9. 깃허브 보안 및 권한 관리'),
(DEFAULT, 1, '10. 깃허브 API와 확장 기능'),

(DEFAULT, 2, '1. 웹개발 프로그래밍 입문'),
(DEFAULT, 2, '2. HTML 기초'),
(DEFAULT, 2, '3. CSS 스타일링'),
(DEFAULT, 2, '4. JavaScript 기초'),
(DEFAULT, 2, '5. 웹 개발 프레임워크'),
(DEFAULT, 2, '6. 백엔드 개발 기초'),
(DEFAULT, 2, '7. 웹 보안 기초'),
(DEFAULT, 2, '8. 데이터베이스 관리'),
(DEFAULT, 2, '9. 웹 호스팅 및 배포'),
(DEFAULT, 2, '10. 웹 개발 프로젝트'),

(DEFAULT, 3, '1. CSS 기초와 선택자'),
(DEFAULT, 3, '2. 박스 모델과 레이아웃'),
(DEFAULT, 3, '3. 텍스트 스타일링과 글꼴 관리'),
(DEFAULT, 3, '4. 배경과 그래디언트 활용'),
(DEFAULT, 3, '5. 트랜지션과 애니메이션 효과'),
(DEFAULT, 3, '6. Flexbox 레이아웃 설계'),
(DEFAULT, 3, '7. 그리드 레이아웃 디자인'),
(DEFAULT, 3, '8. 미디어 쿼리를 활용한 반응형 디자인'),
(DEFAULT, 3, '9. CSS 전처리기(SCSS) 활용'),
(DEFAULT, 3, '10. CSS 프레임워크 및 라이브러리 소개'),

(DEFAULT, 4, '1. 자바 프로그래밍 기초'),
(DEFAULT, 4, '2. 자바 데이터 타입'),
(DEFAULT, 4, '3. 자바 연산자'),
(DEFAULT, 4, '4. 자바 제어문'),
(DEFAULT, 4, '5. 자바 배열과 컬렉션'),
(DEFAULT, 4, '6. 자바 객체지향 프로그래밍'),
(DEFAULT, 4, '7. 자바 예외 처리'),
(DEFAULT, 4, '8. 자바 입출력'),
(DEFAULT, 4, '9. 자바 스레드와 동시성'),
(DEFAULT, 4, '10. 자바 웹 애플리케이션 개발'),

(DEFAULT, 5, '1. 영어 알파벳과 발음'),
(DEFAULT, 5, '2. 일상 생활 영어'),
(DEFAULT, 5, '3. 문법과 문장 구조'),
(DEFAULT, 5, '4. 어휘력 향상'),
(DEFAULT, 5, '5. 독해와 작문 기술'),
(DEFAULT, 5, '6. 문화와 역사적 배경'),
(DEFAULT, 5, '7. 영어 회화 연습'),
(DEFAULT, 5, '8. 영어 문학과 작품 분석'),
(DEFAULT, 5, '9. 비즈니스 영어'),
(DEFAULT, 5, '10. 중학교 영어 프로젝트'),

(DEFAULT, 6, '1. 영어 알파벳과 소리'),
(DEFAULT, 6, '2. 일상 생활에서의 영어 표현'),
(DEFAULT, 6, '3. 단어와 문장 구조 이해'),
(DEFAULT, 6, '4. 동사와 형용사 활용'),
(DEFAULT, 6, '5. 독해와 작문 능력 향상'),
(DEFAULT, 6, '6. 노래와 게임을 통한 영어 학습'),
(DEFAULT, 6, '7. 문화와 관례 배우기'),
(DEFAULT, 6, '8. 영어 회화 스킬 향상'),
(DEFAULT, 6, '9. 영어 이야기와 시집 읽기'),
(DEFAULT, 6, '10. 초등학교 영어 프로젝트 완성');


-- 리뷰(한 번에 등록하기)
INSERT INTO review VALUES
(DEFAULT, 1, 'heyho', '하나부터 열까지 이렇게 섬세하게 알려주는 사람은 상민쌤밖에 없을거에요ㅠㅠ 무료로 제공해주신 자료 보면서 혼자 실습도 해봤어요. 덕분에 깃허브 마스터 됐습니다!!', 5, DEFAULT),
(DEFAULT, 1, 'park95', '완전 강추, 주변에도 추천함', 5, DEFAULT),
(DEFAULT, 1, 'yyy82', '우웩 깃은 저를 싫어하나봐요ㅠㅠ', 2, DEFAULT),
(DEFAULT, 1, 'S21004', '훌륭한 학습 경험을 얻을 수 있었습니다. 알찬 커리큘럼과 친절한 내용, 안들을 이유가 없는듯해요', 4, DEFAULT),
(DEFAULT, 2, '1BEE', '정말 말 그대로 코딩 콘서트 그 자체!! 저는 아무것도 모르는 관객입니다..', 2, DEFAULT),
(DEFAULT, 2, 'atoz', '노베이스에게 희망이 되는 내용이에요. 도움이 되었습니다.', 5, DEFAULT),
(DEFAULT, 2, 'heyho', '웩,, 살려주세요', 1, DEFAULT),
(DEFAULT, 3, 'park95', '너욘썜 너무 친절하고 재미있어요. 흥미 잃지 않고 꾸준히 배울 수 있는 내용이라 너무 좋았어요. 강추!', 5, DEFAULT),
(DEFAULT, 3, 'heyho', '초보자도 쉽게 배울 수 있는 내용이에요!! 아직 갈길이 멀지만....', 4, DEFAULT),
(DEFAULT, 4, 'atoz', '아무래는 자바는 저에게 잡히지 않을 것 같아요.... ...', 2, DEFAULT),
(DEFAULT, 5, 'atoz', '너무 지루해요ㅠㅠ', 1, DEFAULT),
(DEFAULT, 5, '1BEE', '교진쌤 목소리 핵좋아요 동굴목소리 ', 5, DEFAULT),
(DEFAULT, 6, '1BEE', '영어 강의 추천합니다. 훌륭한 학습 경험을 얻을 수 있습니다.', 5, DEFAULT);

