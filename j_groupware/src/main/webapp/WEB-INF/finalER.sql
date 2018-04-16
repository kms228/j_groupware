
/* Drop Tables */

DROP TABLE ACADEMIC CASCADE CONSTRAINTS;
DROP TABLE ACCOUNT CASCADE CONSTRAINTS;
DROP TABLE ANNUAL CASCADE CONSTRAINTS;
DROP TABLE BOOKMARK CASCADE CONSTRAINTS;
DROP TABLE CAREER CASCADE CONSTRAINTS;
DROP TABLE HISTORY CASCADE CONSTRAINTS;
DROP TABLE REFERENCE CASCADE CONSTRAINTS;
DROP TABLE RETIRE CASCADE CONSTRAINTS;
DROP TABLE SC_FILE CASCADE CONSTRAINTS;
DROP TABLE SCHEDULE CASCADE CONSTRAINTS;
DROP TABLE SDOC_LINE CASCADE CONSTRAINTS;
DROP TABLE DOC_FILE CASCADE CONSTRAINTS;
DROP TABLE SIGN_DOC CASCADE CONSTRAINTS;
DROP TABLE WORK_FILE CASCADE CONSTRAINTS;
DROP TABLE WORK_LINE CASCADE CONSTRAINTS;
DROP TABLE WORK CASCADE CONSTRAINTS;
DROP TABLE WORKLIST CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE DEPT CASCADE CONSTRAINTS;
DROP TABLE DOC_TYPE CASCADE CONSTRAINTS;
DROP TABLE HALFTIME CASCADE CONSTRAINTS;
DROP TABLE MESSAGE CASCADE CONSTRAINTS;
DROP TABLE POSITION CASCADE CONSTRAINTS;
DROP TABLE TEAM CASCADE CONSTRAINTS;
DROP TABLE WORKTIME CASCADE CONSTRAINTS;
DROP TABLE WORK_TYPE CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_ACADEMIC;
DROP SEQUENCE SEQ_ACCOUNT;
DROP SEQUENCE SEQ_ANNUAL;
DROP SEQUENCE SEQ_BOOKMARK;
DROP SEQUENCE SEQ_CAREER;
DROP SEQUENCE SEQ_DEPT;
DROP SEQUENCE SEQ_DOC_FILE;
DROP SEQUENCE SEQ_DOC_FILE;
DROP SEQUENCE SEQ_DOC_TYPE;
DROP SEQUENCE SEQ_EMPLOYEE;
DROP SEQUENCE SEQ_HALFTIME;
DROP SEQUENCE SEQ_HALF_TIME;
DROP SEQUENCE SEQ_HISTORY;
DROP SEQUENCE SEQ_MESSAGE;
DROP SEQUENCE SEQ_OFFICE;
DROP SEQUENCE SEQ_POSITION;
DROP SEQUENCE SEQ_REFERENCE;
DROP SEQUENCE SEQ_RETIRE;
DROP SEQUENCE SEQ_SCHEDULE;
DROP SEQUENCE SEQ_SC_FILE;
DROP SEQUENCE SEQ_SDOC_LINE;
DROP SEQUENCE SEQ_SIGN_DOC;
DROP SEQUENCE SEQ_TEAM;
DROP SEQUENCE SEQ_WORKLIST;
DROP SEQUENCE SEQ_WORKTIME;
DROP SEQUENCE SEQ_WORK_FILE;
DROP SEQUENCE SEQ_WORK_TYPE;
DROP SEQUENCE SEQ_WORK;




/* Create Sequences */

CREATE SEQUENCE SEQ_ACADEMIC INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ACCOUNT INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ANNUAL INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_BOOKMARK INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_CAREER INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DEPT INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DOC_FILE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DOC_FILE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_DOC_TYPE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_EMPLOYEE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_HALFTIME INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_HALF_TIME INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_HISTORY INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MESSAGE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_OFFICE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_POSITION INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_REFERENCE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_RETIRE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SCHEDULE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SC_FILE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SDOC_LINE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_SIGN_DOC INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TEAM INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WORKLIST INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WORKTIME INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WORK_FILE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WORK_TYPE INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_WORK INCREMENT BY 1 START WITH 1;



/* Create Tables */

