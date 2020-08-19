/* 회원 */
CREATE TABLE MEMBER (
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	PASSWORD VARCHAR2(20) NOT NULL, /* 비밀번호 */
	NAME VARCHAR2(20) NOT NULL, /* 이름 */
	TEL VARCHAR2(20) NOT NULL, /* 전화번호 */
	EMAIL VARCHAR2(40) NOT NULL, /* 이메일 */
	CONSTRAINT PK_MEMBER PRIMARY KEY(ID)
);

/* 회원 정보 */
CREATE TABLE MEMBER_INFO (
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	NICKNAME VARCHAR2(20), /* 닉네임 */
	GENDER VARCHAR2(6), /* 성별 */
	AGE NUMBER, /* 나이 */
	JOB VARCHAR2(20), /* 직업 */
	CONSTRAINT PK_MEMBER_INFO PRIMARY KEY(ID),
	CONSTRAINT FK_MEMBER_TO_MEMBER_INFO FOREIGN KEY(ID)
	REFERENCES MEMBER(ID) ON DELETE CASCADE
)

/* 회원 지역 */
CREATE TABLE MEMBER_LOC (
	ID VARCHAR2(20), /* 아이디 */
	LOCALE VARCHAR2(60), /* 지역 */
	JOB_LOCALE VARCHAR2(60), /* 직장 지역 */
	loc_flag NUMBER DEFAULT 0, /* 플래그 */
	CONSTRAINT FK_MEMBER_TO_MEMBER_LOC FOREIGN KEY (ID)
		REFERENCES MEMBER (ID) ON DELETE CASCADE
)

/* 온라인멤버 */
CREATE TABLE ONLINE_MEMBER (
	ID VARCHAR2(20), /* 아이디 */
	NICKNAME VARCHAR2(20), /* 닉네임 */
	LOGIN_DATE VARCHAR2(20) DEFAULT to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'), /* 로그인날짜 */
	LOGOUT_DATE VARCHAR2(20) DEFAULT to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'), /* 로그아웃날짜 */
	ONLINE_FLAG NUMBER DEFAULT 1, /* 온라인지표 */
	CONSTRAINT FK_MEMBER_TO_ONLINE_MEMBER FOREIGN KEY (ID)
	REFERENCES MEMBER (ID) ON DELETE CASCADE
);

/* 게시판 */
CREATE TABLE BOARD (
	COUNT NUMBER NOT NULL, /* 글번호 */
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	TITLE VARCHAR2(100) NOT NULL, /* 제목 */
	BODY VARCHAR2(500) NOT NULL, /* 내용 */
	VIEW_COUNT NUMBER DEFAULT 0, /* 조회수 */
	WRITE_DATE VARCHAR2(30) DEFAULT to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') NOT NULL, /* 작성일 */
	CONSTRAINT PK_BOARD PRIMARY KEY(COUNT,ID),
	CONSTRAINT FK_MEMBER_TO_BOARD FOREIGN KEY(ID)
		REFERENCES MEMBER (ID) ON DELETE CASCADE
)

/* 자유게시판 */
CREATE TABLE FREE_BOARD (
	COUNT NUMBER NOT NULL, /* 글번호 */
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	FB_FILE VARCHAR2(100), /* 파일 */
	FB_WEATHER VARCHAR2(20), /* 날씨정보 */
	CONSTRAINT PK_FREE_BOARD PRIMARY KEY(COUNT,ID),
	CONSTRAINT FK_BOARD_TO_FREE_BOARD FOREIGN KEY(COUNT,ID)
	REFERENCES BOARD(COUNT,ID) ON DELETE CASCADE
)

