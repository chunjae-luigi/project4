CREATE DATABASE team44;

USE team44;

CREATE TABLE member(
	mno INT AUTO_INCREMENT PRIMARY KEY,					-- 회원 번호 : 자동 발생
	id VARCHAR(20) UNIQUE KEY,								-- 회원 아이디
	pw VARCHAR(500) NOT NULL,								-- 회원 비밀번호
	nm VARCHAR(50) NOT NULL,								-- 회원 이름
	email VARCHAR(50) NOT NULL,							-- 회원 이메일
	tel VARCHAR(20) NOT NULL,								-- 회원 전화번호
	addr1 VARCHAR(200),										-- 회원 주소
	addr2 VARCHAR(100),										-- 회원 상세 주소
	postcode VARCHAR(10),									-- 회원 우편 번호
	regDate DATETIME DEFAULT CURRENT_TIMESTAMP(),	-- 회원 등록일
	birth DATE,													-- 회원 생일
	pt INT DEFAULT 0,											-- 회원 포인트
	visited INT DEFAULT 0,									-- 회원 방문수
	useYn BOOLEAN DEFAULT TRUE,							-- 회원 사용 여부
	grade INT DEFAULT 2										-- 회원 등급 [ 0 : 관리자, 1 : 선생님, 2 : 일반사용자]
);

INSERT INTO MEMBER VALUES(DEFAULT, 'admin', '$2a$10$oS1.3wpbnpIanIW4RoXxSOea/vGIijBMpLUBxZqurQqNjjMiJHgGa', '관리자', 'admin@haebeop.ed.kr', '010-2121-2121', '', '', '', DEFAULT, NULL, DEFAULT, DEFAULT, DEFAULT, 0);

CREATE TABLE memberMgn(
	mmNo INT AUTO_INCREMENT PRIMARY KEY,				-- 회원 등급 요청 번호 : 자동 발생
	author VARCHAR(20) NOT NULL,							-- 회원 아이디
	approveYn BOOLEAN DEFAULT FALSE,						-- 회원 등급 승인 여부
	mStatus INT DEFAULT 0,									-- 회원 상태 [0 : 미신청, 1 : 승인 대기, 2 : 승인 취소, 3 : 승인 완료]
	content VARCHAR(2000)									-- 등급 승인 거절 사유
);

CREATE VIEW memberMgnList AS (SELECT mm.mmNo AS mmNo, mm.author AS author,  mm.approveYn AS approveYn, mm.content AS content, m.nm AS nm FROM memberMgn mm, member m WHERE mm.author = m.id order BY mm.mmNo ASC);

CREATE TABLE boardMgn(
	bmNo INT AUTO_INCREMENT PRIMARY KEY,	-- 게시판 번호 : 자동 발생
	boardType INT NOT NULL DEFAULT 0,		-- 게시판 형태 [ 0 : 게시판, 1 : 문의하기]
	boardNm VARCHAR(100) NOT NULL,			-- 게시판 이름
	depth INT NOT NULL,							-- 게시판 차수 [ 1 : 메인, 2 : 서브]
	par INT,											-- 2차 게시판 담당 강의 번호
	parNm VARCHAR(200),							-- 2차 게시판 담당 강의 이름
	aboutAuth INT NOT NULL,						-- 게시판 글쓰기, 수정, 삭제 관련 권한 (일반사용자 기본)
	commentUse BOOLEAN DEFAULT FALSE,		-- 게시판 댓글 사용 유무
	fileUse BOOLEAN DEFAULT FALSE				-- 게시판 파일 사용 유무
);

CREATE TABLE board(
	bno INT PRIMARY KEY AUTO_INCREMENT,   							-- 게시글 번호 : 자동 발생
	bmNo INT NOT NULL,   												-- 게시판 타입 
	title VARCHAR(200) NOT NULL,   									-- 게시글 제목
	content VARCHAR(1000),   											-- 게시글 내용
	author VARCHAR(20) NOT NULL,   									-- 작성자
	resDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   	-- 등록일
	answer VARCHAR(1000),												-- 묻고답하기 답변
	answerDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,				-- 묻고답하기 일자
	answerYn BOOLEAN DEFAULT FALSE, 									-- 답변 유무
	visited INT DEFAULT 0   											-- 조회수
);

CREATE VIEW boardList AS (SELECT b.bno AS bno, b.bmNo AS bmNo, b.title AS title, b.content AS content, b.author AS author, b.resDate AS resDate, b.answer AS answer, b.answerDate AS answerDate, b.answerYn AS answerYn, b.visited as visited, bm.boardType as boardType, bm.boardNm AS boardNm, m.nm AS nm, bm.aboutAuth AS aboutAuth, bm.commentUse AS commentUse, bm.fileUse AS fileUse FROM board b, member m, boardMgn bm WHERE b.author = m.id AND bm.bmNo = b.bmNo order BY b.bno ASC);

CREATE TABLE comment(
   cno INT PRIMARY KEY AUTO_INCREMENT,   							-- 댓글번호: 자동발생
	author VARCHAR(20) NOT NULL,   									-- 댓글 작성자
	content VARCHAR(1000) NOT NULL,   								-- 댓글 내용
	resDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   	-- 댓글 등록일
	par INT NOT NULL   													-- 해당 게시글 번호
);

CREATE VIEW commentList AS (SELECT c.cno AS cno, c.author AS author, c.content AS content, c.resDate AS resDate, c.par AS par, m.nm AS nm FROM comment c, member m WHERE c.author = m.id order BY c.cno ASC);