-- �з����̺�
CREATE TABLE ACADEMIC
(
	-- �з¹�ȣ : �з¹�ȣ
	ACD_NUM number(10) NOT NULL,
	-- ������ : ������
	ACD_GRADUATION date,
	-- �б��� : �б���
	ACD_NAME varchar2(30),
	-- ���� : ����
	ACD_MAJOR varchar2(20),
	-- ���� : ����
	ACD_SCORE number(10,1),
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	PRIMARY KEY (ACD_NUM)
);


-- �������̺�
CREATE TABLE ACCOUNT
(
	-- ������ȣ : ������ȣ
	ACNT_NUM number(10) NOT NULL,
	-- ���̵� : ���̵�
	ACNT_ID varchar2(20) NOT NULL,
	-- ��й�ȣ : ��й�ȣ
	ACNT_PWD varchar2(20) NOT NULL,
	-- ���ѷ��� : ���ѷ���
	ACNT_LEVEL number(10) DEFAULT 1 NOT NULL,
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	PRIMARY KEY (ACNT_NUM)
);


-- ������Ȳ���̺�
CREATE TABLE ANNUAL
(
	-- ������ȣ : ������ȣ
	ANN_NUM number(10) NOT NULL,
	-- ��ü�������� : ��ü��������
	ANN_TOTAL number(10,1),
	-- ��뿬������ : ��뿬������
	ANN_USE number(10,1),
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	PRIMARY KEY (ANN_NUM)
);


-- ����������ã�����̺�
CREATE TABLE BOOKMARK
(
	-- �ϸ�ũ��ȣ : �ϸ�ũ��ȣ
	BKM_NUM number(10) NOT NULL,
	-- ������� : �������
	BKM_LEVEL number(10),
	-- �ϸ�ũ�̸� : �ϸ�ũ�̸�
	BKM_NAME varchar2(20) NOT NULL,
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	PRIMARY KEY (BKM_NUM)
);


-- ������̺�
CREATE TABLE CAREER
(
	-- ��¹�ȣ : ��¹�ȣ
	CRR_NUM number(10) NOT NULL,
	-- �Ի��� : �Ի���
	CRR_SDATE date,
	-- ����� : �����
	CRR_EDATE date,
	-- ����� : �����
	CRR_NAME varchar2(20),
	-- �μ��� : �μ���
	CRR_DEPT varchar2(20),
	-- ���� : ����
	CRR_POSITION varchar2(15),
	-- ������ : ������
	CRR_WORK varchar2(30),
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	PRIMARY KEY (CRR_NUM)
);


-- �μ����̺�
CREATE TABLE DEPT
(
	-- �μ���ȣ : �μ���ȣ
	DEPT_NUM number(10) NOT NULL,
	-- �μ��� : �μ���
	DEPT_NAME varchar2(20),
	PRIMARY KEY (DEPT_NUM)
);


-- ���繮���������̺�
CREATE TABLE DOC_FILE
(
	-- �������Ϲ�ȣ : �������Ϲ�ȣ
	SFILE_NUM number(10) NOT NULL,
	-- ������������� : �������������
	SFILE_SAVEFILENAME varchar2(30),
	-- �����������ϸ� : �����������ϸ�
	SFILE_ORGFILENAME varchar2(30),
	-- ��������ũ�� : ��������ũ��
	SFILE_SIZE long,
	-- ���繮����ȣ : ���繮����ȣ
	SDOC_NUM number(10) NOT NULL,
	PRIMARY KEY (SFILE_NUM)
);


-- ���繮���������̺�
CREATE TABLE DOC_TYPE
(
	-- ���繮����ȣ : ���繮����ȣ
	DOC_NUM number(10) NOT NULL,
	-- ���繮���̸� : ���繮���̸�(��ȼ�,���ּ�,��������...)
	DOC_NAME varchar2(30),
	PRIMARY KEY (DOC_NUM)
);


-- ��������������̺�
CREATE TABLE EMPLOYEE
(
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	-- ����̸� : ����̸�
	EMP_NAME varchar2(15) NOT NULL,
	-- �����ȭ��ȣ : �����ȭ��ȣ
	EMP_PHONE varchar2(15),
	-- ����ּ� : ����ּ�
	EMP_ADDR varchar2(60),
	-- ���������� : ����������
	EMP_BIRTH number(10),
	-- ����̸��� : ����̸���
	EMP_EMAIL varchar2(30) UNIQUE,
	-- ����Ի��� : ����Ի���
	EMP_HIREDATE date NOT NULL,
	-- ������� : �������
	EMP_GENDER varchar2(10),
	-- ������ȣ : ������ȣ
	PST_NUM number(10) NOT NULL,
	-- �μ���ȣ : �μ���ȣ
	DEPT_NUM number(10) NOT NULL,
	-- ����ȣ : ����ȣ
	TEAM_NUM number(10) NOT NULL,
	PRIMARY KEY (EMP_NUM)
);


