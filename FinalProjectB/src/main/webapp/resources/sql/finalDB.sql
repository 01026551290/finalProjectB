show user;


---- 작성자명 :   작성일자 :

CREATE TABLE MEMBER
(IDX            NUMBER(30)      NOT NULL    
,MEMBERID       VARCHAR2(30)    NOT NULL
,NICKNAME       VARCHAR2(30)    NOT NULL
,PWD            VARCHAR2(300)   NOT NULL    
,NAME           VARCHAR2(20)    NOT NULL
,EMAIL          VARCHAR2(300)   NOT NULL
,BRITHDAY       VARCHAR2(8)     NOT NULL
,TEL            VARCHAR2(11)    NOT NULL
,GENDER         NUMBER(1)       NOT NULL
,REGISTERDAY    DATE            DEFAULT SYSDATE     
,STATUS         NUMBER(1)       DEFAULT 1 
,GRADE          NUMBER(1)       DEFAULT 1
,POINT          NUMBER(20)      DEFAULT 1000
,PICTURE        VARCHAR2(300)   DEFAULT 'NO.JPG'
,FINALLOGINDATE DATE            DEFAULT SYSDATE
,FINALPWDATE    DATE            DEFAULT SYSDATE   
,CONSTRAINT PK_MEMBER_IDX PRIMARY KEY(IDX)
,CONSTRAINT UK_MEMBER_MEMBERID UNIQUE (MEMBERID)
,CONSTRAINT UK_MEMBER_NICKNAME UNIQUE (NICKNAME)
,CONSTRAINT UK_MEMBER_EMAIL UNIQUE (EMAIL)
,CONSTRAINT CK_MEMBER_GENDER CHECK( GENDER in('1','2','3','4') )
,CONSTRAINT CK_MEMBER_STATUS CHECK( STATUS in('1','0') )
);

ALTER TABLE MEMBER ADD (FULLTEL VARCHAR2(13));



CREATE SEQUENCE SEQ_MEMBER_IDX
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

CREATE TABLE LOGIN_MEMBER
(FK_MEMBERID    VARCHAR2(30)    NOT NULL
,PWD            VARCHAR2(300)   NOT NULL
,NICKNAME       VARCHAR2(30)    NOT NULL
,FK_IDX         NUMBER(30)      NOT NULL
,CONSTRAINT FK_LOGIN_MEMBER_FK_MEMBERID FOREIGN KEY(FK_MEMBERID) REFERENCES MEMBER(MEMBERID)
,CONSTRAINT FK_LOGIN_MEMBER_FK_IDX FOREIGN KEY(FK_IDX) REFERENCES MEMBER(IDX)
);


CREATE TABLE REGION
(REGIONCODE     NUMBER(3)       NOT NULL
,REGION         VARCHAR2(20)    NOT NULL
,CONSTRAINT PK_REGION_REGIONCODE PRIMARY KEY(REGIONCODE)
);

CREATE TABLE LCATEGORY
(LARGECATEGORYCODE              NUMBER(3)       NOT NULL
,LARGECATEGORYNAME              VARCHAR2(20)    NOT NULL
,CONSTRAINT PK_LCATEGORY_LARGECATEGORYCODE PRIMARY KEY(LARGECATEGORYCODE)
);

CREATE TABLE LONTION
(LARGECATEGORYONTIONCODE    NUMBER(3)       NOT NULL
,FK_LARGECATEGORYCODE       NUMBER(3)       NOT NULL
,NAME                       VARCHAR2(300)   NOT NULL
,BUSINESSTEL                VARCHAR2(12)    NOT NULL
,ADDRESS                    VARCHAR2(100)   NOT NULL
,INFO                       VARCHAR2(300)   NOT NULL
,ONTIONTYPE                 VARCHAR2(300)   NOT NULL
,CONSTRAINT PK_LONTION_LCATEONTIONCODE PRIMARY KEY(LARGECATEGORYONTIONCODE)
,CONSTRAINT UK_LONTION_NAME UNIQUE (NAME)
,CONSTRAINT FK_LONTION_FK_LCATEGORYCODE FOREIGN KEY(FK_LARGECATEGORYCODE) REFERENCES LCATEGORY(LARGECATEGORYCODE)
);

CREATE TABLE MCATEGORY
(FK_LARGECATEGORYCODE       NUMBER(3)       NOT NULL
,MIDDLECATEGORYCODE         NUMBER(3)       NOT NULL
,MIDDLECATEGORYCODENAME     VARCHAR2(20)    NOT NULL
,CONSTRAINT FK_MCATEGORY_FK_LCATEGORYCODE FOREIGN KEY(FK_LARGECATEGORYCODE) REFERENCES LCATEGORY(LARGECATEGORYCODE)
,CONSTRAINT PK_MCATEGORY_LCATEGORYCODE PRIMARY KEY(MIDDLECATEGORYCODE)
);


