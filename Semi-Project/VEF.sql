----------------- MEMBER 테이블 -----------------

CREATE TABLE MEMBER (
    USER_NUM NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(30) NOT NULL UNIQUE,
    USER_PWD VARCHAR2(100) NOT NULL,
    USER_EMAIL VARCHAR2(100) NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE,
    VEG_TYPE VARCHAR2(30) NOT NULL,
    USER_ROLE VARCHAR2(10) DEFAULT 'ROLE_USER',
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN ('Y','N')),
    SALT VARCHAR2(256)
);

COMMENT ON COLUMN MEMBER.USER_NUM IS '회원번호';
COMMENT ON COLUMN MEMBER.USER_ID IS '아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '비밀번호';
COMMENT ON COLUMN MEMBER.USER_EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '가입일시';
COMMENT ON COLUMN MEMBER.VEG_TYPE IS '선호';
COMMENT ON COLUMN MEMBER.USER_ROLE IS '권한';
COMMENT ON COLUMN MEMBER.STATUS IS '상태';

CREATE SEQUENCE SEQ_USER_NUM;

INSERT INTO MEMBER VALUES(
SEQ_USER_NUM.NEXTVAL,
'admin',
'Zhinpmbw7t/qst0TgqsF+6a3W7xVH1kXvikP6H4/sDk=',
'1234@test.com',
SYSDATE,
'v1',
'ROLE_ADMIN',
DEFAULT,
'2b32f727aaf8cf17'
);

COMMIT;

----------------- BOARD 테이블 -----------------

CREATE TABLE BOARD (   
    "BOARD_NO" NUMBER,
   "BOARD_TITLE" VARCHAR2(50), 
   "BOARD_CONTENT" VARCHAR2(2000), 
   "BOARD_IMAGEF_FILE" VARCHAR2(100), 
    "BOARD_CREATE_DATE" DATE DEFAULT SYSDATE, 
    "BOARD_MODIFY_DATE" DATE DEFAULT SYSDATE,
    "VEGANLIST" VARCHAR2(50),
    "SITUATION" VARCHAR2(50),
    "BOARD_READCOUNT" NUMBER DEFAULT 0, 
    "STATUS" VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    "IMAGE_FILE1" VARCHAR(100), 
    "IMAGE_FILE2" VARCHAR(100), 
    "IMAGE_FILE3" VARCHAR(100), 
    "BOARD_WRITER_NO" NUMBER,
    "RECOMMEND" NUMBER DEFAULT 0,
    CONSTRAINT PK_BOARD_NO PRIMARY KEY(BOARD_NO),
    CONSTRAINT FK_BOARD_WRITER FOREIGN KEY(BOARD_WRITER_NO) REFERENCES MEMBER(USER_NUM) ON DELETE SET NULL
);

CREATE SEQUENCE SEQ_BOARD_NO;

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글번호';
COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글제목';
COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글내용';
COMMENT ON COLUMN "BOARD"."BOARD_IMAGEF_FILE" IS '이미지파일';
COMMENT ON COLUMN "BOARD"."BOARD_CREATE_DATE" IS '게시글올린날짜';
COMMENT ON COLUMN "BOARD"."BOARD_DATEMODIFY_DATE" IS '게시글수정날짜';
COMMENT ON COLUMN "BOARD"."VEGANLIST" IS '비건종류';
COMMENT ON COLUMN "BOARD"."SITUATION" IS '상황종류';
COMMENT ON COLUMN "BOARD"."BOARD_READCOUNT" IS '조회수';
COMMENT ON COLUMN "BOARD"."STATUS" IS '상태값(Y/N)';
COMMENT ON COLUMN "BOARD"."VEGANLIST" IS '비건종류';
COMMENT ON COLUMN "BOARD"."IMAGE_FILE1" IS '완성사진1';
COMMENT ON COLUMN "BOARD"."IMAGE_FILE2" IS '완성사진2';
COMMENT ON COLUMN "BOARD"."IMAGE_FILE3" IS '완성사진3';

CREATE TABLE REPLY(
  REPLY_NO NUMBER PRIMARY KEY,
  BOARD_NO NUMBER,
  REPLY_CONTENT VARCHAR2(400),
  REPLY_CREATE_DATE DATE,
  REPLY_WRITER_NO NUMBER,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
  FOREIGN KEY (REPLY_WRITER_NO) REFERENCES MEMBER,
  FOREIGN KEY (BOARD_NO) REFERENCES BOARD
);

CREATE SEQUENCE SEQ_REPLY_NO;

COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글번호';
COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '댓글이작성된게시글';
COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글내용';
COMMENT ON COLUMN "REPLY"."REPLY_CREATE_DATE" IS '댓글올린날짜';


COMMIT;

----------------- QnA 테이블 -----------------
CREATE TABLE QnA_MEMBER (
    Que_Num NUMBER,
    User_Num NUMBER NOT NULL,
    Que_Title VARCHAR2(100) NOT NULL,
    Que_Content VARCHAR2(2000) NOT NULL,
    Que_Date DATE DEFAULT SYSDATE,
    HIT NUMBER(4) DEFAULT 0,
    QGROUP NUMBER(4),
    STEP NUMBER(4),
    QINDENT NUMBER (4)
);

COMMENT ON COLUMN QnA_MEMBER.Que_Num IS '문의번호';
COMMENT ON COLUMN QnA_MEMBER.User_Num IS '회원번호';
COMMENT ON COLUMN QnA_MEMBER.Que_Title IS '문의제목';
COMMENT ON COLUMN QnA_MEMBER.Que_Content IS '문의내용';
COMMENT ON COLUMN QnA_MEMBER.Que_Date IS '문의날짜';
COMMENT ON COLUMN QnA_MEMBER.HIT IS '조회수';
COMMENT ON COLUMN QnA_MEMBER.QGROUP IS '그룹번호';
COMMENT ON COLUMN QnA_MEMBER.STEP IS 'N번째 떨어진 글';
COMMENT ON COLUMN QnA_MEMBER.QINDENT IS 'N번 들여쓰기한 글';

CREATE SEQUENCE SEQ_QnA_MEMBER_NO;

----------------- 공지사항 테이블 -----------------
CREATE TABLE NOTICE (
    NNUM NUMBER,
    User_Num NUMBER NOT NULL,
    NTITLE VARCHAR2(100) NOT NULL,
    NCONTENT VARCHAR2(2000) NOT NULL,
    NDATE DATE DEFAULT SYSDATE,
    NHIT NUMBER(4) DEFAULT 0
);

COMMENT ON COLUMN NOTICE.NNUM IS '공지번호';
COMMENT ON COLUMN NOTICE.User_Num IS '회원번호';
COMMENT ON COLUMN NOTICE.NTITLE IS '공지제목';
COMMENT ON COLUMN NOTICE.NCONTENT IS '공지내용';
COMMENT ON COLUMN NOTICE.NDATE IS '공지날짜';
COMMENT ON COLUMN NOTICE.NHIT IS '조회수';

CREATE SEQUENCE SEQ_NOTICE_NO;


























