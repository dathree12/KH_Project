
-- QnA ���� ���̺� ����
CREATE TABLE QnA_MEMBER (
    Que_Num NUMBER,
    User_Num NUMBER NOT NULL UNIQUE,
    Que_Title VARCHAR2(100) NOT NULL,
    Que_Content VARCHAR2(500) NOT NULL,
    Que_Date DATE DEFAULT SYSDATE,
    HIT NUMBER(4) DEFAULT 0,
    QGROUP NUMBER(4),
    STEP NUMBER(4),
    QINDENT NUMBER (4)
);

COMMENT ON COLUMN QnA_MEMBER.Que_Num IS '���ǹ�ȣ';
COMMENT ON COLUMN QnA_MEMBER.User_Num IS 'ȸ����ȣ';
COMMENT ON COLUMN QnA_MEMBER.Que_Title IS '��������';
COMMENT ON COLUMN QnA_MEMBER.Que_Content IS '���ǳ���';
COMMENT ON COLUMN QnA_MEMBER.Que_Date IS '���ǳ�¥';
COMMENT ON COLUMN QnA_MEMBER.HIT IS '��ȸ��';
COMMENT ON COLUMN QnA_MEMBER.QGROUP IS '�亯';
COMMENT ON COLUMN QnA_MEMBER.STEP IS 'N��° ������ ��';
COMMENT ON COLUMN QnA_MEMBER.QINDENT IS 'N�� �鿩������ ��';

CREATE SEQUENCE SEQ_QnA_MEMBER_NO;

SELECT *
FROM QNA_MEMBER;

SELECT Que_Num, User_Num, Que_Title, Que_Content, Que_Date, HIT, QGROUP, STEP, QINDENT
FROM QNA_MEMBER;

SELECT COUNT(*) FROM QNA_MEMBER;

-- INSERT INTO QNA_MEMBER VALUES(SEQ_QnA_MEMBER_NO.NEXTVAL, 2, '��������', '���ǳ���', DEFAULT, 2, 3, 4, 5);

INSERT INTO QNA_MEMBER VALUES(SEQ_QnA_MEMBER_NO.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, SEQ_QNA_MEMBER_NO.CURRVAL, ?, ?);

--INSERT INTO QNA_MEMBER VALUES(SEQ_QnA_MEMBER_NO.NEXTVAL, 2, '��������', '���ǳ���', DEFAULT, 2, SEQ_QNA_MEMBER_NO.CURRVAL, 0, 0);












-- UPDATE QnA_MEMBER SET Que_Title='����1212', Que_Content='����1212' WHERE USER_NUM=2;

UPDATE QnA_MEMBER SET Que_Title=?, Que_Content=? WHERE USER_NUM=?;

COMMIT;


