CREATE TABLE MONTION
(MIDDLECATEGORYONTIONCODE    NUMBER(3)       NOT NULL
,FK_MIDDLECATEGORYCODE       NUMBER(3)       NOT NULL
,ONTIONTYPE                  VARCHAR2(300)   NOT NULL
,CONSTRAINT PK_MONTION_MCATEONTIONCODE PRIMARY KEY(MIDDLECATEGORYONTIONCODE)
,CONSTRAINT FK_MONTION_FK_MCATEGORYCODE FOREIGN KEY(FK_MIDDLECATEGORYCODE) REFERENCES MCATEGORY(MIDDLECATEGORYCODE)
);


CREATE TABLE PRODUCT
(PRODUCTID                      NUMBER(20)      NOT NULL
,FK_REGIONCODE                  NUMBER(3)       NOT NULL
,FK_LARGECATEGORYCODE           NUMBER(3)       NOT NULL
,FK_LARGECATEGORYONTIONCODE     NUMBER(3)       NOT NULL
,FK_MIDDLECATEGORYCODE          NUMBER(3)       NOT NULL
,FK_MIDDLECATEGORYONTIONCODE    NUMBER(3)       NOT NULL
,PRODUCTNAME                    VARCHAR2(30)    NOT NULL
,WEEKPRICE                      NUMBER(20)      NOT NULL
,WEEKENPRICE                    NUMBER(20)      NOT NULL
,ROOMINFO                       VARCHAR2(100)   NOT NULL
,PRODUCTSTATUS                  NUMBER(1)       NOT NULL
,PRODUCTPERIOD1                 DATE            NOT NULL
,PRODUCTPERIOD2                 DATE            NOT NULL
,CONSTRAINT PK_PRODUCT_PRODUCTID PRIMARY KEY(PRODUCTID)
,CONSTRAINT FK_PRODUCT_FK_REGIONCODE FOREIGN KEY(FK_REGIONCODE) REFERENCES REGION(REGIONCODE)
,CONSTRAINT FK_PRODUCT_FK_LCATEGORYCODE FOREIGN KEY(FK_LARGECATEGORYCODE) REFERENCES LCATEGORY(LARGECATEGORYCODE)
,CONSTRAINT FK_PRODUCT_FK_LCATEONTIONCODE FOREIGN KEY(FK_LARGECATEGORYONTIONCODE) REFERENCES LONTION(LARGECATEGORYONTIONCODE)
,CONSTRAINT FK_PRODUCT_FK_MCATEGORYCODE FOREIGN KEY(FK_MIDDLECATEGORYCODE) REFERENCES MCATEGORY(MIDDLECATEGORYCODE)
,CONSTRAINT FK_PRODUCT_FK_MCATEONTIONCODE FOREIGN KEY(FK_MIDDLECATEGORYONTIONCODE) REFERENCES MONTION(MIDDLECATEGORYONTIONCODE)
,CONSTRAINT CK_PRODUCT_PRODUCTSTATUS CHECK( PRODUCTSTATUS in('1','0') )
);


CREATE SEQUENCE SEQ_PRODUCT_PRODUCTID  
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

CREATE TABLE PRODUCTPIC
(PRODUCTPICID       NUMBER(10)      NOT NULL
,FK_PRODUCTID       NUMBER(20)      NOT NULL
,PICTURE            VARCHAR2(300)   NOT NULL
,CONSTRAINT PK_PRODUCTPIC_PRODUCTPICID PRIMARY KEY(PRODUCTPICID)
,CONSTRAINT FK_PRODUCTPIC_FK_PRODUCTID FOREIGN KEY(FK_PRODUCTID) REFERENCES PRODUCT(PRODUCTID)
);

CREATE TABLE PRODUCTDATE
(PRODUCTDATEID  NUMBER(10)  NOT NULL
,FK_PRODUCTID   NUMBER(20)  NOT NULL
,PRODUCTPERIOD1 DATE        NOT NULL
,PRODUCTPERIOD2 DATE        NOT NULL
,CONSTRAINT FK_PRODUCTDATE_FK_PRODUCTID FOREIGN KEY(FK_PRODUCTID) REFERENCES PRODUCT(PRODUCTID)
);


CREATE TABLE LIKELIST
(LIKELISTID     NUMBER(30)      NOT NULL
,FK_MEMBERID    VARCHAR2(30)    NOT NULL 
,FK_PRODUCTID   NUMBER(20)      NOT NULL
,CHECKIN        DATE            NOT NULL
,CHECKOUT       DATE            NOT NULL
,CONSTRAINT PK_LIKELIST_LIKELISTID PRIMARY KEY(LIKELISTID)
,CONSTRAINT FK_LIKELIST_FK_MEMBERID FOREIGN KEY(FK_MEMBERID) REFERENCES MEMBER(MEMBERID)
,CONSTRAINT FK_LIKELIST_FK_PRODUCTID FOREIGN KEY(FK_PRODUCTID) REFERENCES PRODUCT(PRODUCTID)
);

