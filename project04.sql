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

INSERT INTO MEMBER VALUES(DEFAULT, 'admin', '$2a$10$HwmRQwO14K/q/8/PeqWrXepqcA9PGnOvhy2uINmX8xi418.JlAvMW', '관리자', 'admin@haebeop.ed.kr', '010-2121-2121', '', '', '', DEFAULT, NULL, DEFAULT, DEFAULT, DEFAULT, 0);

CREATE TABLE memberMgn(
	mmNo INT AUTO_INCREMENT PRIMARY KEY,				-- 회원 등급 요청 번호 : 자동 발생
	author VARCHAR(20) NOT NULL,							-- 회원 아이디
	approveYn BOOLEAN DEFAULT FALSE,						-- 회원 등급 승인 여부
	content VARCHAR(2000)									-- 등급 승인 거절 사유
);

CREATE VIEW memberMgnList AS (SELECT mm.mmNo AS mmNo, mm.author AS author,  mm.approveYn AS approveYn, mm.content AS content, m.nm AS nm FROM memberMgn mm, member m WHERE mm.author = m.id order BY mm.mmNo ASC);

CREATE TABLE boardMgn(
	bmNo INT AUTO_INCREMENT PRIMARY KEY,	-- 게시판 번호 : 자동 발생
	boardNm VARCHAR(100) NOT NULL,			-- 게시판 이름
	aboutAuth INT NOT NULL,						-- 게시판 글쓰기, 수정, 삭제 관련 권한 (일반사용자 기본)
	commentUse BOOLEAN DEFAULT FALSE,		-- 게시판 댓글 사용 유무
	fileUse BOOLEAN DEFAULT FALSE				-- 게시판 파일 사용 유무
);

CREATE TABLE board(
	bno INT PRIMARY KEY AUTO_INCREMENT,   							-- 게시글 번호 : 자동 발생
	bmNo INT NOT NULL,   												-- 게시글 타입 
	title VARCHAR(200) NOT NULL,   									-- 게시글 제목
	content VARCHAR(1000),   											-- 게시글 내용
	author VARCHAR(20) NOT NULL,   									-- 작성자
	resDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   	-- 등록일
	visited INT DEFAULT 0   											-- 조회수
);

CREATE VIEW boardList AS (SELECT b.bno AS bno, b.bmNo AS bmNo, b.title AS title, b.content AS content, b.author AS author, b.resDate AS resDate, b.visited as visited,bm.boardNm AS boardNm, m.nm AS nm, bm.aboutAuth AS aboutAuth, bm.commentUse AS commentUse, bm.fileUse AS fileUse FROM board b, member m, boardMgn bm WHERE b.author = m.id AND bm.bmNo = b.bmNo order BY b.bno ASC);

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

CREATE TABLE qna(
	qno INT PRIMARY KEY AUTO_INCREMENT,   					-- 문의번호 : 자동발생
	title VARCHAR(100) NOT NULL,   							-- 문의 제목
	content VARCHAR(1000) NOT NULL,   						-- 문의 내용
	answer VARCHAR(1000),   									-- 답변 내용
	author VARCHAR(20) NOT NULL,   							-- 문의 작성자
	resDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),   	-- 문의 등록일자
	answerDate TIMESTAMP,   									-- 답변 등록일자
	answerYn BOOLEAN DEFAULT FALSE 							-- 질문(0), 답변(1)
);

CREATE VIEW qnaList AS (SELECT q.qno AS qno, q.title AS title, q.content AS content, q.answer AS answer, q.author AS author, q.resDate AS resDate, q.answerDate AS answerDate, q.answerYn AS answerYn, m.nm AS nm FROM qna q, member m WHERE q.author = m.id order BY q.qno ASC);

CREATE TABLE review(
    rno INT PRIMARY KEY AUTO_INCREMENT,             	-- 리뷰 번호 : 자동증가
    par INT NOT NULL,											-- 해당 리뷰사용 번호
    author VARCHAR(20) NOT NULL,                    	-- 회원 아이디
    content VARCHAR(1000) NOT NULL,                  	-- 리뷰 내역
    star INT DEFAULT 5,                        			-- 리뷰 별점
    resDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP()     -- 리뷰 등록일
);

CREATE VIEW reviewList AS (SELECT r.rno AS rno, r.par AS par, r.author AS author, r.content AS content, r.star AS star, r.resDate AS resDate, m.nm AS nm FROM review r, member m WHERE r.author = m.id order BY r.rno ASC);

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
	prono INT,											-- 강의 서적
	teacherId VARCHAR(20) NOT NULL,				-- 강의 담당 선생 아이디
   thumbnail INT,                				-- 강의 섬네일 fno 입력
   useYn BOOLEAN DEFAULT TRUE                -- 판매 여부
);

CREATE VIEW lectureView AS (SELECT l.lno AS lno, l.title AS title, l.subTitle AS subTitle, l.content AS content, l.lectureType AS lectureType, l.studentCnt AS studentCnt,
l.startDate AS startDate, l.endDate AS endDate, l.daily AS daily, l.prono AS prono, l.teacherId AS teacherId, l.thumbnail AS thumbnail, l.useYn AS useYn,
m.nm AS nm FROM lecture l, member m WHERE l.teacherId = m.id order BY l.lno ASC);

CREATE TABLE lectureList(
	llno INT AUTO_INCREMENT PRIMARY KEY,		-- 온라인 강의 번호 : 자동증가
	lno INT NOT NULL,									-- 해당 강의 번호
	title VARCHAR(150) NOT NULL,					-- 온라인 강의 이름
	totalTIme INT NOT NULL,							-- 총 강의 시간
	studyYn BOOLEAN DEFAULT FALSE					-- 강의 완료 여부
);

