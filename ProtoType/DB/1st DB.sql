/* ȸ�� */
CREATE TABLE MEMBER (
	ID VARCHAR2(20) NOT NULL, /* ���̵� */
	PASSWORD VARCHAR2(20) NOT NULL, /* ��й�ȣ */
	NAME VARCHAR2(20) NOT NULL, /* �̸� */
	TEL VARCHAR2(20) NOT NULL, /* ��ȭ��ȣ */
	EMAIL VARCHAR2(40) NOT NULL, /* �̸��� */
	CONSTRAINT PK_MEMBER PRIMARY KEY(ID)
);

/* ȸ�� ���� */
CREATE TABLE MEMBER_INFO (
	ID VARCHAR2(20) NOT NULL, /* ���̵� */
	NICKNAME VARCHAR2(20), /* �г��� */
	GENDER VARCHAR2(6), /* ���� */
	AGE NUMBER, /* ���� */
	JOB VARCHAR2(20), /* ���� */
	CONSTRAINT PK_MEMBER_INFO PRIMARY KEY(ID),
	CONSTRAINT FK_MEMBER_TO_MEMBER_INFO FOREIGN KEY(ID)
	REFERENCES MEMBER(ID) ON DELETE CASCADE
)

/* ȸ�� ���� */
CREATE TABLE MEMBER_LOC (
	ID VARCHAR2(20), /* ���̵� */
	LOCALE VARCHAR2(60), /* ���� */
	JOB_LOCALE VARCHAR2(60), /* ���� ���� */
	loc_flag NUMBER DEFAULT 0, /* �÷��� */
	CONSTRAINT FK_MEMBER_TO_MEMBER_LOC FOREIGN KEY (ID)
		REFERENCES MEMBER (ID) ON DELETE CASCADE
)

/* �¶��θ�� */
CREATE TABLE ONLINE_MEMBER (
	ID VARCHAR2(20), /* ���̵� */
	NICKNAME VARCHAR2(20), /* �г��� */
	LOGIN_DATE VARCHAR2(20) DEFAULT to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'), /* �α��γ�¥ */
	LOGOUT_DATE VARCHAR2(20) DEFAULT to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'), /* �α׾ƿ���¥ */
	ONLINE_FLAG NUMBER DEFAULT 1, /* �¶�����ǥ */
	CONSTRAINT FK_MEMBER_TO_ONLINE_MEMBER FOREIGN KEY (ID)
	REFERENCES MEMBER (ID) ON DELETE CASCADE
);

/* �Խ��� */
CREATE TABLE BOARD (
	COUNT NUMBER NOT NULL, /* �۹�ȣ */
	ID VARCHAR2(20) NOT NULL, /* ���̵� */
	TITLE VARCHAR2(100) NOT NULL, /* ���� */
	BODY VARCHAR2(500) NOT NULL, /* ���� */
	VIEW_COUNT NUMBER DEFAULT 0, /* ��ȸ�� */
	WRITE_DATE VARCHAR2(30) DEFAULT to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') NOT NULL, /* �ۼ��� */
	CONSTRAINT PK_BOARD PRIMARY KEY(COUNT,ID),
	CONSTRAINT FK_MEMBER_TO_BOARD FOREIGN KEY(ID)
		REFERENCES MEMBER (ID) ON DELETE CASCADE
)

/* �����Խ��� */
CREATE TABLE FREE_BOARD (
	COUNT NUMBER NOT NULL, /* �۹�ȣ */
	ID VARCHAR2(20) NOT NULL, /* ���̵� */
	FB_FILE VARCHAR2(100), /* ���� */
	FB_WEATHER VARCHAR2(20), /* �������� */
	CONSTRAINT PK_FREE_BOARD PRIMARY KEY(COUNT,ID),
	CONSTRAINT FK_BOARD_TO_FREE_BOARD FOREIGN KEY(COUNT,ID)
	REFERENCES BOARD(COUNT,ID) ON DELETE CASCADE
)

/* ���� �Խ��� */
CREATE TABLE PHOTO_BOARD (
	COUNT NUMBER NOT NULL, /* �۹�ȣ */
	ID VARCHAR2(20) NOT NULL, /* ���̵� */
	PB_FILE VARCHAR2(100), /* ���� */
	PB_COUNT NUMBER DEFAULT 0, /* ��õ�� */
	PB_WEATHER VARCHAR2(20), /* �������� */
	CONSTRAINT PK_PHOTO_BOARD PRIMARY KEY(COUNT,ID),
	CONSTRAINT FK_BOARD_TO_PHOTO_BOARD FOREIGN KEY(COUNT,ID)
	REFERENCES BOARD(COUNT,ID) ON DELETE CASCADE
)

/* �����Խ�����õ */
CREATE TABLE PHOTO_BOARD_LIKE (
	COUNT NUMBER NOT NULL, /* �۹�ȣ */
	ID VARCHAR2(20) NOT NULL, /* ���̵� */
	CONSTRAINT PK_PHOTO_BOARD_LIKE PRIMARY KEY (COUNT,ID),
	CONSTRAINT FK_MEMBER_TO_LIKE FOREIGN KEY (ID)REFERENCES MEMBER (ID) ON DELETE CASCADE
);

/* Ķ���� */
CREATE TABLE CALENDAR (
	C_DATE VARCHAR2(30) NOT NULL, /* ��¥ */
	F_RANKED NUMBER, /* ��ŷ �Խù� */
	S_RANKED NUMBER, /* ��ŷ �Խù�2 */
	T_RANKED NUMBER, /* ��ŷ �Խù�3 */
	C_WEATHER VARCHAR2(20), /* ���� ���� */
	CONSTRAINT PK_CALENDAR PRIMARY KEY(C_DATE)
);

/* �Խ��Ƿα� */
CREATE TABLE BOARD_LOG (
	COUNT NUMBER, /* �۹�ȣ */
	ID VARCHAR2(20), /* ���̵� */
	UPDATE_DATE VARCHAR2(20), /* ���ų�¥ */
	TITLE VARCHAR2(100), /* ���� */
	BODY VARCHAR2(500), /* ���� */
	CONSTRAINT FK_BOARD_TO_BOARD_LOG FOREIGN KEY (COUNT,ID)
	REFERENCES BOARD (COUNT,ID) ON DELETE CASCADE
)

/* �Խ��Ƿα� Ʈ���� */
CREATE OR REPLACE TRIGGER board_log
AFTER INSERT OR UPDATE ON BOARD
FOR EACH ROW
BEGIN
    INSERT INTO BOARD_LOG(count, id, update_date, title, body)
    VALUES(:NEW.count, :NEW.id, to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'), :NEW.title, :NEW.body);
END;
/

/* �Խ��� �� ��ȣ ������*/
CREATE SEQUENCE BOARD_count_seq
INCREMENT BY 1
START WITH 1
NOCYCLE;

/* �����Խ��� �� �ۼ� ���ν���*/ --������ ���� ����� ����
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

/* �����Խ��� �� ���� ���ν���*/
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

/* ����Խ��� �� �ۼ� ���ν���*/ --������ ���� ����� ����
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