CREATE SEQUENCE SEQ_LIKELIST_LIKELISTID
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;


CREATE TABLE RESERVE1
(RESERVEID      NUMBER(30)  NOT NULL
,FK_PRODUCTID   NUMBER(20)  NOT NULL
,PRICE          NUMBER(30)  NOT NULL
,RESERVEDATE    DATE    DEFAULT SYSDATE
,CONSTRAINT PK_RESERVE1_RESERVEID PRIMARY KEY(RESERVEID)
,CONSTRAINT FK_RESERVE1_FK_PRODUCTID FOREIGN KEY(FK_PRODUCTID) REFERENCES PRODUCT(PRODUCTID)
);

CREATE SEQUENCE SEQ_RESERVE1_RESERVEID
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;


CREATE TABLE RESERVE2
(FK_RESERVEID       NUMBER(30)  NOT NULL
,CHECKIN            DATE        NOT NULL
,CHECKOUT           DATE        NOT NULL
,NONIGHT            NUMBER(3)   NOT NULL
,CONSTRAINT FK_RESERVE2_FK_RESERVEID  FOREIGN KEY(FK_RESERVEID) REFERENCES RESERVE1(RESERVEID)
);



CREATE TABLE COUPON
(COUPONID           NUMBER(20)      NOT NULL
,FK_MEMBERID        VARCHAR2(30)    NOT NULL
,COUPONCODE         VARCHAR2(30)    NOT NULL
,COUPONVALIDITY1    DATE            NOT NULL
,COUPONVALIDITY2    DATE            NOT NULL
,COUPONTYPE         VARCHAR2(10)    NOT NULL
,COUPONDISCOUNT     NUMBER(2)       NOT NULL
,COUPONREG          DATE            DEFAULT SYSDATE
,CONSTRAINT PK_COUPON_COUPONID PRIMARY KEY(COUPONID)
,CONSTRAINT FK_COUPON_FK_MEMBERID  FOREIGN KEY(FK_MEMBERID) REFERENCES MEMBER(MEMBERID)
);

CREATE SEQUENCE SEQ_COUPON_COUPONID
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;


CREATE TABLE STATE_COUPON
(STATE_COUPONID     NUMBER(20)      NOT NULL
,FK_COUPONID        NUMBER(20)      NOT NULL
,FK_MEMBERID        VARCHAR2(30)    NOT NULL
,FK_PRODUCTID       NUMBER(20)      NOT NULL
,FK_RESERVEID       NUMBER(30)      NOT NULL
,CONSTRAINT PK_STATE_COUPON_COUPONID PRIMARY KEY(STATE_COUPONID)
,CONSTRAINT FK_STATE_COUPON_FK_COUPONID  FOREIGN KEY(FK_COUPONID)  REFERENCES COUPON(COUPONID)
,CONSTRAINT FK_STATE_COUPON_FK_MEMBERID  FOREIGN KEY(FK_MEMBERID)  REFERENCES MEMBER(MEMBERID)
,CONSTRAINT FK_STATE_COUPON_FK_PRODUCTID FOREIGN KEY(FK_PRODUCTID) REFERENCES PRODUCT(PRODUCTID)
,CONSTRAINT FK_STATE_COUPON_FK_RESERVEID FOREIGN KEY(FK_RESERVEID) REFERENCES RESERVE1(RESERVEID)
);

CREATE SEQUENCE SEQ_COUPON_STATE_COUPONID
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

---------------------------------------------------------------------------------------------------------------------

----- 테이블 확인 -----------------

SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE';

---- 테이블 정보 확인 ----

DESC MEMBER;
DESC STATE_COUPON;
DESC COUPON;
DESC RESERVE1;
DESC RESERVE2;
DESC LIKELIST;
DESC PRODUCTDATE;
DESC PRODUCTPIC;
DESC PRODUCT;
DESC MONTION;
DESC MCATEGORY;
DESC LONTION;
DESC LCATEGORY;
DESC REGION;
DESC LOGIN_MEMBER;

--- 테이블 제약조건 확인  'MEMBER' 에 테이블 명 ---

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'MEMBER';


--------------------통계를 위한 회원 추가하기 (반복문) 마진수 2019-07-26 18:20 --------------------