-- �����������̺�
CREATE TABLE HALFTIME
(
	-- �����ð�������ȣ
	HTIME_NUM number(10) NOT NULL,
	-- �������� : 0.����
	-- 1.����
	HTIME_TYPE number(5) NOT NULL,
	-- ���۽ð�
	HTIME_START date NOT NULL,
	-- ���ð�
	HTIME_END date NOT NULL,
	PRIMARY KEY (HTIME_NUM)
);


-- �ٹ��̷����̺�
CREATE TABLE HISTORY
(
	-- �ٹ��̷¹�ȣ : �ٹ��̷¹�ȣ
	HIS_NUM number(10) NOT NULL,
	-- ��¥ : ��¥
	HIS_DATE date,
	-- �ٹ��μ� : �ٹ��μ�
	HIS_DEPT varchar2(20),
	-- ���� : ����
	HIS_POSITION varchar2(15),
	-- ������ : ������
	HIS_WORK varchar2(20),
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	PRIMARY KEY (HIS_NUM)
);


-- �������̺�
CREATE TABLE MESSAGE
(
	-- ������ȣ : ������ȣ
	MSG_NUM number(10) NOT NULL,
	-- �޴»�����̵� : �޴»�����̵�
	MSG_RECNAME varchar2(10),
	-- ������� : �������
	MSG_SENDNAME varchar2(30),
	-- �������� : ��������
	MSG_CONTENT varchar2(100),
	-- �ۼ��� : �ۼ���
	MSG_REGDATE date,
	-- ���� ���ſ��� ���� : 0.������
	-- 1.����
	MSG_TYPE number(5),
	PRIMARY KEY (MSG_NUM)
);


-- �������̺�
CREATE TABLE POSITION
(
	-- ������ȣ : ������ȣ
	PST_NUM number(10) NOT NULL,
	-- ������ : ������
	PST_NAME varchar2(20),
	PRIMARY KEY (PST_NUM)
);


-- �����������̺�
CREATE TABLE REFERENCE
(
	-- ������ȣ : ������ȣ
	REF_NUM number(10) NOT NULL,
	-- ���繮����ȣ : ���繮����ȣ
	SDOC_NUM number(10) NOT NULL,
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	PRIMARY KEY (REF_NUM)
);


-- ���������̺�
CREATE TABLE RETIRE
(
	-- �����ڹ�ȣ : �����ڹ�ȣ
	RE_NUM number(10) NOT NULL,
	-- ������
	RE_DATE date NOT NULL,
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	PRIMARY KEY (RE_NUM)
);


-- �������̺�
CREATE TABLE SCHEDULE
(
	-- ������ȣ : ������ȣ
	SCH_NUM number(10) NOT NULL,
	-- �����̸� : �����̸�
	SCH_TITLE varchar2(30) NOT NULL,
	-- �������� : ��������
	SCH_CONTENT varchar2(100),
	-- ������ : ������
	SCH_SDATE date,
	-- ������ : ������
	SCH_EDATE date,
	-- ������� : �������
	SCH_PLACE varchar2(20),
	-- �������� : ��������
	SCH_PUBLIC number(10),
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	PRIMARY KEY (SCH_NUM)
);


-- �����������̺�
CREATE TABLE SC_FILE
(
	-- �������Ϲ�ȣ : �������Ϲ�ȣ
	SF_NUM number(10) NOT NULL,
	-- ������������� : �������������
	SF_SAVEFILENAME varchar2(30),
	-- �����������ϸ� : �����������ϸ�
	SF_ORGFILENAME varchar2(30),
	-- ��������ũ�� : ��������ũ��
	SF_SIZE long,
	-- ������ȣ : ������ȣ
	SCH_NUM number(10) NOT NULL,
	PRIMARY KEY (SF_NUM)
);


-- ����������̺�
CREATE TABLE SDOC_LINE
(
	-- ������ι�ȣ : ������ι�ȣ
	SLINE_NUM number(10) NOT NULL,
	-- ������� : �������
	SLINE_LEVEL number(10),
	-- ������� : �������
	SLINE_STATE number(10),
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	-- ���繮����ȣ : ���繮����ȣ
	SDOC_NUM number(10) NOT NULL,
	PRIMARY KEY (SLINE_NUM)
);


