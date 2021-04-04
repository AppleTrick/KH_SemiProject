DROP SEQUENCE CHECKLISTSEQ;
DROP TABLE CHECKLISTBOARD;

CREATE SEQUENCE CHECKLISTSEQ;

CREATE TABLE CHECKLISTBOARD(
	MEM_NO NUMBER,
	Q1NAME VARCHAR2(40),
	Q2CALL VARCHAR2(4000),
	Q3ADR VARCHAR2(400),
	Q4MARRIAGE VARCHAR2(40),
	Q5JOB VARCHAR2(400),
	Q6PET VARCHAR2(4000),
	Q7PET2 VARCHAR2(4000),
	Q8FAM VARCHAR2(400),
	Q9WHY VARCHAR2(4000),
	Q10BABY VARCHAR2(40),
	Q11ETC VARCHAR2(4000)
);

INSERT INTO CHECKLISTBOARD
VALUES(1, '백구','3시','서울시 강남구','N', '학생','키워본적없어요','반려동물없어요',
'나혼자산다','안락사위기에서구출','Y','기타궁금한점');

SELECT * FROM CHECKLISTBOARD