DECLARE 
 V_CNT NUMBER(3) := 0;
 BEGIN 
   LOOP
    INSERT INTO MEMBER ( IDX , MEMBERID , NICKNAME , PWD , NAME , EMAIL , BRITHDAY , TEL ,  GENDER , REGISTERDAY ,  STATUS , GRADE , POINT , PICTURE , FINALLOGINDATE , FINALPWDATE )
    VALUES (SEQ_MEMBER_IDX.NEXTVAL , 'GODJINSOO'||V_CNT , '갓진수'||V_CNT , 'QWER1234$' , '마진수' , 'GODJINSOO'||V_CNT||'@NNAVER.COM' , '19930524' , '01026551290' , '1' , DEFAULT , DEFAULT , DEFAULT , DEFAULT , DEFAULT, DEFAULT ,DEFAULT  );
    V_CNT := V_CNT + 1;
   EXIT WHEN V_CNT > 20;
   END LOOP;
 END;

DECLARE 
 V_CNT NUMBER(3) := 41;
 BEGIN 
   LOOP
    INSERT INTO MEMBER ( IDX , MEMBERID , NICKNAME , PWD , NAME , EMAIL , BRITHDAY , TEL ,  GENDER , REGISTERDAY ,  STATUS , GRADE , POINT , PICTURE , FINALLOGINDATE , FINALPWDATE )
    VALUES (SEQ_MEMBER_IDX.NEXTVAL , 'GODJINSOO'||V_CNT , '갓진수'||V_CNT , 'QWER1234$' , '마진수' , 'GODJINSOO'||V_CNT||'@NNAVER.COM' , '19930524' , '01026551290' , '2' , DEFAULT , DEFAULT , DEFAULT , DEFAULT , DEFAULT, DEFAULT ,DEFAULT  );
    V_CNT := V_CNT + 1;
   EXIT WHEN V_CNT > 61;
   END LOOP;
 END;
 
 COMMIT;
 
 SELECT *
 FROM MEMBER;

-------------------------------------------------------------------------------------------------------------------------


-- 작성자명 : 정혜인  작성일자 : 2019.07.17


insert into LCATEGORY (LARGECATEGORYCODE, LARGECATEGORYNAME) values (10, '호텔');
insert into LCATEGORY (LARGECATEGORYCODE, LARGECATEGORYNAME) values (20, '리조트');
insert into LCATEGORY (LARGECATEGORYCODE, LARGECATEGORYNAME) values (30, '게스트하우스');
insert into LCATEGORY (LARGECATEGORYCODE, LARGECATEGORYNAME) values (40, '모텔');
insert into LCATEGORY (LARGECATEGORYCODE, LARGECATEGORYNAME) values (50, '펜션');
insert into LCATEGORY (LARGECATEGORYCODE, LARGECATEGORYNAME) values (60, '호스텔');

select *
from LCATEGORY

insert into LONTION (LARGECATEGORYONTIONCODE, FK_LARGECATEGORYCODE, NAME, BUSINESSTEL, ADDRESS, INFO, ONTIONTYPE) 
values (110, 10, '제주 신라 호텔', '0647355114', '제주특별자치도 서귀포시 색달동 중문관광로72번길 75', '세계자연문화유산인 제주의아름다운 풍광을 담은 리조트로써 그 명성을 쌓아가고 있는 제주신라호텔', '레스토랑, 발렛파킹');

insert into LONTION (LARGECATEGORYONTIONCODE, FK_LARGECATEGORYCODE, NAME, BUSINESSTEL, ADDRESS, INFO, ONTIONTYPE) 
values (120, 20, '제주 아모렉스 리조트', '0647110125', '제주특별자치도 제주시 도두일동 서해안로 216', '제주시에 위치한 3성급 아파트식 호텔, 헬스클럽 및 무료 키즈클럽 이용 가능', '헬스클럽, 키즈클럽');

insert into LONTION (LARGECATEGORYONTIONCODE, FK_LARGECATEGORYCODE, NAME, BUSINESSTEL, ADDRESS, INFO, ONTIONTYPE) 
values (130, 30, '뷰타워리조트', '0647438953', '제주특별자치도 제주시 도두이동 719-1', '제주에 있는 3성급 펜션', '라운지바');

insert into LONTION (LARGECATEGORYONTIONCODE, FK_LARGECATEGORYCODE, NAME, BUSINESSTEL, ADDRESS, INFO, ONTIONTYPE) 
values (140, 40, '코업시티호텔 성산', '0647809800', '제주특별자치도 서귀포시 성산읍 성산리 250', '해변에 자리한 3.5성급 호텔, 성산 일출봉에서 가까우며 레스토랑 이용 가능', '레스토랑');

insert into LONTION (LARGECATEGORYONTIONCODE, FK_LARGECATEGORYCODE, NAME, BUSINESSTEL, ADDRESS, INFO, ONTIONTYPE) 
values (150, 50, '더 클라우드 풀앤스파', '0647838366', '제주특별자치도 서귀포시 성산읍 성산리 308', '더클라우드 풀앤스파는 제주국제공항에서 차로 1시간 30분 거리에 위치해 있습니다.', '주차장');