-- ���繮�����̺�
CREATE TABLE SIGN_DOC
(
	-- ���繮����ȣ : ���繮����ȣ
	SDOC_NUM number(10) NOT NULL,
	-- ����������� : �����������
	SDOC_STATE number(10) DEFAULT 1 NOT NULL,
	-- ���繮������ : ���繮������
	SDOC_TITLE varchar2(30),
	-- ���繮������ : ���繮������
	SDOC_CONTENT clob,
	-- ���繮�� �ۼ���
	SDOC_DATE date,
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	-- ���繮����ȣ : ���繮����ȣ
	DOC_NUM number(10) NOT NULL,
	PRIMARY KEY (SDOC_NUM)
);


-- ���������̺�
CREATE TABLE TEAM
(
	-- ����ȣ : ����ȣ
	TEAM_NUM number(10) NOT NULL,
	-- ���̸� : ���̸�
	TEAM_NAME varchar2(20),
	PRIMARY KEY (TEAM_NUM)
);


-- ������û��Ȳ���̺�
CREATE TABLE WORK
(
	-- ������û��ȣ : ������û��ȣ
	WORK_NUM number(10) NOT NULL,
	-- ������ : ������
	WORK_SDATE date,
	-- ������ : ������
	WORK_EDATE date,
	-- �������� : ��������
	WORK_CONTENT varchar2(100),
	-- ����� : �����
	WORK_REGDATE date NOT NULL,
	-- �������λ��� : �������λ���
	WORK_STATE number(10) DEFAULT 1 NOT NULL,
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	-- �������й�ȣ : �������й�ȣ
	WTYPE_NUM number(10) NOT NULL,
	PRIMARY KEY (WORK_NUM)
);


-- ����ٳ���
CREATE TABLE WORKLIST
(
	-- ����ٳ�����ȣ : ����ٳ�����ȣ
	WLIST_NUM number(10) NOT NULL,
	-- ��ٽð� : ��ٽð�
	WLIST_START date,
	-- ��ٽð� : ��ٽð�
	WLIST_END date,
	-- ������߽ð� : ������߽ð�
	WLIST_GO date,
	-- ���⺹�ͽð� : ���⺹�ͽð�
	WLIST_BACK date,
	-- ����ٻ���(�������) : 0.���
	-- 1.���
	-- 2.����
	-- 3.����
	-- 4.����
	-- 5.����
	WLIST_TYPE number(5),
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	PRIMARY KEY (WLIST_NUM)
);


-- ������������̺�
CREATE TABLE WORKTIME
(
	-- �����������ȣ : �����������ȣ
	WTIME_NUM number(10) NOT NULL,
	-- ��ٽð����� : ��ٽð�����
	WTIME_START date,
	-- ��ٽð����� : ��ٽð�����
	WTIME_END date,
	PRIMARY KEY (WTIME_NUM)
);


-- �����������̺�
CREATE TABLE WORK_FILE
(
	-- ���¹������Ϲ�ȣ : ���繮�����Ϲ�ȣ
	WFILE_NUM number(10) NOT NULL,
	-- ���¹��� ��������� : ���繮�� ���������
	WFILE_SAVEFILENAME varchar2(30),
	-- ���¹��� �������ϸ� : ���繮�� �������ϸ�
	WFILE_ORGFILENAME varchar2(30),
	-- ���¹��� ����ũ�� : ���繮�� ����ũ��
	WFILE_SIZE long,
	-- ������û��ȣ : ������û��ȣ
	WORK_NUM number(10) NOT NULL,
	PRIMARY KEY (WFILE_NUM)
);


-- ���¶������̺�
CREATE TABLE WORK_LINE
(
	-- ���¶��ι�ȣ : ������ι�ȣ
	WLINE_NUM number(10) NOT NULL,
	-- ���°������ : �������
	WLINE_LEVEL number(10),
	-- ������� : �������
	-- 0�� �ݷ�
	-- 1�� ����
	WLINE_STATE number(10),
	-- ������û��ȣ : ������û��ȣ
	WORK_NUM number(10) NOT NULL,
	-- �����ȣ : �����ȣ
	EMP_NUM number(10) NOT NULL UNIQUE,
	PRIMARY KEY (WLINE_NUM)
);


-- �����������̺�
CREATE TABLE WORK_TYPE
(
	-- �������й�ȣ : �������й�ȣ
	WTYPE_NUM number(10) NOT NULL,
	-- �������и� : �������и�
	WTYPE_NAME varchar2(15) NOT NULL,
	PRIMARY KEY (WTYPE_NUM)
);



