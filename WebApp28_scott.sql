SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 테이블 생성
CREATE TABLE TBL_MEMBERLIST
( ID    VARCHAR2(30)
, PW    VARCHAR2(20) NOT NULL
, NAME  VARCHAR2(50) NOT NULL
, TEL   VARCHAR2(50) NOT NULL
, EMAIL VARCHAR2(100) 
, CONSTRAINT MEMBERLIST_ID_PK PRIMARY KEY(ID)
, CONSTRAINT MEMBERLIST_TEL_UK UNIQUE(TEL)
);
--==>> Table TBL_MEMBERLIST이(가) 생성되었습니다.

DESC TBL_MEMBERLIST;

--○ 데이터 입력 쿼리문
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES ('superman', 'java006$', '이하림', '010-1111-1111', 'superman@test.com');
--> 한 줄 구성
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES ('superman', 'java006$', '이하림', '010-1111-1111', 'superman@test.com')
;
--==>> 1 행 이(가) 삽입되었습니다.

--○ 전체 조회 쿼리문
SELECT ID, PW, NAME, TEL, EMAIL
FROM TBL_MEMBERLIST;
--> 한 줄 구성
SELECT ID, PW, NAME, TEL, EMAIL FROM TBL_MEMBERLIST
;
--==>> superman	java006$	이하림	010-1111-1111	superman@test.com

--○ 인원 수 확인 쿼리문
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERLIST;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST
;
--==>> 1

COMMIT;
--==>> 커밋 완료.