insert into LONTION (LARGECATEGORYONTIONCODE, FK_LARGECATEGORYCODE, NAME, BUSINESSTEL, ADDRESS, INFO, ONTIONTYPE) 
values (160, 60, '미도 호스텔', '0647891234', '제주특별자치도 서귀포시 서귀동 258-2', '분위기 있고 조용한 감성 여행자숙소 Since 1977', '주차장');

commit;

select *
from LONTION

select NAME
from LONTION
where lower(NAME) like '%'||lower('미도')||'%';

select ADDRESS
from LONTION
where lower(ADDRESS) like '%'||lower('서귀포')||'%';

select NAME, ADDRESS
from LONTION
where lower(ADDRESS) like '%'||lower('')||'%' or lower(NAME) like '%'||lower('시')||'%';


select NAME, ADDRESS
from LONTION
where lower(ADDRESS) like '%' || '' ||'%' or lower(NAME) like '%'|| '시' ||'%';

-------------------------------------------------------------------------------------------------------------------------


-- 작성자명 : 안유진  작성일자 : 2019.07.24    시퀀스추가/객실데이터삽입/호텔,객실 컬럼 수정삭제


--호텔 시퀀스 생성 (호텔타입별 분류용)

CREATE SEQUENCE SEQ_LONTION_10
START WITH 1000
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_LONTION_20
START WITH 2000
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_LONTION_30
START WITH 3000
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_LONTION_40
START WITH 4000
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_LONTION_50
START WITH 5000
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;


CREATE SEQUENCE SEQ_LONTION_60
START WITH 6000
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

-- 객실용 시퀀스 생생 (숙소유형별 분류)

CREATE SEQUENCE SEQ_PRODUCT_10
START WITH 1000
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_PRODUCT_20
START WITH 2000
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_PRODUCT_30
START WITH 3000
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_PRODUCT_40
START WITH 4000
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_PRODUCT_50
START WITH 5000
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_PRODUCT_60
START WITH 6000
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;


--객실 이미지 시퀀스 생성(위에 있는지 모르고 생성해서 기존 시퀀스 삭제)
CREATE SEQUENCE SEQ_PRODUCTPIC
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

--찜 테이블
CREATE TABLE LIKELIST
(LIKELISTID     NUMBER(30)      NOT NULL --찜테이블 idx
,FK_MEMBERID    VARCHAR2(30)    NOT NULL  --찜한 유저 idx
,FK_HOTELID   NUMBER(20)      NOT NULL --호텔 idx
,STATUS number(1) default 1 --찜상태 1 취소상태2
,CONSTRAINT PK_LIKELIST_LIKELISTID PRIMARY KEY(LIKELISTID)
,CONSTRAINT FK_LIKELIST_FK_MEMBERID FOREIGN KEY(FK_MEMBERID) REFERENCES MEMBER(MEMBERID)
,CONSTRAINT FK_LIKELIST_FK_HOTELID FOREIGN KEY(FK_HOTELID) REFERENCES LONTION(largeCategoryontionCode)
 ,constraint CK_LIKELIST_STATUS check( status in(0,1) ) 
);

--리뷰 테이블
CREATE TABLE REVIEW(
REVIEWIDX NUMBER(30) NOT NULL -- 리뷰idx
,MEMBERIDX NUMBER(30) NOT NULL --멤버idx
,HOTELIDX NUMBER(30) NOT NULL --호텔idx
,ROOMIDX NUMBER(20) NOT NULL --객실idx
,RESERVEIDX NUMBER(30) NOT NULL --예약idx
,TITLE VARCHAR2(50) NOT NULL --후기제목
,CONTENT VARCHAR2(4000) NOT NULL --후기내용
,IMGIDX NUMBER(30) --후기이미지idx
,STATUS NUMBER(1) DEFAULT 1 --후기 개시상태 1 비개시상태 2
,CONSTRAINT PK_REVIEWIDX PRIMARY KEY(REVIEWIDX)
,CONSTRAINT REVIEW_FK_MEMBERIDX FOREIGN KEY(MEMBERIDX) REFERENCES MEMBER(IDX)
,CONSTRAINT REVIEW_FK_HOTELIDX FOREIGN KEY(HOTELIDX) REFERENCES LONTION(LARGECATEGORYONTIONCODE)
,CONSTRAINT REVIEW_FK_ROOMIDX FOREIGN KEY(ROOMIDX) REFERENCES PRODUCT(PRODUCTID)
,CONSTRAINT REVIEW_FK_RESERVEIDX FOREIGN KEY(RESERVEIDX) REFERENCES RESERVE1(RESERVEID)
) --star 추가함