/* Create Foreign Keys */

ALTER TABLE EMPLOYEE
	ADD FOREIGN KEY (DEPT_NUM)
	REFERENCES DEPT (DEPT_NUM)
;


ALTER TABLE SIGN_DOC
	ADD FOREIGN KEY (DOC_NUM)
	REFERENCES DOC_TYPE (DOC_NUM)
;


ALTER TABLE ACADEMIC
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE ACCOUNT
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE ANNUAL
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE BOOKMARK
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE CAREER
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE HISTORY
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE REFERENCE
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE RETIRE
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE SCHEDULE
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE SDOC_LINE
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE SIGN_DOC
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE WORK
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE WORKLIST
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE WORK_LINE
	ADD FOREIGN KEY (EMP_NUM)
	REFERENCES EMPLOYEE (EMP_NUM)
;


ALTER TABLE EMPLOYEE
	ADD FOREIGN KEY (PST_NUM)
	REFERENCES POSITION (PST_NUM)
;


ALTER TABLE SC_FILE
	ADD FOREIGN KEY (SCH_NUM)
	REFERENCES SCHEDULE (SCH_NUM)
;


ALTER TABLE DOC_FILE
	ADD FOREIGN KEY (SDOC_NUM)
	REFERENCES SIGN_DOC (SDOC_NUM)
;


ALTER TABLE REFERENCE
	ADD FOREIGN KEY (SDOC_NUM)
	REFERENCES SIGN_DOC (SDOC_NUM)
;


ALTER TABLE SDOC_LINE
	ADD FOREIGN KEY (SDOC_NUM)
	REFERENCES SIGN_DOC (SDOC_NUM)
;


ALTER TABLE EMPLOYEE
	ADD FOREIGN KEY (TEAM_NUM)
	REFERENCES TEAM (TEAM_NUM)
;


ALTER TABLE WORK_FILE
	ADD FOREIGN KEY (WORK_NUM)
	REFERENCES WORK (WORK_NUM)
;


ALTER TABLE WORK_LINE
	ADD FOREIGN KEY (WORK_NUM)
	REFERENCES WORK (WORK_NUM)
;


ALTER TABLE WORK
	ADD FOREIGN KEY (WTYPE_NUM)
	REFERENCES WORK_TYPE (WTYPE_NUM)
;



/* Comments */

