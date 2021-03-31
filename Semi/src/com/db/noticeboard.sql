DROP SEQUENCE NOTICEBOARD;
DROP TABLE NOTICEBOARD;

CREATE SEQUENCE NOTICEBOARDSEQ;

CREATE TABLE NOTICEBOARD(
	ARTICLE_NO NUMBER PRIMARY KEY,
	BRD_NO NUMBER NOT NULL,
	ADMIN_WRITER VARCHAR2(400) NOT NULL,
	NOTICE_TITLE VARCHAR2(1000) NOT NULL,
	NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
	NOTICE_REGDATE DATE NOT NULL,
	NOTICE_HIT NUMBER NOT NULL
);

INSERT INTO NOTICEBOARD
VALUES (NOTICEBOARDSEQ.NEXTVAL, 1, '관리자', '제목제목', '내용내용', SYSDATE, 1);

SELECT ARTICLE_NO, ADMIN_WRITER, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_REGDATE, NOTICE_HIT
FROM NOTICEBOARD
ORDER BY ARTICLE_NO DESC

SELECT * FROM NOTICEBOARD