CREATE TABLE REVIEW_IMG(
IMGIDX NUMBER(30) NOT NULL --이미지idx
,REVIEWIDX NUMBER(30) NOT NULL --리뷰idx
,FILENAME VARCHAR2(200) NOT NULL --파일이름
,ORGFILENAME VARCHAR2(200) NOT NULL --원이름
,FILESIZE VARCHAR2(200) NOT NULL --파일사이즈
,CONSTRAINT PK_IMGIDX PRIMARY KEY(IMGIDX)
,CONSTRAINT REVIEW_IMG_FK_REVIEWIDX FOREIGN KEY(REVIEWIDX) REFERENCES REVIEW(REVIEWIDX)
)

-- 호텔 조회수 테이블
CREATE TABLE HOTELVIEWS (
MEMBERIDX NUMBER(30)  --멤버idx
,HOTELIDX NUMBER(20) --호텔idx
,VIEWSDATE DATE DEFAULT SYSDATE --조회일
,CONSTRAINT FK_MEMBERID_HOTELVIEWS FOREIGN KEY(MEMBERIDX)REFERENCES MEMBER(IDX)
,CONSTRAINT FK_HOTELIDX_HOTELVIEWS FOREIGN KEY(HOTELIDX) REFERENCES LONTION(LARGECATEGORYONTIONCODE)
)

--삭제내역
DROP TABLE MONTION PURGE; 
DROP SEQUENCE SEQ_MONTION; 
DROP SEQUENCE SEQ_PRODUCT_PRODUCTID;
DROP TABLE PRODUCTDATE PURGE;
DROP TABLE MCATEGORY  PURGE;
DROP TABLE LIKELIST PURGE;

--변경내역
ALTER TABLE PRODUCT DROP CONSTRAINT FK_PRODUCT_FK_MCATEGORYCODE FOREIGN KEY;
ALTER TABLE PRODUCT DROP CONSTRAINT FK_PRODUCT_FK_MCATEONTIONCODE; 
ALTER TABLE PRODUCT DROP COLUMN FK_LARGECATEGORYCODE;
ALTER TABLE LONTION MODIFY LARGECATEGORYONTIONCODE NUMBER(4);
ALTER TABLE LONTION MODIFY IMG VARCHAR2(300)   DEFAULT 'Hno.jpg'
ALTER TABLE MEMBER MODIFY PICTURE VARCHAR2(300)   DEFAULT 'no.jpg';
ALTER TABLE PRODUCTPIC MODIFY PICTURE VARCHAR2(300)   DEFAULT 'Rno.jpg';
ALTER TABLE PRODUCT RENAME COLUMN FK_MIDDLECATEGORYCODE TO ROOMTYPE;
ALTER TABLE PRODUCT RENAME COLUMN FK_MIDDLECATEGORYONTIONCODE TO ROOMOPTION;
ALTER TABLE PRODUCT MODIFY(ROOMINFO VARCHAR2(100) DEFAULT '설명이 없습니다');
ALTER TABLE PRODUCT MODIFY(PRODUCTSTATUS NUMBER(1) DEFAULT 1);
ALTER TABLE PRODUCT MODIFY(PRODUCTPERIOD1 DATE DEFAULT SYSDATE);
ALTER TABLE PRODUCT MODIFY(PRODUCTPERIOD2 DATE DEFAULT SYSDATE+365);
ALTER TABLE PRODUCT MODIFY(ROOMOPTION VARCHAR2(300) DEFAULT '없음');
ALTER TABLE PRODUCT MODIFY(FK_LARGECATEGORYONTIONCODE NUMBER(4));
ALTER TABLE PRODUCT MODIFY(ROOMTYPE VARCHAR2(4) NOT NULL);
ALTER TABLE RESERVE1 ADD (MEMBERIDX NUMBER(30) )
ALTER TABLE RESERVE1 MODIFY (MEMBERIDX NUMBER(30) NOT NULL)
ALTER TABLE RESERVE1 ADD (STATUS NUMBER(1) DEFAULT 1 )
ALTER TABLE RESERVE1 ADD CONSTRAINT FK_RESERVE1_MEMBERIDX FOREIGN KEY(MEMBERIDX) REFERENCES MEMBER(IDX);
ALTER TABLE REVIEW ADD (STAR NUMBER(2));