/* 사진 게시판 */
CREATE TABLE PHOTO_BOARD (
	COUNT NUMBER NOT NULL, /* 글번호 */
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	PB_FILE VARCHAR2(100), /* 사진 */
	PB_COUNT NUMBER DEFAULT 0, /* 추천수 */
	PB_WEATHER VARCHAR2(20), /* 날씨정보 */
	CONSTRAINT PK_PHOTO_BOARD PRIMARY KEY(COUNT,ID),
	CONSTRAINT FK_BOARD_TO_PHOTO_BOARD FOREIGN KEY(COUNT,ID)
	REFERENCES BOARD(COUNT,ID) ON DELETE CASCADE
)

/* 사진게시판추천 */
CREATE TABLE PHOTO_BOARD_LIKE (
	COUNT NUMBER NOT NULL, /* 글번호 */
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	CONSTRAINT PK_PHOTO_BOARD_LIKE PRIMARY KEY (COUNT,ID),
	CONSTRAINT FK_MEMBER_TO_LIKE FOREIGN KEY (ID)REFERENCES MEMBER (ID) ON DELETE CASCADE
);

/* 캘린더 */
CREATE TABLE CALENDAR (
	C_DATE VARCHAR2(30) NOT NULL, /* 날짜 */
	F_RANKED NUMBER, /* 랭킹 게시물 */
	S_RANKED NUMBER, /* 랭킹 게시물2 */
	T_RANKED NUMBER, /* 랭킹 게시물3 */
	C_WEATHER VARCHAR2(20), /* 날씨 정보 */
	CONSTRAINT PK_CALENDAR PRIMARY KEY(C_DATE)
);

/* 게시판로그 */
CREATE TABLE BOARD_LOG (
	COUNT NUMBER, /* 글번호 */
	ID VARCHAR2(20), /* 아이디 */
	UPDATE_DATE VARCHAR2(20), /* 갱신날짜 */
	TITLE VARCHAR2(100), /* 제목 */
	BODY VARCHAR2(500), /* 내용 */
	CONSTRAINT FK_BOARD_TO_BOARD_LOG FOREIGN KEY (COUNT,ID)
	REFERENCES BOARD (COUNT,ID) ON DELETE CASCADE
)

/* 게시판로그 트리거 */
CREATE OR REPLACE TRIGGER board_log
AFTER INSERT OR UPDATE ON BOARD
FOR EACH ROW
BEGIN
    INSERT INTO BOARD_LOG(count, id, update_date, title, body)
    VALUES(:NEW.count, :NEW.id, to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'), :NEW.title, :NEW.body);
END;
/

/* 게시판 글 번호 시퀀스*/
CREATE SEQUENCE BOARD_count_seq
INCREMENT BY 1
START WITH 1
NOCYCLE;

/* 자유게시판 글 작성 프로시저*/ --시퀀스 연속 사용을 위해
CREATE OR REPLACE PROCEDURE FREEBOARD_write_pr(
id IN varchar2, title IN varchar2, body IN varchar2, file IN varchar2, weather IN varchar2
)
IS
BEGIN

insert into board(count,id,title,body,view_count) values(BOARD_count_seq.NEXTVAL,id,title,body,0);
insert into free_board values(BOARD_count_seq.CURRVAL,id,file,weather);
commit;	

END;
/

/* 자유게시판 글 수정 프로시저*/
CREATE OR REPLACE PROCEDURE FREEBOARD_rewrite_pr(
id IN varchar2, mytitle IN varchar2, mybody IN varchar2, file IN varchar2, weather IN varchar2, mycount IN number
)
IS
BEGIN

update board set title = mytitle, body = mybody where count = mycount;
update free_board set fb_file = file, fb_weather = weather where count = mycount;
commit;	

END;
/

/* 포토게시판 글 작성 프로시저*/ --시퀀스 연속 사용을 위해
CREATE OR REPLACE PROCEDURE PHOTOBOARD_write_pr(
id IN varchar2, title IN varchar2, file IN varchar2, weather IN varchar2
)
IS
BEGIN

insert into board(count,id,title,body,view_count) values(BOARD_count_seq.NEXTVAL,id,title,title,0);
insert into photo_board values(BOARD_count_seq.CURRVAL,id,file,0,weather);
commit;	

END;
/