CREATE TABLE study(
	sno INT AUTO_INCREMENT PRIMARY KEY,			-- 수강 번호 : 자동증가
	lno INT NOT NULL,									-- 수강 강의 번호
	studentId VARCHAR(20) NOT NULL,				-- 수강생 아이디
	studyYn BOOLEAN DEFAULT FALSE,				-- 수강 진행 여부
	totalTime INT NOT NULL,							-- 총 수강 시간
	canYn BOOLEAN DEFAULT FALSE					-- 수강 가능 여부
);

CREATE TABLE product(
   prono INT AUTO_INCREMENT PRIMARY KEY,					-- 도서 번호 : 자동증가
   proNm VARCHAR(100) NOT NULL,                 		-- 도서 이름
   proPrice INT DEFAULT 1000,               				-- 상품 가격
   proComment VARCHAR(2000) NOT NULL,						-- 상품 설명
   proList VARCHAR(2000),                            	-- 상품 목차
   thumbnail INT,                							-- 상품 섬네일 fno 입력
   useyn BOOLEAN DEFAULT TRUE,                    		-- 판매 여부
   resDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP()		-- 상품 등록일
);

CREATE TABLE receive(
   rno INT AUTO_INCREMENT PRIMARY KEY,					-- 입고 번호 : 자동증가
   prono INT NOT NULL,                       		-- 상품 번호
   amount INT DEFAULT 1,                     		-- 입고 갯수
   rPrice INT DEFAULT 1000,                  		-- 입고 가격
   resDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP()   -- 입고일
);

CREATE TABLE serve(
   sno INT AUTO_INCREMENT PRIMARY KEY,					-- 출고 번호 : 자동증가
   prono INT NOT NULL,                       		-- 상품 번호
   amount INT DEFAULT 1,                     		-- 출고 갯수
   sPrice INT DEFAULT 1000,                  		-- 출고 가격
   resDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP()   -- 출고일
);

CREATE VIEW serveProfit AS (SELECT prono, sum(sPrice * amount) AS tot FROM serve GROUP BY prono);
CREATE VIEW receiveProfit AS (SELECT prono, sum(rPrice * amount) AS tot FROM receive GROUP BY prono);
CREATE VIEW profit AS (SELECT a.prono AS prono, sum(a.tot - b.tot) AS tot FROM serveProfit a, receiveProfit b WHERE a.prono = b.prono GROUP BY a.prono);

CREATE VIEW serveInventory AS (SELECT prono, sum(amount) AS amount FROM serve GROUP BY prono);
CREATE VIEW receiveInventory AS (SELECT prono, sum(amount) AS amount FROM receive GROUP BY prono);
CREATE VIEW inventory AS (SELECT a.prono AS prono, (a.amount - b.amount) AS amount FROM receiveInventory a, serveInventory b WHERE a.prono = b.prono);

CREATE TABLE delivery(
	dno INT AUTO_INCREMENT PRIMARY KEY,						-- 배송 번호 : 자동증가
   cusNm VARCHAR(300) NOT NULL,                      	-- 배송 고객 이름
   cusTel VARCHAR(13) NOT NULL,                       -- 배송 고객 연락처
	cusAddr VARCHAR(300) NOT NULL,                     -- 배송 고객 주소
   dTel VARCHAR(13),                                  -- 배송회사 전화번호
   dStatus INT DEFAULT 0,										-- 배송상태 - [0:배송전 | 1:배송중 | 2:도착 | 3:구매결정 | 4.구매취소]
	resDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),     -- 배송 등록일
   DeliveryDate TIMESTAMP,                            -- 배송 완료일
   dCode VARCHAR(30),                                 -- 화물코드
   author VARCHAR(20) NOT NULL                        -- 구매 고객 아이디
);

CREATE TABLE payment(
   payno INT AUTO_INCREMENT PRIMARY KEY,					-- 결제 번호 : 자동증가
   author VARCHAR(20) NOT NULL,        					-- 회원 아이디
   sno INT NOT NULL,												-- 수강 번호
   amount INT DEFAULT 1,           							-- 결제 수량
   pMethod VARCHAR(10),                					-- 결제 방법 - [1:신용카드 | 2:체크카드 | 3:계좌이체]
   pCom VARCHAR(100),                  					-- 결제 대행사
   pNum VARCHAR(100),                  					-- 결제카드(계좌)번호
   payPrice INT DEFAULT 1000,      							-- 결제 금액
   payStatus INT DEFAULT 0,           						-- 배송상태 - [0:결제완료 | 1:결제완료 | 2:결제취소]
   dno INT,							               			-- 배송 번호
   resDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP()     	-- 결제 등록일
);

CREATE VIEW studyPayList AS (SELECT pay.payno AS payno, pay.author AS author, pay.sno AS sno, pay.amount AS amount, pay.pMethod AS pMethod, pay.pCom AS pCom, pay.pNum AS pNum, pay.payPrice AS payPrice, pay.payStatus AS payStatus, l.title AS lectureTitle, f.saveFolder AS thumbnailSaveFolder, f.originNm AS thumbnailOriginNm, f.saveNm AS thumbnailSaveNm, deli.dno AS dno, deli.cusNm AS cusNm, deli.cusTel AS cusTel, deli.cusAddr AS cusAddr, deli.dTel AS dTel, deli.dStatus AS dStatus, deli.resDate AS resDate, deli.DeliveryDate AS DeliveryDate, deli.dCode AS dCode FROM payment pay, delivery deli, lecture l, study s, files f WHERE pay.sno = s.sno AND l.lno = s.lno AND l.thumbnail = f.fno AND pay.dno = deli.dno);