create table buisnessBoard
(seq            number                not null   -- 글번호
,fk_member      varchar2(20)          not null   -- 사용자ID
,name           Nvarchar2(20)         not null   -- 글쓴이
,subject        Nvarchar2(200)        not null   -- 글제목
,content        clob       not null   -- 글내용    -- clob
,pw             varchar2(20)          not null   -- 글암호
,readCount      number default 0      not null   -- 글조회수
,regDate        date default sysdate  not null   -- 글쓴시간
,status         number(1) default 1   not null   -- 글삭제여부  1:사용가능한글,  0:삭제된글 
,deleteDay      date                             -- 글삭제시간
,commentCount   number default 0      not null   -- 댓글의 갯수
,groupno        number                not null   -- 답변글쓰기에 있는 그룹번호  원글(부모글)과 답변글은 동일한 groupno 를 가진다. 답변글이 아닌 원글인 경우 groupno 의 값는 groupno 컬럼의 최대값(max)+1 로 한다.
,fk_seq         number default 0      not null   -- fk_seq 컬럼 절대로 foreign key 가 아니다.!!!!!  fk_seq 컬럼은 자신의 글(답변글)에 있어서 원글(부모글)이 누구인지에 대한 정보 값이다. 답변글쓰기에 있어서 답변글이라면 fk_seq 컬럼의 값은 원글의 seq 컬럼의 값을 가지게 되며 답변글이 아닌 원글일 경우 0을 가지도록 한다.
,depthno        number default 0      not null   -- 답변글쓰기에 있어서 답변글이라면 원글의 depthno + 1 을 가지게 되며, 답변글이 아닌 원글일 경우 0을 가지게 한다.
,fileName       varchar2(255)                    -- WAS(톰캣)에 저장될 파일명()
,orgFilename    varchar2(255)                   -- 진짜 파일명(강아지,png) // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
,fileSize       number                          -- 파일크기
,constraint  PK_buisnessBoard_seq primary key(seq)
,constraint  FK_buisnessBoard_member foreign key(fk_member) references member(memberid)
,constraint  CK_buisnessBoard_status check( status in(0,1) )
);


create sequence buisnessBoardSeq
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;


commit;

select *
from member

create table  buisnessBoardComment
(seq           number               not null   
,fk_memberid     varchar2(20)         not null   
,name          varchar2(20)         not null  
,content       varchar2(1000)       not null  
,regDate       date default sysdate not null 
,parentSeq     number               not null   
,status        number(1) default 1  not null                                                
,constraint PK_buiboardComment_seq primary key(seq)
,constraint FK_buiboardComment_parentSeq foreign key(parentSeq) 
                                      references buisnessBoard(seq) on delete cascade
,constraint CK_buiboardComment_status check( status in(1,0) ) 
);

create sequence buisnessCommentSeq
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;




SELECT  PREVIOUSSEQ ,PREVIOUSSUBJECT , SEQ,fk_member,NAME,SUBJECT,CONTENT,READCOUNT, REGDATE , NEXTSEQ , NEXTSUBJECT ,COMMENTCOUNT , GROUPNO , FK_SEQ ,  DEPTHNO
		, FILENAME , ORGFILENAME , FILESIZE
		FROM
		 (
			 SELECT LAG(SEQ, 1) OVER(ORDER BY SEQ DESC) AS PREVIOUSSEQ
			 , LAG(SUBJECT, 1) OVER(ORDER BY SEQ DESC) AS PREVIOUSSUBJECT
			 , SEQ,fk_member,NAME,SUBJECT,CONTENT,READCOUNT,TO_CHAR(REGDATE,'YYYY-MM-DD HH24:MI:SS') AS REGDATE ,COMMENTCOUNT 
			 , LEAD(SEQ, 1) OVER(ORDER BY SEQ DESC) AS NEXTSEQ
			 , LEAD(SUBJECT, 1) OVER(ORDER BY SEQ DESC) AS NEXTSUBJECT
			 , GROUPNO , FK_SEQ ,  DEPTHNO , FILENAME , ORGFILENAME , FILESIZE
			 FROM buisnessBoard
			 WHERE STATUS = 1 
		 )V
		WHERE V.SEQ = #{seq}


select count(*)
from hotelviews
where memberidx = #{memberidx} and hotelidx = #{hotelidx} and to_char(viewsdate,'yyyy-mm-dd') = to_char(sysdate , 'yyyy-mm-dd')


select *
from reserve1

select *
from product


SELECT LARGECATEGORYNAME , COUNT(*) AS CNT ,  ROUND(COUNT(*) /(SELECT COUNT(*) FROM PRODUCT)*100 ,2) AS PERCNT
			FROM PRODUCT A JOIN LONTION B
			ON A.FK_LARGECATEGORYONTIONCODE = B.LARGECATEGORYONTIONCODE
			JOIN LCATEGORY C
			ON B.FK_LARGECATEGORYCODE = C.LARGECATEGORYCODE
			WHERE PRODUCTSTATUS = 1
			GROUP BY LARGECATEGORYNAME
            
   -- 종류별 매출 현황         
select LARGECATEGORYNAME , allprice  
from
(
    select LARGECATEGORYNAME, to_char(sum(day * price) , '999,999,999,999') as allprice
    from 
    (
        select LARGECATEGORYNAME,  TO_DATE(checkout, 'YYYY-MM-DD') - TO_DATE(checkin,'YYYY-MM-DD') as day , price 
        from reserve1 A join product B
        on A.fk_productid = B.productid
        join lontion C 
        on B.FK_LARGECATEGORYONTIONCODE = C.LARGECATEGORYONTIONCODE
        JOIN LCATEGORY D
        ON C.FK_LARGECATEGORYCODE = D.LARGECATEGORYCODE
        JOIN reserve2 E
        on A.reserveid = E.fk_reserveid
    )V
   GROUP BY LARGECATEGORYNAME 
)T