COMMENT ON TABLE ACADEMIC IS '�з����̺�';
COMMENT ON COLUMN ACADEMIC.ACD_NUM IS '�з¹�ȣ : �з¹�ȣ';
COMMENT ON COLUMN ACADEMIC.ACD_GRADUATION IS '������ : ������';
COMMENT ON COLUMN ACADEMIC.ACD_NAME IS '�б��� : �б���';
COMMENT ON COLUMN ACADEMIC.ACD_MAJOR IS '���� : ����';
COMMENT ON COLUMN ACADEMIC.ACD_SCORE IS '���� : ����';
COMMENT ON COLUMN ACADEMIC.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON TABLE ACCOUNT IS '�������̺�';
COMMENT ON COLUMN ACCOUNT.ACNT_NUM IS '������ȣ : ������ȣ';
COMMENT ON COLUMN ACCOUNT.ACNT_ID IS '���̵� : ���̵�';
COMMENT ON COLUMN ACCOUNT.ACNT_PWD IS '��й�ȣ : ��й�ȣ';
COMMENT ON COLUMN ACCOUNT.ACNT_LEVEL IS '���ѷ��� : ���ѷ���';
COMMENT ON COLUMN ACCOUNT.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON TABLE ANNUAL IS '������Ȳ���̺�';
COMMENT ON COLUMN ANNUAL.ANN_NUM IS '������ȣ : ������ȣ';
COMMENT ON COLUMN ANNUAL.ANN_TOTAL IS '��ü�������� : ��ü��������';
COMMENT ON COLUMN ANNUAL.ANN_USE IS '��뿬������ : ��뿬������';
COMMENT ON COLUMN ANNUAL.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON TABLE BOOKMARK IS '����������ã�����̺�';
COMMENT ON COLUMN BOOKMARK.BKM_NUM IS '�ϸ�ũ��ȣ : �ϸ�ũ��ȣ';
COMMENT ON COLUMN BOOKMARK.BKM_LEVEL IS '������� : �������';
COMMENT ON COLUMN BOOKMARK.BKM_NAME IS '�ϸ�ũ�̸� : �ϸ�ũ�̸�';
COMMENT ON COLUMN BOOKMARK.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON TABLE CAREER IS '������̺�';
COMMENT ON COLUMN CAREER.CRR_NUM IS '��¹�ȣ : ��¹�ȣ';
COMMENT ON COLUMN CAREER.CRR_SDATE IS '�Ի��� : �Ի���';
COMMENT ON COLUMN CAREER.CRR_EDATE IS '����� : �����';
COMMENT ON COLUMN CAREER.CRR_NAME IS '����� : �����';
COMMENT ON COLUMN CAREER.CRR_DEPT IS '�μ��� : �μ���';
COMMENT ON COLUMN CAREER.CRR_POSITION IS '���� : ����';
COMMENT ON COLUMN CAREER.CRR_WORK IS '������ : ������';
COMMENT ON COLUMN CAREER.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON TABLE DEPT IS '�μ����̺�';
COMMENT ON COLUMN DEPT.DEPT_NUM IS '�μ���ȣ : �μ���ȣ';
COMMENT ON COLUMN DEPT.DEPT_NAME IS '�μ��� : �μ���';
COMMENT ON TABLE DOC_FILE IS '���繮���������̺�';
COMMENT ON COLUMN DOC_FILE.SFILE_NUM IS '�������Ϲ�ȣ : �������Ϲ�ȣ';
COMMENT ON COLUMN DOC_FILE.SFILE_SAVEFILENAME IS '������������� : �������������';
COMMENT ON COLUMN DOC_FILE.SFILE_ORGFILENAME IS '�����������ϸ� : �����������ϸ�';
COMMENT ON COLUMN DOC_FILE.SFILE_SIZE IS '��������ũ�� : ��������ũ��';
COMMENT ON COLUMN DOC_FILE.SDOC_NUM IS '���繮����ȣ : ���繮����ȣ';
COMMENT ON TABLE DOC_TYPE IS '���繮���������̺�';
COMMENT ON COLUMN DOC_TYPE.DOC_NUM IS '���繮����ȣ : ���繮����ȣ';
COMMENT ON COLUMN DOC_TYPE.DOC_NAME IS '���繮���̸� : ���繮���̸�(��ȼ�,���ּ�,��������...)';
COMMENT ON TABLE EMPLOYEE IS '��������������̺�';
COMMENT ON COLUMN EMPLOYEE.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON COLUMN EMPLOYEE.EMP_NAME IS '����̸� : ����̸�';
COMMENT ON COLUMN EMPLOYEE.EMP_PHONE IS '�����ȭ��ȣ : �����ȭ��ȣ';
COMMENT ON COLUMN EMPLOYEE.EMP_ADDR IS '����ּ� : ����ּ�';
COMMENT ON COLUMN EMPLOYEE.EMP_BIRTH IS '���������� : ����������';
COMMENT ON COLUMN EMPLOYEE.EMP_EMAIL IS '����̸��� : ����̸���';
COMMENT ON COLUMN EMPLOYEE.EMP_HIREDATE IS '����Ի��� : ����Ի���';
COMMENT ON COLUMN EMPLOYEE.EMP_GENDER IS '������� : �������';
COMMENT ON COLUMN EMPLOYEE.PST_NUM IS '������ȣ : ������ȣ';
COMMENT ON COLUMN EMPLOYEE.DEPT_NUM IS '�μ���ȣ : �μ���ȣ';
COMMENT ON COLUMN EMPLOYEE.TEAM_NUM IS '����ȣ : ����ȣ';
COMMENT ON TABLE HALFTIME IS '�����������̺�';
COMMENT ON COLUMN HALFTIME.HTIME_NUM IS '�����ð�������ȣ';
COMMENT ON COLUMN HALFTIME.HTIME_TYPE IS '�������� : 0.����
1.����';
COMMENT ON COLUMN HALFTIME.HTIME_START IS '���۽ð�';
COMMENT ON COLUMN HALFTIME.HTIME_END IS '���ð�';
COMMENT ON TABLE HISTORY IS '�ٹ��̷����̺�';
COMMENT ON COLUMN HISTORY.HIS_NUM IS '�ٹ��̷¹�ȣ : �ٹ��̷¹�ȣ';
COMMENT ON COLUMN HISTORY.HIS_DATE IS '��¥ : ��¥';
COMMENT ON COLUMN HISTORY.HIS_DEPT IS '�ٹ��μ� : �ٹ��μ�';
COMMENT ON COLUMN HISTORY.HIS_POSITION IS '���� : ����';
COMMENT ON COLUMN HISTORY.HIS_WORK IS '������ : ������';
COMMENT ON COLUMN HISTORY.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON TABLE MESSAGE IS '�������̺�';
COMMENT ON COLUMN MESSAGE.MSG_NUM IS '������ȣ : ������ȣ';
COMMENT ON COLUMN MESSAGE.MSG_RECNAME IS '�޴»�����̵� : �޴»�����̵�';
COMMENT ON COLUMN MESSAGE.MSG_SENDNAME IS '������� : �������';
COMMENT ON COLUMN MESSAGE.MSG_CONTENT IS '�������� : ��������';
COMMENT ON COLUMN MESSAGE.MSG_REGDATE IS '�ۼ��� : �ۼ���';
COMMENT ON COLUMN MESSAGE.MSG_TYPE IS '���� ���ſ��� ���� : 0.������
1.����';
COMMENT ON TABLE POSITION IS '�������̺�';
COMMENT ON COLUMN POSITION.PST_NUM IS '������ȣ : ������ȣ';
COMMENT ON COLUMN POSITION.PST_NAME IS '������ : ������';
COMMENT ON TABLE REFERENCE IS '�����������̺�';
COMMENT ON COLUMN REFERENCE.REF_NUM IS '������ȣ : ������ȣ';
COMMENT ON COLUMN REFERENCE.SDOC_NUM IS '���繮����ȣ : ���繮����ȣ';
COMMENT ON COLUMN REFERENCE.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON TABLE RETIRE IS '���������̺�';
COMMENT ON COLUMN RETIRE.RE_NUM IS '�����ڹ�ȣ : �����ڹ�ȣ';
COMMENT ON COLUMN RETIRE.RE_DATE IS '������';
COMMENT ON COLUMN RETIRE.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON TABLE SCHEDULE IS '�������̺�';
COMMENT ON COLUMN SCHEDULE.SCH_NUM IS '������ȣ : ������ȣ';
COMMENT ON COLUMN SCHEDULE.SCH_TITLE IS '�����̸� : �����̸�';
COMMENT ON COLUMN SCHEDULE.SCH_CONTENT IS '�������� : ��������';
COMMENT ON COLUMN SCHEDULE.SCH_SDATE IS '������ : ������';
COMMENT ON COLUMN SCHEDULE.SCH_EDATE IS '������ : ������';
COMMENT ON COLUMN SCHEDULE.SCH_PLACE IS '������� : �������';
COMMENT ON COLUMN SCHEDULE.SCH_PUBLIC IS '�������� : ��������';
COMMENT ON COLUMN SCHEDULE.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON TABLE SC_FILE IS '�����������̺�';
COMMENT ON COLUMN SC_FILE.SF_NUM IS '�������Ϲ�ȣ : �������Ϲ�ȣ';
COMMENT ON COLUMN SC_FILE.SF_SAVEFILENAME IS '������������� : �������������';
COMMENT ON COLUMN SC_FILE.SF_ORGFILENAME IS '�����������ϸ� : �����������ϸ�';
COMMENT ON COLUMN SC_FILE.SF_SIZE IS '��������ũ�� : ��������ũ��';
COMMENT ON COLUMN SC_FILE.SCH_NUM IS '������ȣ : ������ȣ';
COMMENT ON TABLE SDOC_LINE IS '����������̺�';
COMMENT ON COLUMN SDOC_LINE.SLINE_NUM IS '������ι�ȣ : ������ι�ȣ';
COMMENT ON COLUMN SDOC_LINE.SLINE_LEVEL IS '������� : �������';
COMMENT ON COLUMN SDOC_LINE.SLINE_STATE IS '������� : �������';
COMMENT ON COLUMN SDOC_LINE.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON COLUMN SDOC_LINE.SDOC_NUM IS '���繮����ȣ : ���繮����ȣ';
COMMENT ON TABLE SIGN_DOC IS '���繮�����̺�';
COMMENT ON COLUMN SIGN_DOC.SDOC_NUM IS '���繮����ȣ : ���繮����ȣ';
COMMENT ON COLUMN SIGN_DOC.SDOC_STATE IS '����������� : �����������';
COMMENT ON COLUMN SIGN_DOC.SDOC_TITLE IS '���繮������ : ���繮������';
COMMENT ON COLUMN SIGN_DOC.SDOC_CONTENT IS '���繮������ : ���繮������';
COMMENT ON COLUMN SIGN_DOC.SDOC_DATE IS '���繮�� �ۼ���';
COMMENT ON COLUMN SIGN_DOC.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON COLUMN SIGN_DOC.DOC_NUM IS '���繮����ȣ : ���繮����ȣ';
COMMENT ON TABLE TEAM IS '���������̺�';
COMMENT ON COLUMN TEAM.TEAM_NUM IS '����ȣ : ����ȣ';
COMMENT ON COLUMN TEAM.TEAM_NAME IS '���̸� : ���̸�';
COMMENT ON TABLE WORK IS '������û��Ȳ���̺�';
COMMENT ON COLUMN WORK.WORK_NUM IS '������û��ȣ : ������û��ȣ';
COMMENT ON COLUMN WORK.WORK_SDATE IS '������ : ������';
COMMENT ON COLUMN WORK.WORK_EDATE IS '������ : ������';
COMMENT ON COLUMN WORK.WORK_CONTENT IS '�������� : ��������';
COMMENT ON COLUMN WORK.WORK_REGDATE IS '����� : �����';
COMMENT ON COLUMN WORK.WORK_STATE IS '�������λ��� : �������λ���';
COMMENT ON COLUMN WORK.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON COLUMN WORK.WTYPE_NUM IS '�������й�ȣ : �������й�ȣ';
COMMENT ON TABLE WORKLIST IS '����ٳ���';
COMMENT ON COLUMN WORKLIST.WLIST_NUM IS '����ٳ�����ȣ : ����ٳ�����ȣ';
COMMENT ON COLUMN WORKLIST.WLIST_START IS '��ٽð� : ��ٽð�';
COMMENT ON COLUMN WORKLIST.WLIST_END IS '��ٽð� : ��ٽð�';
COMMENT ON COLUMN WORKLIST.WLIST_GO IS '������߽ð� : ������߽ð�';
COMMENT ON COLUMN WORKLIST.WLIST_BACK IS '���⺹�ͽð� : ���⺹�ͽð�
';
COMMENT ON COLUMN WORKLIST.WLIST_TYPE IS '����ٻ���(�������) : 0.���
1.���
2.����
3.����
4.����
5.����
';
COMMENT ON COLUMN WORKLIST.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON TABLE WORKTIME IS '������������̺�';
COMMENT ON COLUMN WORKTIME.WTIME_NUM IS '�����������ȣ : �����������ȣ';
COMMENT ON COLUMN WORKTIME.WTIME_START IS '��ٽð����� : ��ٽð�����';
COMMENT ON COLUMN WORKTIME.WTIME_END IS '��ٽð����� : ��ٽð�����';
COMMENT ON TABLE WORK_FILE IS '�����������̺�';
COMMENT ON COLUMN WORK_FILE.WFILE_NUM IS '���¹������Ϲ�ȣ : ���繮�����Ϲ�ȣ';
COMMENT ON COLUMN WORK_FILE.WFILE_SAVEFILENAME IS '���¹��� ��������� : ���繮�� ���������';
COMMENT ON COLUMN WORK_FILE.WFILE_ORGFILENAME IS '���¹��� �������ϸ� : ���繮�� �������ϸ�';
COMMENT ON COLUMN WORK_FILE.WFILE_SIZE IS '���¹��� ����ũ�� : ���繮�� ����ũ��';
COMMENT ON COLUMN WORK_FILE.WORK_NUM IS '������û��ȣ : ������û��ȣ';
COMMENT ON TABLE WORK_LINE IS '���¶������̺�';
COMMENT ON COLUMN WORK_LINE.WLINE_NUM IS '���¶��ι�ȣ : ������ι�ȣ';
COMMENT ON COLUMN WORK_LINE.WLINE_LEVEL IS '���°������ : �������';
COMMENT ON COLUMN WORK_LINE.WLINE_STATE IS '������� : �������
0�� �ݷ�
1�� ����';
COMMENT ON COLUMN WORK_LINE.WORK_NUM IS '������û��ȣ : ������û��ȣ';
COMMENT ON COLUMN WORK_LINE.EMP_NUM IS '�����ȣ : �����ȣ';
COMMENT ON TABLE WORK_TYPE IS '�����������̺�';
COMMENT ON COLUMN WORK_TYPE.WTYPE_NUM IS '�������й�ȣ : �������й�ȣ';
COMMENT ON COLUMN WORK_TYPE.WTYPE_NAME IS '�������и� : �������и�';