CREATE TABLE files(
	fno INT PRIMARY KEY AUTO_INCREMENT,   							-- 파일번호: 자동발생
	par INT NOT NULL,   													-- 해당 게시글 번호
	saveFolder VARCHAR(1000) NOT NULL,								-- 파일 저장 폴더
	originNm VARCHAR(500) NOT NULL,									-- 파일 원래 이름
	saveNm VARCHAR(500) NOT NULL,										-- 파일 저장 이름
	fileType VARCHAR(100) NOT NULL,									-- 파일 확장자
	uploadDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	-- 파일 업로드 일자
	toUse VARCHAR(100) NOT NULL										-- 사용 테이블
);
-- 여기까지는 완료

-- ========================= 슬비시작(내가 헷갈려서 썼어 지워도돼ㅠ_ㅠ) ================================
-- 강의, 과목, 목차, 수강후기, 수강

USE team44;

CREATE TABLE lecture(
	lno INT AUTO_INCREMENT PRIMARY KEY,			-- 강의 번호 : 자동증가
	title VARCHAR(150) NOT NULL,					-- 강의 제목
	subTitle VARCHAR(500) NOT NULL,				-- 강의 소제목
	content VARCHAR(2000) NOT NULL,				-- 강의 내용
	lectureType INT NOT NULL,						-- 강의 타입 [ 온라인 : 0, 오프라인 : 1 ]
	studentCnt INT NOT NULL, 						-- 강의 수강 인원
	startDate TIMESTAMP,								-- 강의 시작 기간 - 오프라인 사용
	endDate TIMESTAMP,								-- 강의 종료 기간 - 오프라인 사용
	daily VARCHAR(200),								-- 강의 하루 일정 - 오프라인 사용
	teacherId VARCHAR(20) NOT NULL,				-- 강의 담당 선생 아이디
	teacherNm VARCHAR(20),
	thumbnail VARCHAR(100),                	-- 강의 썸네일
       lvideo VARCHAR(100)  ,    						-- 샘플영상
       sno INT NOT NULL, 								-- 과목
       cost INT NOT NULL, 								-- 강의가격
       bookname VARCHAR(150),							-- 교재명
       bthumbnail VARCHAR(100)    					-- 교재 썸네일
);

insert into lecture(lno, title, subTitle, content, lectureType, studentCnt, teacherId, teacherNm, sno, cost) value(default, '강의 제목 1번', '강의 소제목 1번', '강의 내용 1번', 0, 20, 'qeee', '선생님 이름', 1, 50000);

SELECT * FROM lecture;


CREATE TABLE subject(
   sno INT PRIMARY KEY AUTO_INCREMENT,	-- 과목번호
   title VARCHAR(200) NOT NULL			-- 과목명
);

SELECT * FROM member;

INSERT INTO subject VALUES (1, "영어");
INSERT INTO subject VALUES (2, "수학");
INSERT INTO subject VALUES (3, "기타");

CREATE TABLE curri(
	cno INT PRIMARY KEY AUTO_INCREMENT,	-- 목차번호
	lno INT NOT NULL, 						-- 강의 번호
	content VARCHAR(100) NOT NULL   		-- 목차제목
);

CREATE TABLE review(
	rno INT PRIMARY KEY AUTO_INCREMENT, 						-- 후기 번호
	lno INT NOT NULL, 												-- 강의 번호
	memId VARCHAR(16) NOT NULL, 									-- 회원 아이디
	content VARCHAR(1000), 											-- 후기 내용
	star INT DEFAULT 5, 												-- 별점
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP	-- 후기 작성일
);

CREATE TABLE study(
	sno INT AUTO_INCREMENT PRIMARY KEY,	-- 수강 번호 : 자동증가
	lno INT NOT NULL,							-- 수강 강의 번호
	studentId VARCHAR(20) NOT NULL,		-- 수강생 아이디
	studyYn BOOLEAN DEFAULT FALSE,		-- 수강 진행 여부(수강중:0, 수강완료유저:1)
	canYn BOOLEAN DEFAULT FALSE			-- 수강 가능 여부(미수강:0, 결제완료유저:1)
);

-- ============================ 슬비끝  ===================================

CREATE TABLE payment(
    payno INT AUTO_INCREMENT PRIMARY KEY,		    -- 결제 번호 : 자동증가
    id VARCHAR(20) NOT NULL,                        -- 회원 아이디
    pno int default 0,                              -- 강의 공유번호
    plec VARCHAR(100) NOT NULL,                     -- 강의 이름
    tecid VARCHAR(100) NOT NULL,                    -- 선생님 아이디
    tecnm VARCHAR(100) NOT NULL,                    -- 선생님 이름
    booknm VARCHAR(100),                            -- 책 교재명
    pmethod VARCHAR(10),                            -- 결제 방법 - [1:신용카드 | 2:체크카드 | 3:계좌이체]
    pcom VARCHAR(100),                              -- 결제 대행사
    pnum VARCHAR(100),                              -- 결제카드(계좌)번호
    price INT DEFAULT 1000,                         -- 결제 금액
    amount INT DEFAULT 1,                           -- 결제 수량
    status INT DEFAULT 0,                           -- 배송상태 - [0:결제완료 | 1:결제완료 | 2:결제취소]
    resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP()   -- 결제 등록일
);
-- ============================ 교진끝  ===================================