select *
from reserve2

select  TO_DATE(checkout, 'YYYY-MM-DD') - TO_DATE(checkin,'YYYY-MM-DD') as day
from reserve2

, 
(day * price) as allprice ,


select  to_char(sum(day * price) , '999,999,999,999') as allprice
from
(
select TO_DATE(checkout, 'YYYY-MM-DD') - TO_DATE(checkin,'YYYY-MM-DD') as day , price 
from reserve1 A join reserve2 B
on A.reserveid = b.fk_reserveid
where to_char(reservedate , 'yyyy-mm-DD') = to_char(sysdate , 'yyyy-mm-DD')
)V




select GEN_DATE
from
(
SELECT distinct(TO_CHAR(TO_DATE('2014-01-01') + LEVEL - 1, 'YYYY-MM')) AS GEN_DATE
FROM DUAL
CONNECT BY LEVEL <= (TO_DATE('2014-02-12') - TO_DATE('2013-01-01') + 1)
)V
order by GEN_DATE

select *
from product

select *
from review


INSERT INTO REVIEW ( REVIEWIDX , MEMBERIDX , HOTELIDX , ROOMIDX , RESERVEIDX , TITLE , CONTENT , IMGIDX , STATUS , STAR , REGDATE , GROUPNO , FK_SEQ ,DEPTHNO  )
    VALUES ( '42'  , SYSDATE+31 , SYSDATE+61 );



select *
from reserve1
order by reserveid

select *
from reserve2
order by FK_Reserveid

SELECT *
FROM RESERVE1 FULL JOIN RESERVE2


SELECT *
FROM LONTION


-- 64  72 - 93
 
SELECT *
FROM MEMBER

-- 객실 호텔 예약 리뷰



DECLARE 
 V_CNT NUMBER(3) := 40;
 BEGIN 
   LOOP
    INSERT INTO reserve1 ( RESERVEID , FK_PRODUCTID , PRICE , RESERVEDATE , MEMBERIDX , STATUS )
    VALUES (SEQ_RESERVE1_RESERVEID.NEXTVAL , '1006' , '200000' , SYSDATE , V_CNT , DEFAULT  );
    V_CNT := V_CNT + 1;
   EXIT WHEN V_CNT > 50;
   END LOOP;
 END;

INSERT INTO reserve2 ( FK_RESERVEID , CHECKIN , CHECKOUT  )
    VALUES ( '42'  , SYSDATE+31 , SYSDATE+61 );

DECLARE 
 V_CNT NUMBER(3) := 72;
 T_CNT NUMBER(3) := 1;
 Y_CNT NUMBER(3) := 30;
 BEGIN 
   LOOP
    INSERT INTO reserve2 ( FK_RESERVEID , CHECKIN , CHECKOUT  )
    VALUES ( V_CNT  , SYSDATE+T_CNT , SYSDATE+Y_CNT );
    V_CNT := V_CNT + 1;
    T_CNT := T_CNT + 1;
    Y_CNT := Y_CNT + 1;
   EXIT WHEN V_CNT > 93;
   END LOOP;
 END;

SELECT SYSDATE+60
FROM DUAL


COMMIT;

SELECT *
FROM ADMIN

----------------------------------------------------------------------------------------------------------------------

-- 작성자명 : 정혜인  작성일자 : 2019.08.11  공지사항 게시판 테이블 생성 및 수정

create table noticeBoard
(seq            number                not null   -- 글번호
,fk_member      number          not null   -- 사용자ID
,name           Nvarchar2(20)         not null   -- 글쓴이
,subject        Nvarchar2(200)        not null   -- 글제목
,content        clob       not null   -- 글내용    -- clob
,pw             varchar2(20)          not null   -- 글암호
,readCount      number default 0      not null   -- 글조회수
,regDate        date default sysdate  not null   -- 글쓴시간
,status         number(1) default 1   not null   -- 글삭제여부  1:사용가능한글,  0:삭제된글 
,deleteDay      date                             -- 글삭제시간
,commentCount   number default 0      not null   -- 댓글의 갯수
,fileName       varchar2(255)                    -- WAS(톰캣)에 저장될 파일명()
,orgFilename    varchar2(255)                   -- 진짜 파일명(강아지,png) // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
,fileSize       number                          -- 파일크기
,constraint  PK_noticeBoard_seq primary key(seq)
,constraint  FK_noticeBoard_admin foreign key(fk_member) references admin(seq)
,constraint  CK_noticeBoard_status check( status in(0,1) )
);

create sequence noticeBoardSeq
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;

select *
from noticeBoard
