-- LiClass Project 13개의 테이블 및 샘플 데이터

-- 1. li_admin

create table li_admin(              --관리자 계정
 admin_no number not null,          --관리자 번호
 admin_id varchar2(50) not null,    --관리자 아이디
 admin_pw varchar2(40) not null,    --관리자 비밀번호
 admin_name varchar2(30) not null,  --관리자 이름
 admin_email varchar2(40) not null,  --관리자 이메일
 
 constraint li_admin_pk primary key(admin_no)
);


--alter table li_admin modify (admin_name varchar2(30));


-- 03.29 은아 수정) 임의로 1을 넣고 시작해야하므로 start with 2로 해봅니다.
create sequence li_admin_seq
start with 2
increment by 1
minvalue 1
nocycle
cache 2;

comment on table li_admin is '관리자 계정 테이블';
comment on column li_admin.admin_no is '관리자 번호' ;
comment on column li_admin.admin_id is '관리자 아이디';
comment on column li_admin.admin_pw is '관리자 비밀번호';
comment on column li_admin.admin_name is '관리자 이름';
comment on column li_admin.admin_email is '관리자 이메일';

-- admin_no 번호 통일을 위해 여기서는 시퀀스를 사용하지않겠습니다.
insert into li_admin(admin_no, admin_id, admin_pw, admin_name, admin_email)
values(1, 'li_admin', 'admin1234', '최고관리자', 'Liclass_Admin@liclass.co.kr');

select * from li_admin;


--2. li_center

-- 센터 테이블
create table li_center(
    ct_bizno varchar2(30) not null,    --사업자등록번호
    ct_name varchar2(50) not null,     --센터명
    ct_opbiz_ym varchar2(20) not null,   --센터개업년월
    ct_intro clob not null,   --센터 소개
    ct_mainart clob not null,  --센터 주요작품
    ct_zipno number(10) not null,     --센터 우편번호
    ct_addr clob not null,    --센터 주소
    ct_detail_addr clob not null, --센터 상세주소
    ct_tel varchar2(30), --센터 대표전화
    ct_hmpg_addr varchar2(700), --센터 홈페이지주소
    ct_date date default sysdate not null, --센터 등록일

    constraint li_center_pk primary key(ct_bizno)
);

select * from li_center;

--drop table li_center;

comment on table li_center is '센터 테이블';
comment on column li_center.ct_bizno is '사업자등록번호';
comment on column li_center.ct_name is '센터명';
comment on column li_center.ct_opbiz_ym is '센터개업년월';
comment on column li_center.ct_intro is '센터 소개';
comment on column li_center.ct_mainart is '센터 주요작품';
comment on column li_center.ct_zipno is '센터 우편번호';
comment on column li_center.ct_addr is '센터 주소';
comment on column li_center.ct_detail_addr is '센터 상세주소';
comment on column li_center.ct_tel is '센터 대표전화';
comment on column li_center.ct_hmpg_addr is '센터 홈페이지주소';
comment on column li_center.ct_date is '센터 등록일';

select * from li_center;

--공방데이터 엑셀 임포트 해주세요.

-- 3. li_user (테이블,함수)

-- 사용자(li_user) 
-- (update 23.03.16 - 회원번호 랜덤생성함수 추가)  
-- (update 23.03.22 - 회원프로필사진 default img) 
-- (update 23.03.29 - 코멘트) 
-- (update 23.04.04 - 테이블 및 함수생성, 테스트용 insert 주석)
create table li_user (
	user_no	number NOT NULL,
	user_email varchar2(100) NOT NULL,
	user_pw	varchar2(255) NOT NULL,
	user_name varchar2(30) NOT NULL,
    
	user_tel varchar2(30),
    user_img	clob DEFAULT 'default-profile.png' NOT NULL,
    user_point number DEFAULT 0,
	user_regdate date DEFAULT sysdate NOT NULL,
    user_update date DEFAULT sysdate NOT NULL,
	user_unregdate	date,
	user_status	number	DEFAULT 0 NOT NULL,
    user_type number  DEFAULT 0 NOT NULL ,
    
   	constraint li_user_pk primary key(user_no),
   	constraint li_user_uk unique(user_email)
);

--drop table li_user;
    
comment on table li_user is '회원 테이블';
comment on column li_user.user_no is '회원번호';
comment on column li_user.user_email is '회원이메일';
comment on column li_user.user_pw is '회원비밀번호';
comment on column li_user.user_name is '회원이름';

comment on column li_user.user_tel  is '회원연락처';
comment on column li_user.user_img is '회원프로필사진';
comment on column li_user.user_point is '포인트';

comment on column li_user.user_regdate is '회원가입일자';
comment on column li_user.user_update is '회원수정일자';
comment on column li_user.user_unregdate is '회원탈퇴일자';
comment on column li_user.user_status is '회원계정상태(0:정상회원 1:탈퇴회원)';
comment on column li_user.user_type is '회원계정종류(0:이메일 1:카카오 2:네이버)'; 

--회원번호 생성 함수
CREATE OR REPLACE EDITIONABLE FUNCTION USER_NO_FUNC (sysdate IN date)
RETURN number IS
user_no number;
BEGIN 
  IF sysdate IS NULL OR sysdate = NULL THEN
    user_no := '0000000000';
  ELSE 
      SELECT to_char(sysdate,'YYMMDD') || ROUND(DBMS_RANDOM.VALUE (1000, 9999))
      INTO user_no 
      FROM dual;
  END IF;
  RETURN user_no;
EXCEPTION 
  WHEN OTHERS THEN
    RETURN '0000000000';
END user_no_func;

/

--샘플 데이터
--회원번호 통일을 위해 여기서는 함수를 사용하지 않겠습니다.
--계정상태 탈퇴/일반, 비밀번호 변경일 90일 지난 회원별 샘플입니다.
--비밀번호만료 알림창을 확인하려면 1번샘플 회원으로 로그인해주세요.

--1. 비밀번호 만료회원
--insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_regdate,user_update)
--values( '2303291111','test1111@gmail.com','1234','testUser1','01012341234','0','2022/03/29','2022/03/29');

--2. 일반회원
--insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
--values('2303292222','test2222@gmail.com','1234','testUser2','01012341234','0');

--3. 탈퇴회원
--insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_regdate,user_unregdate,user_status)
--values( '2303293333','test3333@gmail.com','1234','testUser3','01012341234','0','2022/03/29','2023/03/28','1');

--조원 아이디 (update 23.04.04)

--은아
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('9205045442','kimeunazip@naver.com','1234','김은아','01012341234','0');

--민섭
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2303290625','ics9133@gmail.com','1234','문민섭','01012341234','0');

--웅배
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2303290612','dndqo49@naver.com','1234','전웅배','01095990612','0');

--소영
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2303290722','wjdthdud13@naver.com','1234','정소영','01012341234','0');

--지민
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2001110723','jmlim1107@naver.com','1234','임지민','01012341234','0');

--경민
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2302282828','linda284@naver.com','0000','이경민','01017441744','0');

-- 기능확인을 위한 추가작업
 update li_user
 set user_regdate = '22/09/05', user_update = '22/09/05'
 where user_no = 9205045442;
 
 update li_user
 set user_regdate = '22/09/05', user_update = '22/09/05'
 where user_no = 2302282828;
 
  update li_user
 set user_regdate = '22/09/05', user_update = '22/09/05'
 where user_no = 2303290625;
 
  update li_user
 set user_regdate = '22/09/05', user_update = '22/09/05'
 where user_no = 2303290612;
 
  update li_user
 set user_regdate = '22/09/05', user_update = '22/09/05'
 where user_no = 2303290722;
 
  update li_user
 set user_regdate = '22/09/05', user_update = '22/09/05'
 where user_no = 2001110723;

--샘플데이터 추가 (update 23.04.04)
-- 이메일회원 4건 추가
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304044110,'kkkangone@naver.com','1234','강하나','01033265447','0');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304047208,'soooy@naver.com','1234','정수연','01087753653','0');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304041631,'leesuuu@naver.com','1234','이수윤','01034685436','0');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304048567,'minkyong@naver.com','1234','강민경','01086446735','0');


-- 카카오 5건 추가
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304049273,'kimarrrr@kakao.com','1234','areum','01012755320','1');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304043265,'dorishin1@kakao.com','1234','shintory','01087764254','1');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304042574,'hyungki@kakao.com','1234','hhhkkk','01012755320','1');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304046623,'chanhung@kakao.com','1234','channnel','01012755320','1');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304046837,'hangod@kakao.com','1234','godhan','01012755320','1');

-- 네이버 5건 추가
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304047291,'jinyung@naver.com','1234','김진영','01012755320','2');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304048961,'garam@naver.com','1234','진가람','010127551236','2');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304045019,'kimsora@naver.com','1234','김소라','01012755321','2');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304048491,'honghong@naver.com','1234','김홍준','01012552323','2');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304045275,'parkingg@naver.com','1234','박기윤','01012255321','2');

-- 탈퇴회원 5건 추가
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_status)
values(2304048460,'kimjiyoung@naver.com','1234','김지영','01012355321','0','1');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_status)
values(2304048469,'daidai@naver.com','1234','이대명','0100755323','0','1');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_status)
values(2304049937,'dongdonijng@naver.com','1234','진동진','01082755321','0','1');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_status)
values(2304046834,'chachasu@naver.com','1234','차수진','010547553323','0','1');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_status)
values(2304044849,'noaaa11@naver.com','1234','김소명','01012121321','0','1');


-- 4. li_qna

create table li_qna(
qna_no number not null,                    --공지,문의게시판 글번호
admin_no number,                           --관리자 번호
user_no number,                           --03.29 은아 추가. 있어야하는거 맞을까요?
qna_title varchar2(100) not null,          --공지,문의게시판 제목
qna_content varchar2(1000) not null,       --공지,문의게시판 내용
qna_date date default sysdate,             --공지,문의게시판 등록일
qna_date_fix date,                          --공지,문의게시판 수정일
qna_category varchar2(10) not null,        --공지,문의게시판 카테고리
qna_top_state number default 0 not null,   --공지사항,문의사항 구분 및 공지사항 상단 고정 상태값
qna_group number default 0,                          --문의게시판 답변 그룹번호
qna_indent number default 0,                         --문의게시판 답변글의 위치번호
qna_step number default 0,                           --문의게시판 답변글의 계층번호
    constraint li_qna_pk primary key(qna_no),
    constraint li_admin_fk1 foreign key(admin_no) references li_admin(admin_no),
    constraint li_admin_fk2 foreign key(user_no) references li_user(user_no) --03.29 은아 추가. 있어야하는거 맞을까요?
);  

commit;

select * from li_qna;

comment on table li_qna is '공지, 문의게시판';
comment on column li_qna.qna_no is '공지, 문의게시판 글번호';
comment on column li_qna.user_no is '문의게시판 작성회원번호'; --03.29 은아 추가. 있어야하는거 맞을까요?
comment on column li_qna.qna_title is '공지, 문의게시판 제목';
comment on column li_qna.qna_content is '공지, 문의게시판 내용';
comment on column li_qna.qna_date is '공지, 문의게시판 등록일';
comment on column li_qna.qna_date_fix is '공지, 문의게시판 수정일';
comment on column li_qna.qna_category is '공지사항,문의사항 카테고리';
comment on column li_qna.qna_top_state is '공지사항,문의사항 구분 및 공지사항 상단 고정 상태값';
comment on column li_qna.qna_group is '문의게시판 답변 그룹번호';
comment on column li_qna.qna_indent is '문의게시판 답변글의 위치번호';
comment on column li_qna.qna_step is '문의게시판 답변글의 계층번호';


-- 03.29 은아 수정) 임의로 9개를 넣고 시작해야하므로 start with 10로 해봅니다.

create sequence li_qna_seq
start with 10
increment by 1
minvalue 1
nocycle
cache 2;

-- 23.03.29 은아 추가
-- qna_no 번호 통일을 위해 여기서는 시퀀스를 사용하지않겠습니다.
-- 회원별 3개씩 문의글 만들어봅니다.
-- not null 컬럼 qna_top_state 우선 0으로 넣었는데 맞을까요?

--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(1,1,2303291111,'testQnaTitle1','testQnaContent1','문의','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(2,1,2303291111,'testQnaTitle2','testQnaContent2','문의','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(3,1,2303291111,'testQnaTitle3','testQnaContent3','문의','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(4,1,2303292222,'testQnaTitle4','testQnaContent4','문의','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(5,1,2303292222,'testQnaTitle5','testQnaContent5','문의','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(6,1,2303292222,'testQnaTitle6','testQnaContent6','문의','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(7,1,2303293333,'testQnaTitle7','testQnaContent7','문의','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(8,1,2303293333,'testQnaTitle8','testQnaContent8','문의','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(9,1,2303293333,'testQnaTitle9','testQnaContent9','문의','0');

--FAQ 게시판 문의글 수정했어요~~
--삭제 편하게 하실분들은 아래 delete문 2개 돌려주세요
--delete li_qna where qna_top_state = 0;
--delete li_qna where qna_top_state = 1;

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(1,9205045442,'클래스 상세정보가 더 궁금해요~','가죽공방 클래스듣고싶은데 난이도나 자세한 정보가 더 궁금해요~~','문의','0',1);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(2,2001110723,'클래스 비용이 너무 비싼거 같아요~','할인할수있는 방법있나요?','문의','0',2);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(3,2303290625,'클래스 예약했는데 날짜를 변경하고싶어요~','4/7로 했는데 4/14로 가능할까요~?','문의','0',3);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(4,2303290612,'클래스 자세한 장소가 알고싶어요~','상세주소는 예약하면 볼수있는 건가요?','문의','0',4);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(5,2303290722,'예약취소하고싶어요','취소방법이 궁금합니다.','문의','0',5);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(6,2302282828,'자리가 없는데 취소자리가 생겨날까요?','플라워클래스 꼭 듣고싶은데 ㅜㅜㅜ자리가없대요','문의','0',6);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(7,2001110723,'작가님 정보가 궁금해요','잘생겼나요????','문의','0',7);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(8,2303290625,'결제취소했는데 환불이 안됐어요ㅠㅠ','방금 취소했는데 언제되는거예요!!!당장해주세요!!','문의','0',8);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(9,9205045442,'클래스 예약도중 자리가 없어졌어요ㅠㅠ','그사이 자리가 꽉찬거일까요???','문의','0',9);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(10,2303290722,'아이디를 바꾸고싶은데 안되요ㅠㅠㅠ','아이디를 바꾸고싶은데 왜 안되는거예요????','문의','0',10);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(11,2302282828,'비밀번호를 바꾸고싶은데 안되요ㅠㅠㅠ','1234로 바꾸고싶은데 왜 안되는거예요????','문의','0',11);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(12,2303290612,'회원탈퇴하려면 어떻게 해야하나요','이 사이트 맘에 안들어서 탈퇴할래요','문의','0',12);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(13,9205045442,'클래스 사진정보를 더 볼 수 있나요?','클래스 사진정보가 너무 궁금해요 ','문의','0',13);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(14,2303290625,'제가 쓴 후기를 삭제하고싶은데 못찾겠어요','내가 쓴 후기 내역은 어디서 볼 수 있나요?','문의','0',14);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(15,2303290612,'여기 사장님 누구죠?','사장님 나오세요','문의','0',15);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(16,2303290722,'자리가 없는데 취소자리가 생겨날까요?','플라워클래스 꼭 듣고싶은데 ㅜㅜㅜ자리가없대요','문의','0',16);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(17,2001110723,'작가님 정보가 궁금해요','잘생겼나요????','문의','0',17);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(18,2302282828,'결제취소했는데 환불이 안됐어요ㅠㅠ','방금 취소했는데 언제되는거예요!!!당장해주세요!!','문의','0',18);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(19,2303290612,'클래스 예약도중 자리가 없어졌어요ㅠㅠ','그사이 자리가 꽉찬거일까요???','문의','0',19);

commit;
--select * from li_qna;


-- 5. li_class

-- 5. li_class

-- 클래스(Li_Class)생성 (update 23.03.23)                                                     
create table li_class (
	c_no number not null,                   --클래스 번호
    ct_bizno varchar2(30) not null,         --사업자 등록번호
    c_title varchar2(1000) not null,        --클래스 제목
    c_content clob not null,                --클래스 소개글
    c_category varchar2(10) not null,       --클래스 카테고리 ( 0.공예, 1.요리, 2.미술, 3.플라워, 4.뷰티, 5.체험및기타 )
    c_level varchar2(3) not null,           --클래스 난이도
    c_area varchar2(100) not null,          --클래스 지역
    c_luv number default 0 not null,        --클래스 관심수
    c_leadtime number not null,             --클래스 소요시간
    c_maxcnt number not null,               --클래스 최대인원
    c_mincnt number default 1 not null,     --클래스 최소인원
    c_date date default sysdate not null,   --클래스 등록일자
    c_state number default 0 not null,      --클래스 상태 ( 0:등록완료/예약가능, 1:삭제/예약불가 )
   	constraint li_class_pk primary key(c_no),
   	constraint li_class_fk foreign key(ct_bizno) references li_center(ct_bizno)
);
comment on table li_class is '클래스 테이블';
comment on column li_class.c_no is '클래스 번호';
comment on column li_class.c_title is '클래스 제목';
comment on column li_class.c_content is '클래스 소개글';
comment on column li_class.c_category is '클래스 카테고리';
comment on column li_class.c_level is '클래스 난이도';
comment on column li_class.c_area is '클래스 지역';
comment on column li_class.c_luv is '클래스 관심수';
comment on column li_class.c_leadtime is '클래스 소요시간';
comment on column li_class.c_maxcnt is '클래스 최대인원';
comment on column li_class.c_mincnt is '클래스 최소인원';
comment on column li_class.c_date is '클래스 등록일자';

-- 03.29 은아 수정) 임의로 10개 샘플을 넣고 시작해야하므로 start with 11로 해봅니다.
--클래스 번호 시퀀스
create sequence li_class_seq
increment by 1
start with 11
minvalue 1
nocycle
nocache;

-- 23.03.29 은아 추가
-- 샘플 클래스 10개
-- c_no 번호 통일을 위해 여기서는 시퀀스를 사용하지않겠습니다.
--1. 
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(1, 8584400500, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', '선물하기도 좋고 웨딩촬영, 브라이덜 샤워 등 사진촬영 소품으로도 쓰임새가 많은 꽃다발을 만들어요.
시들지 않도록 보존처리된 프리저브드 플라워 꽃다발은 물을 주거나 번거로운 관리 없이도 오랜기간 이쁘게 볼 수 있어서 인테리어 소품으로도 좋고요 특별한 의미의 선물이라면 시들거나 변하지 않아서 받는 분이 
오래오래 간직할 수 있습니다. 누군가에게 특별한 선물을 주고 싶다면 만드는 과정의 정성까지 담아 직접 만들어 보세요. 브라이덜 샤워나 우정 촬영 소품으로 친구들과 함께 준비하시면 좋은 추억이 되겠지요?',
3, '중', '경기 수원시', 1, 6);

--2.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(2, 8466400320, '홈카페의 시작, 핸드드립 원데이 클래스', 
'홈카페의 시작.. 원두고르기 부터 맛있게 추출하는 방법까지 핸드드립 원데이 클래스! 지금 시작해 보세요~!
남녀, 다양한 연령의, 커피에 관심있는 분들은 누구나 참여하실 수 있습니다!
뜨거운 물을 다루어야 하고 커피의 특성상 고등학생 이상 수업이 가능합니다. 반려동물과 함께 수업참여는 불가합니다.
다른날짜에 수업을 원하시는 경우 언제든 메세지로 문의해 주세요~가능한 시간에 최대한 맞춰드리고 있습니다~!
(주말수업을 원하실 경우 메세지로 문의주세요)',
1, '하', '경기 용인시', 2, 4);

--3.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(3, 1304758832, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', 
'자연스러운 멋이 있는 시나몬캔들, 왁스타블렛 클래스를 소개해 드립니다.
-시나몬 캔들
식물성 소이왁스로 캔들을 만들고 시나몬 스틱과 드라이플라워를 사용해 캔들을 원하는대로 꾸며보실 수 있는 클래스입니다. 
유리 컨테이너에 만들어 사용하시기에도 편한 캔들이예요. :)
-시나몬 왁스타블렛
천연 왁스인 밀랍(비즈왁스)로 왁스 타블렛을 만들고 시나몬 스틱과 드라이플라워로 예쁘게 꾸며봅니다.
왁스타블렛은 원하는 곳에 걸어두고 방향제로도 사용할 수 있어요. 좋은 향이 나는 예쁜 인테리어 소품 역할을 톡톡히 한답니다. :)',
0, '하', '경기 부천시', 2, 4);

--4.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 4, 6306200298, '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)', 
'세상에 하나밖에 없는 명품 나만의향기를 선물하세요..
- 명품향수를 베이스로 할용하고 나만의 향 30가지 중에 추가하여 세상에서 하나뿐인 향수를 만들 수 있습니다.
+ 향수 시향 후 페이퍼로 샤쉐처럼 이용할 수 있게 만들어드려요
+ 클래스 수강시 쿠폰 도장 꾹꾹꾹 방문하실때마다 혜택이 쏟아집니다.
+ 클래스 수강 후 똑같은 향을 또 즐기고싶다면, 택배로 발송 가능하다는 점!',
4, '하', '경기 안양시', 1, 4);

--5.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 5, 1352837035, '설레임을 담은 수제 여행용 키트 만들기', 
'여행 가기 좋은 날씨, 4월! 봄을 맞아 여행을 계획하고 있는 라이클래스 수강생들 있나요? 설레이는 여행을 더욱더 완벽하게 만들어줄 나만의 여행용품들을
직접 만들고 사용하면서 추억을 쌓아볼 수 있어요.',
0, '하', '경기도 수원시', 2, 6);

--6.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(6, 6306200298, '생활 속 소품이 가득, 한 땀 한 땀 프랑스자수 클래스', 
'프랑스자수에서 자주 사용하는 스티치 기법을
제대로 익혀두면, 클래스가 끝난 이후에도
혼자서 수놓을 수 있는 자신감이 생길 거예요.프랑스자수 클래스에서
수틀과 기본 재료 사용법 및 기초 매듭짓기부터
차근차근 알려드릴게요.',
0, '중', '경기도 의정부시', 1, 4);

--7.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 7, 8466400320, '홈파티 걱정은 그만! 자취생을 위한 요리 클래스', 
'자취생을 위한 요리 클래스,요리의 핵심이자 기초!
칼질과 불 조절이죠.기초부터 탄탄하게 알려드립니다:),자취 8년 차,
프로자취러 제이슨 작가님이 알려주는 간단한 레시피!따라 하면 금세 완성되는 근사한 요리들로,
홈파티 이제 더이상 어렵지 않을 거예요',
1, '하', '경기도 의왕시', 2, 7);

--8.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 8, 2885600271, '이런 가죽공예는 처음이야, 가죽 수제화 클래스', 
'전문가가 아닌 모두가 쉽게
자신만의 수제화를 만들어 볼 수 있도록
기초부터 꼼꼼하게 알려드리니,
수업을 차근차근 따라오시다 보면 어려움 없이
나만의 신발이 손에 놓여있을 거예요. 신발이 불편하진 않을까?란 생각을 버리고 나만의
보행을 고려한
입체적인 패턴과 천연 소 가죽을 사용해
양말을 신은 듯 편안한 착화감을
느끼실 수 있을 거예요!',
0, '하', '경기도 성남시', 2, 6);

--9.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 9, 8961600886, '프리미엄 유기농 애플망고 수제잼 만들기', 
'설탕 대신 프락토올리고당으로 만드는 수제잼 클래스 입니다
잼을 졸이며 방 안 가득 감도는 향긋한 과일 향에 취하다 보면 어느새 마음이 편안해진 나를 발견하게 됩니다.직접 만든 정성스러운 선물을 하고 싶으신 분들
잼을 만들어 보고 싶으신 분들
손으로 만드는 핸드 메이드가 좋으신 분들에게 추천합니다.',
1, '하', '경기도 수원시', 2, 8);

--10.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(10, 6670500768, '빵부터 직접 만들어보는 다이어트 샌드위치', 
'샌드위치 만드느라 야채를 구매하셨다가 시들어 버렸던 기억 있으시죠?
이제, 야채 아끼지 말고 팍팍 넣기로 해요!
내 손으로 만들어 깨끗하고 더 건강하게 만들 수 있는 샌드위치는
다이어트 식으로도 훌륭하고 야채를 더 맛있게 드실 수 있습니다.
특히 카페를 운영하시는 분들 중에 샌드위치 품목을 추가하고 싶으신 분들에게도 적합한 수업입니다.
재료 구입처와 레시피 알려드려요 :)',
1, '하', '경기도 광명시',2, 8);



--********** 테이블 변경내용 : DDL문에 모두 반영해놓았습니다! **********
--컬럼 변경(update 23.03.15)
--alter table li_class modify c_title varchar2(1000);
--alter table li_class modify c_level varchar2(3);
--alter table li_class modify c_area varchar2(100);
--alter table li_class modify c_luv number default 0;
--alter table li_class modify ct_bizno varchar2(30);
--칼럼 삭제(update 23.03.18)
--alter table li_class drop column c_state;
--제약조건 추가(update 23.03.19)
--alter table li_class add constraint li_class_fk foreign key(ct_bizno) references li_center(ct_bizno);
--************************************************************************

--********** sample data **********--
--create or replace procedure class_insert1
--is
--begin
--    for cnt in 1..30 loop
--        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
--        values( li_class_seq.nextval, 8584400500, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', '선물하기도 좋고 웨딩촬영, 브라이덜 샤워 등 사진촬영 소품으로도 쓰임새가 많은 꽃다발을 만들어요.
--        시들지 않도록 보존처리된 프리저브드 플라워 꽃다발은 물을 주거나 번거로운 관리 없이도 오랜기간 이쁘게 볼 수 있어서 인테리어 소품으로도 좋고요 특별한 의미의 선물이라면 시들거나 변하지 않아서 받는 분이 
--        오래오래 간직할 수 있습니다. 누군가에게 특별한 선물을 주고 싶다면 만드는 과정의 정성까지 담아 직접 만들어 보세요. 브라이덜 샤워나 우정 촬영 소품으로 친구들과 함께 준비하시면 좋은 추억이 되겠지요?',
--        3, '중', '경기 수원시', 1, 6);
--    end loop;
--    commit;
--end;
--/
--show error;
--EXECUTE class_insert1;
--
--create or replace procedure class_insert2
--is
--begin
--    for cnt in 1..30 loop
--        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
--        values( li_class_seq.nextval, 8466400320, '홈카페의 시작, 핸드드립 원데이 클래스', 
--        '홈카페의 시작.. 원두고르기 부터 맛있게 추출하는 방법까지 핸드드립 원데이 클래스! 지금 시작해 보세요~!
--        남녀, 다양한 연령의, 커피에 관심있는 분들은 누구나 참여하실 수 있습니다!
--        뜨거운 물을 다루어야 하고 커피의 특성상 고등학생 이상 수업이 가능합니다. 반려동물과 함께 수업참여는 불가합니다.
--        다른날짜에 수업을 원하시는 경우 언제든 메세지로 문의해 주세요~가능한 시간에 최대한 맞춰드리고 있습니다~!
--        (주말수업을 원하실 경우 메세지로 문의주세요)',
--        1, '하', '경기 용인시', 2, 4);
--    end loop;
--    commit;
--end;
--/
--show error;
--EXECUTE class_insert2;
--
--
--create or replace procedure class_insert3
--is
--begin
--    for cnt in 1..30 loop
--        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
--        values( li_class_seq.nextval, 1304758832, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', 
--        '자연스러운 멋이 있는 시나몬캔들, 왁스타블렛 클래스를 소개해 드립니다.
--        -시나몬 캔들
--        식물성 소이왁스로 캔들을 만들고 시나몬 스틱과 드라이플라워를 사용해 캔들을 원하는대로 꾸며보실 수 있는 클래스입니다. 
--        유리 컨테이너에 만들어 사용하시기에도 편한 캔들이예요. :)
--        
--        -시나몬 왁스타블렛
--        천연 왁스인 밀랍(비즈왁스)로 왁스 타블렛을 만들고 시나몬 스틱과 드라이플라워로 예쁘게 꾸며봅니다.
--        왁스타블렛은 원하는 곳에 걸어두고 방향제로도 사용할 수 있어요. 좋은 향이 나는 예쁜 인테리어 소품 역할을 톡톡히 한답니다. :)',
--        0, '하', '경기 부천시', 2, 4);
--    end loop;
--    commit;
--end;
--/
--show error;
--EXECUTE class_insert3;
--
--create or replace procedure class_insert4
--is
--begin
--    for cnt in 1..30 loop
--        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
--        values( li_class_seq.nextval, 6306200298, '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)', 
--        '세상에 하나밖에 없는 명품 나만의향기를 선물하세요..
--        - 명품향수를 베이스로 할용하고 나만의 향 30가지 중에 추가하여 세상에서 하나뿐인 향수를 만들 수 있습니다.
--        + 향수 시향 후 페이퍼로 샤쉐처럼 이용할 수 있게 만들어드려요
--        + 클래스 수강시 쿠폰 도장 꾹꾹꾹 방문하실때마다 혜택이 쏟아집니다.
--        + 클래스 수강 후 똑같은 향을 또 즐기고싶다면, 택배로 발송 가능하다는 점!',
--        4, '하', '경기 안양시', 1, 4);
--    end loop;
--    commit;
--end;
--/
--show error;
--EXECUTE class_insert4;
----*************************************************************************************************
--
--select count(*) from li_class;
--select * from li_class order by c_no desc;

update li_class set c_title = '커스텀! 에코백+파우치 원데이 클래스' where c_no=5;

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 11, '0200600028' , '반짝반짝 투명한 매력, 누구나 쉽게 배우는 레진공예', '내용은 수정으로', '0', '중', '경기 수원시', 3, 8, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 12, '2641001086' , '누구나 즐기는 드로잉 클래스 A.도안 B.백드롭 C.미러 페인팅', '내용은 수정으로', '2', '하', '경기 남양주시', 2, 4, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 13, '6072666671' , '양모로 그리는 따뜻한 그림?', '내용은 수정으로', '2', '하', '경기 포천시', 1, 15, 3 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 14, '8945000297' , '부드러운 MP비누 클래스', '내용은 수정으로', '4', '하', '경기 고양시', 1, 4, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 15, '5927100101' , '[DOG] 강아지 아로마테라피 케어제품 만들기 원데이 클래스', '내용은 수정으로', '5', '중', '경기 성남시', 2, 4, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 16, '2043018185' , '[자격증 과정] 제로웨이스트 전문강사 과정', '내용은 수정으로', '5', '상', '경기 안양시', 8, 4, 2 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 17, '1245329750' , '?프리저브드 플라워 ?미녀와 야수(中)', '내용은 수정으로', '3', '중', '경기 수원시', 1, 1, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 18, '1223120810' , '? 플라워 행잉 바스켓(스케줄은 문의 주세요)', '내용은 수정으로', '3', '중', '경기 부천시', 1, 2, 2 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 19, '6501100908' , '세상에 하나뿐인 색다른 초상화 남기기 팝아트초상화 클래스', '내용은 수정으로', '2', '하', '경기 수원시', 2, 3, 4 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 20, '5451300594' , '올인원으로 사용하는 약산성 샴푸바 만들기', '내용은 수정으로', '4', '중', '경기 용인시', 2, 4, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 21, '1641100542' , 'JMT! 달콤꾸덕한 아메리칸 쿠키 만들기', '내용은 수정으로', '1', '하', '경기 의정부시', 1, 12, 3 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 22, '3060480273' , '동글동글 딥펜 캘리그라피', '내용은 수정으로', '2', '중', '경기 수원시', 2, 6, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 23, '1390506312' , '오래오래 간직하는 아름다움, 프리저브드 플라워 박스?', '내용은 수정으로', '3', '중', '경기 고양시', 4, 4, 1 );

--6.li_class_img

--클래스 이미지(Li_Class_img)      (update 23.03.23)
create table li_class_img (
    c_img_no number not null,                            --사진번호
    c_no number not null,                                --클래스 번호
    c_img_file varchar2(500) not null,                   --이미지 이름
    thumb_file varchar2(500) not null,                   --썸네일 이름
    c_img_date date default sysdate not null,            --이미지 등록일
    constraint li_class_img_pk primary key(c_img_no),
    constraint li_class_img_uk unique(c_img_file),
    constraint li_class_img_fk foreign key(c_no) references li_class(c_no)
);
comment on table li_class_img is '클래스 이미지 테이블';
comment on column li_class_img.c_img_file is '이미지 이름';
comment on column li_class_img.thumb_file is '썸네일 이름';
comment on column li_class_img.c_img_date is '이미지 등록일';

-- 03.29 은아 수정) 임의로1~18을 넣고 시작해야하므로 start with 19로 해봅니다.

--사진 번호 시퀀스
create sequence li_class_img_seq
increment by 1
start with 11
minvalue 1
nocycle
nocache;

--********** 테이블 변경내용 : DDL문에 모두 반영해놓았습니다! **********
--alter table li_class_img drop constraint LI_CLASS_IMG_UK2;
--************************************************************************
select * from li_class_img;



-- 23.03.29 은아 추가
-- c_img_no 번호 통일을 위해 여기서는 시퀀스를 사용하지않겠습니다.
--c_no 1의 이미지 3장.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(1,1,'thumbnail_class_1629551284217_플라워1.jpg','class_1629551284217_플라워1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(2,1,'thumbnail_class_1629551284317_플라워2.jpg','class_1629551284317_플라워2.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(3,1,'thumbnail_class_1629521284217_플라워3.jpg','class_1629521284217_플라워3.jpg');

--c_no 2의 이미지 3장.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(4,2,'thumbnail_class_1629551784312_핸드드립1.jpg','class_1629551784312_핸드드립1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(5,2,'thumbnail_class_1629551284312_핸드드립2.jpg','class_1629551284312_핸드드립2.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(6,2,'thumbnail_class_1629551284313_핸드드립3.jpg','class_1629551284313_핸드드립3.jpg');

--c_no 3의 이미지 3장.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(7,3,'thumbnail_class_1679551784314_캔들1.jpg','class_1679551784314_캔들1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(8,3,'thumbnail_class_1679551784312_캔들2.jpg','class_1679551784312_캔들2.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(9,3,'thumbnail_class_1679551784514_캔들3.jpg','class_1679551784514_캔들3.jpg');

--c_no 4의 이미지 3장.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(10,4,'thumbnail_class_1679551633205_향수1.jpg','class_1679551633205_향수1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(11,4,'thumbnail_class_1679551634012_향수2.png','class_1679551634012_향수2.png');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(12,4,'thumbnail_class_1679551634013_향수3.png','class_1679551634013_향수3.png');

--5. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(13,5,'class5.jpg','thumbnail_class5.jpg');

--6. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(14,6,'class6.jpg','thumbnail_class6.jpg');

--7. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(15,7,'class7.jpg','thumbnail_class7.jpg');

--8. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(16,8,'class8.jpg','thumbnail_class8.jpg');

--9. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(17,9,'class9.jpg','thumbnail_class9.jpg');

--10. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(18,10,'class10.jpg','thumbnail_class10.jpg');


delete from li_class_img where c_img_no = 6;
delete from li_class_img where c_img_no = 10;
delete from li_class_img where c_img_no = 11;
delete from li_class_img where c_img_no = 12;
delete from li_class_img where c_img_no = 13;
delete from li_class_img where c_img_no = 14;
delete from li_class_img where c_img_no = 15;
delete from li_class_img where c_img_no = 16;
delete from li_class_img where c_img_no = 17;
delete from li_class_img where c_img_no = 18;

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(10, 4, 'class_1679551633205_향수1.jpg', 'thumbnail_class_1679551633205_향수1.jpg' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(11, 4, 'class_1679551634012_향수2.png', 'thumbnail_class_1679551634012_향수2.png' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(12, 4, 'class_1679551634013_향수3.png', 'thumbnail_class_1679551634013_향수3.png' );

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(13, 5, '클래스5_사진1.jpg', 'thumbnail_class_클래스5 사진1' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(14, 5, '클래스5_사진2.jpg', 'thumbnail_class_클래스5 사진2' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(15, 5, '클래스5_사진3.jpg', 'thumbnail_class_클래스5 사진3' );

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(16, 6, '클래스6_사진1.jpg', 'thumbnail_class_클래스6 사진1' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(17, 6, '클래스6_사진2.png', 'thumbnail_class_클래스6 사진2' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(18, 6, '클래스6_사진3.jpg', 'thumbnail_class_클래스6 사진3' );

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(19, 7, '클래스7_사진1.png', 'thumbnail_class_클래스7 사진1' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(20, 7, '클래스7_사진2.png', 'thumbnail_class_클래스7 사진2' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(21, 7, '클래스7_사진3.jpg', 'thumbnail_class_클래스7 사진3' );

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(22, 8, '클래스8_사진1.jpg', 'thumbnail_class_클래스8 사진1' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(23, 8, '클래스8_사진2.jpg', 'thumbnail_class_클래스8 사진2' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(24, 8, '클래스8_사진3.jpg', 'thumbnail_class_클래스8 사진3' );

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(25, 9, '클래스9_사진1.jpg', 'thumbnail_class_클래스9 사진1' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(26, 9, '클래스9_사진2.jpg', 'thumbnail_class_클래스9 사진2' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(27, 9, '클래스9_사진3.jpg', 'thumbnail_class_클래스9 사진3' );

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(28, 10, '클래스10_사진1.jpg', 'thumbnail_class_클래스10 사진1');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(32, 11, 'class_1679551918773_레진아트1.jpg', 'thumbnail_class_1679551918773_레진아트1.jpg');
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(30, 11, 'class_1679551932996_레진아트2.jpg', 'thumbnail_class_1679551932996_레진아트2.jpg');
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(31, 11, 'class_1679551938809_레진아트3.jpg', 'thumbnail_class_1679551938809_레진아트3.jpg');
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(29, 11, 'class_1679551946125_레진아트4.jpg', 'thumbnail_class_1679551946125_레진아트4.jpg');
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(33, 11, 'class_1679551954897_레진아트5.jpg', 'thumbnail_class_1679551954897_레진아트5.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(34, 12, 'class_1679551784314_미술1.jpg', 'thumbnail_class_1679551784314_미술1.jpg');
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(35, 12, 'class_1679551784430_미술2.jpg', 'thumbnail_class_1679551784430_미술2.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(36, 13, 'class_클래스13_사진1.jpg', 'thumbnail_class_클래스13_사진1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(37, 14, 'class_클래스14_사진1.jpg', 'thumbnail_class_클래스14_사진1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(38, 15, 'class_클래스15_사진1.jpg', 'thumbnail_class_클래스15_사진1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(39, 16, 'class_클래스16_사진1.jpg', 'thumbnail_class_클래스16_사진1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(40, 17, 'class_클래스17_사진1.png', 'thumbnail_class_클래스17_사진1.png');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(41, 18, 'class_클래스18_사진1.jpg', 'thumbnail_class_클래스18_사진1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(42, 19, 'class_클래스19_사진1.png', 'thumbnail_class_클래스19_사진1.png');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(43, 20, 'class_클래스20_사진1.png', 'thumbnail_class_클래스20_사진1.png');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(44, 21, 'class_클래스21_사진1.jpg', 'thumbnail_class_클래스21_사진1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(45, 22, 'class_클래스22_사진1.jpg', 'thumbnail_class_클래스22_사진1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(46, 23, 'class_클래스23_사진1.png', 'thumbnail_class_클래스23_사진1.png');

-- 04.04 2차 수정
update li_class_img set thumb_file = 'thumbnail_class_클래스5_사진1.jpg' where c_img_no = 13;
update li_class_img set thumb_file = 'thumbnail_class_클래스5_사진2.jpg' where c_img_no = 14;
update li_class_img set thumb_file = 'thumbnail_class_클래스5_사진3.jpg' where c_img_no = 15;
update li_class_img set thumb_file = 'thumbnail_class_클래스6_사진1.jpg' where c_img_no = 16;
update li_class_img set thumb_file = 'thumbnail_class_클래스6_사진2.png' where c_img_no = 17;
update li_class_img set thumb_file = 'thumbnail_class_클래스6_사진3.jpg' where c_img_no = 18;
update li_class_img set thumb_file = 'thumbnail_class_클래스7_사진1.png' where c_img_no = 19;
update li_class_img set thumb_file = 'thumbnail_class_클래스7_사진2.png' where c_img_no = 20;
update li_class_img set thumb_file = 'thumbnail_class_클래스7_사진3.jpg' where c_img_no = 21;
update li_class_img set thumb_file = 'thumbnail_class_클래스8_사진1.jpg' where c_img_no = 22;
update li_class_img set thumb_file = 'thumbnail_class_클래스8_사진2.jpg' where c_img_no = 23;
update li_class_img set thumb_file = 'thumbnail_class_클래스8_사진3.jpg' where c_img_no = 24;
update li_class_img set thumb_file = 'thumbnail_class_클래스9_사진1.jpg' where c_img_no = 25;
update li_class_img set thumb_file = 'thumbnail_class_클래스9_사진2.jpg' where c_img_no = 26;
update li_class_img set thumb_file = 'thumbnail_class_클래스9_사진3.jpg' where c_img_no = 27;
update li_class_img set thumb_file = 'thumbnail_class_클래스10_사진1.jpg' where c_img_no = 28;

update li_class_img set c_img_file = 'class_클래스5_사진1.jpg' where c_img_no = 13;
update li_class_img set c_img_file = 'class_클래스5_사진2.jpg' where c_img_no = 14;
update li_class_img set c_img_file = 'class_클래스5_사진3.jpg' where c_img_no = 15;
update li_class_img set c_img_file = 'class_클래스6_사진1.jpg' where c_img_no = 16;
update li_class_img set c_img_file = 'class_클래스6_사진2.png' where c_img_no = 17;
update li_class_img set c_img_file = 'class_클래스6_사진3.jpg' where c_img_no = 18;
update li_class_img set c_img_file = 'class_클래스7_사진1.png' where c_img_no = 19;
update li_class_img set c_img_file = 'class_클래스7_사진2.png' where c_img_no = 20;
update li_class_img set c_img_file = 'class_클래스7_사진3.jpg' where c_img_no = 21;
update li_class_img set c_img_file = 'class_클래스8_사진1.jpg' where c_img_no = 22;
update li_class_img set c_img_file = 'class_클래스8_사진2.jpg' where c_img_no = 23;
update li_class_img set c_img_file = 'class_클래스8_사진3.jpg' where c_img_no = 24;
update li_class_img set c_img_file = 'class_클래스9_사진1.jpg' where c_img_no = 25;


drop sequence li_class_seq;

create sequence li_class_seq
start with 24
increment by 1
minvalue 1
nocycle
nocache;

- 7. li_likes

-- 관심클래스(li_likes)      
--(update 23.03.29)

create table li_likes (
	like_no	number NOT NULL,
    like_regdate date DEFAULT sysdate NOT NULL,
	user_no number(10) NOT NULL,
	c_no number NOT NULL,
    
   	constraint like_no_pk primary key(like_no),
   	constraint user_no_fk foreign key(user_no) references li_user(user_no),
    constraint c_no_fk foreign key(c_no) references li_class(c_no)
);

--drop table li_likes;
    
comment on table li_likes is '관심클래스 테이블';
comment on column li_likes.like_no is '관심클래스번호';
comment on column li_likes.like_regdate  is '관심클래스등록일자';
comment on column li_likes.user_no is '회원번호';
comment on column li_likes.c_no is '클래스이름';

-- 03.29 은아 수정) 임의로 6개 샘플을 넣고 시작해야하므로 start with 7로 해봅니다.
--create sequence li_likes_seq
--start with 7
--increment by 1
--minvalue 1
--nocycle
--cache 2;
-- drop sequence li_likes_seq;

--샘플 데이터
-- like_no 번호 통일을 위해 여기서는 시퀀스를 사용하지않겠습니다.
-- 탈퇴회원을 제외하고 샘플 회원 2명 임의로 관심클래스 등록하겠습니다.
--
--insert into li_likes(like_no,like_regdate,user_no,c_no)
--values(1,sysdate,2303291111,5);
--
--insert into li_likes(like_no,like_regdate,user_no,c_no)
--values(2,sysdate,2303291111,6);
--
--insert into li_likes(like_no,like_regdate,user_no,c_no)
--values(3,sysdate,2303291111,7);
--
--insert into li_likes(like_no,like_regdate,user_no,c_no)
--values(4,sysdate,2303292222,8);
--
--insert into li_likes(like_no,like_regdate,user_no,c_no)
--values(5,sysdate,2303292222,9);
--
--insert into li_likes(like_no,like_regdate,user_no,c_no)
--values(6,sysdate,2303292222,10);

-- like_no는 상관없을것같아 시퀀스로 돌립니다.
create sequence li_likes_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,9205045442,1);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,9205045442,2);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,9205045442,3);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,9205045442,4);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,9205045442,5);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,9205045442,6);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,9205045442,7);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,9205045442,8);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,9205045442,9);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,9205045442,10);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290625,11);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290625,12);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290625,13);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290625,14);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290625,15);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290625,16);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290625,17);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290625,18);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290612,11);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290612,12);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290612,13);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290612,14);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290612,15);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290612,16);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290612,17);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290612,18);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290722,11);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290722,19);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290722,20);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290722,21);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290722,22);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290722,23);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290722,1);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2303290722,1);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2001110723,1);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2001110723,2);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2001110723,3);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2001110723,4);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2001110723,5);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2001110723,6);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2001110723,7);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2302282828,1);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2302282828,2);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2302282828,3);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2302282828,4);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2302282828,5);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2302282828,6);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(li_likes_seq.nextval,sysdate,2302282828,7);


--8. Li_episode
create table li_episode (
    ep_no number not null,                  
    c_no number not null,                   
    c_title varchar2(1000) not null, 
    ep_price number not null,               
    ep_date date not null,                  
    ep_cnt number default 0 not null,       
    constraint li_episode_pk primary key(ep_no),
    constraint li_episode_fk foreign key(c_no) references li_class(c_no)
);
comment on table li_episode is '클래스 회차 테이블';
comment on column li_episode.ep_no is '회차 번호';
comment on column li_episode.ep_price is '회차 가격';
comment on column li_episode.ep_date is '회차 날짜및시간';
comment on column li_episode.ep_cnt is '회차 예약인원';
comment on column li_episode.c_no is '회차 소속강좌 이름';
comment on column li_episode.c_title is '회차 소속강좌 번호';


insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date )
values( 1, 1 , '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스' , 52000, to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi') );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 2, 1 , '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 58000, to_date('2023/04/01 11:00','yyyy/mm/dd hh24:mi'),2 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 3, 1 , '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 58000, to_date('2023/04/01 14:00','yyyy/mm/dd hh24:mi'),6 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 4, 1 , '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 58000, to_date('2023/04/01 17:00','yyyy/mm/dd hh24:mi'),0 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 5, 1 , '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 58000, to_date('2023/04/02 11:00','yyyy/mm/dd hh24:mi'),3 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 6, 1 , '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 58000, to_date('2023/04/02 15:00','yyyy/mm/dd hh24:mi'),6 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 7, 1 , '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 53000, to_date('2023/04/03 11:00','yyyy/mm/dd hh24:mi'),0 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 8, 1 , '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 55000, to_date('2023/04/03 15:00','yyyy/mm/dd hh24:mi'),2 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 9, 1 , '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 53000, to_date('2023/04/04 11:00','yyyy/mm/dd hh24:mi'),1 );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 10, 1 , '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 55000, to_date('2023/04/04 15:00','yyyy/mm/dd hh24:mi'),0 );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 11, 1 , '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 100, to_date('2023/04/04 17:00','yyyy/mm/dd hh24:mi'),0 );

insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 12, 2 , '홈카페의 시작, 핸드드립 원데이 클래스', 25000, to_date('2023/04/12 09:00','yyyy/mm/dd hh24:mi'),0 );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 13, 2 , '홈카페의 시작, 핸드드립 원데이 클래스', 30000, to_date('2023/04/12 15:00','yyyy/mm/dd hh24:mi'),2 );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 14, 2 , '홈카페의 시작, 핸드드립 원데이 클래스', 25000, to_date('2023/04/13 09:00','yyyy/mm/dd hh24:mi'),0 );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 15, 2 , '홈카페의 시작, 핸드드립 원데이 클래스', 25000, to_date('2023/04/14 09:00','yyyy/mm/dd hh24:mi'),1 );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 16, 2 , '홈카페의 시작, 핸드드립 원데이 클래스', 35000, to_date('2023/04/15 15:00','yyyy/mm/dd hh24:mi'),1 );



--이전 에피소드 16개 + 새로운 에피소드 54개 = 70개
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 17, 1 , 52000, to_date('2023/04/18 11:00','yyyy/mm/dd hh24:mi'),3,'누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 18, 1 , 52000, to_date('2023/04/19 11:00','yyyy/mm/dd hh24:mi'), '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title )
values( 19, 1 , 54000, to_date('2023/04/21 15:00','yyyy/mm/dd hh24:mi'),6,'누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 20, 1 , 53000, to_date('2023/04/24 14:00','yyyy/mm/dd hh24:mi'),'누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 21, 1 , 53000, to_date('2023/04/25 14:00','yyyy/mm/dd hh24:mi'),'누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 22, 1 , 53000, to_date('2023/04/26 14:00','yyyy/mm/dd hh24:mi'),2, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 23, 1 , 53000, to_date('2023/04/27 14:00','yyyy/mm/dd hh24:mi'), '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 24, 1 , 53000, to_date('2023/04/28 14:00','yyyy/mm/dd hh24:mi'), '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스' ); 

insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 25, 2 , 25000, to_date('2023/04/18 13:00','yyyy/mm/dd hh24:mi'), '홈카페의 시작, 핸드드립 원데이 클래스' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 26, 2 , 26000, to_date('2023/04/19 13:00','yyyy/mm/dd hh24:mi'), 3, '홈카페의 시작, 핸드드립 원데이 클래스' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 27, 2 , 26000, to_date('2023/04/20 14:00','yyyy/mm/dd hh24:mi'), '홈카페의 시작, 핸드드립 원데이 클래스' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 28, 2 , 26000, to_date('2023/04/21 15:00','yyyy/mm/dd hh24:mi'), 2, '홈카페의 시작, 핸드드립 원데이 클래스' ); 

insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 29, 3 , 27000, to_date('2023/04/12 13:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 30, 3 , 27000, to_date('2023/04/12 15:00','yyyy/mm/dd hh24:mi'),2, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 31, 3 , 27000, to_date('2023/04/13 13:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 32, 3 , 27000, to_date('2023/04/13 16:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 33, 3 , 28000, to_date('2023/04/14 17:00','yyyy/mm/dd hh24:mi'), 4, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 34, 3 , 30000, to_date('2023/04/15 13:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 35, 3 , 30000, to_date('2023/04/16 14:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 36, 3 , 27000, to_date('2023/04/18 14:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 37, 3 , 27000, to_date('2023/04/19 13:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 38, 3 , 27000, to_date('2023/04/20 15:00','yyyy/mm/dd hh24:mi'), 3, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 39, 3 , 27000, to_date('2023/04/21 14:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 40, 3 , 30000, to_date('2023/04/22 14:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 41, 3 , 30000, to_date('2023/04/23 14:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 42, 3 , 27000, to_date('2023/04/24 14:00','yyyy/mm/dd hh24:mi'), 1, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 43, 3 , 27000, to_date('2023/04/24 18:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 44, 3 , 27000, to_date('2023/04/25 14:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 45, 3 , 27000, to_date('2023/04/26 14:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 46, 3 , 27000, to_date('2023/04/27 14:00','yyyy/mm/dd hh24:mi'), 2, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 47, 3 , 27000, to_date('2023/04/28 14:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 48, 3 , 30000, to_date('2023/04/29 14:00','yyyy/mm/dd hh24:mi'), '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 49, 3 , 30000, to_date('2023/04/29 18:00','yyyy/mm/dd hh24:mi'), 4, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기' ); 

insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 50, 4 , 47000, to_date('2023/04/15 11:00','yyyy/mm/dd hh24:mi'), '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 51, 4 , 49000, to_date('2023/04/15 13:00','yyyy/mm/dd hh24:mi'), 3, '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 52, 4 , 47000, to_date('2023/04/16 11:00','yyyy/mm/dd hh24:mi'), '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 53, 4 , 49000, to_date('2023/04/16 13:00','yyyy/mm/dd hh24:mi'), 1, '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 54, 4 , 47000, to_date('2023/04/22 11:00','yyyy/mm/dd hh24:mi'), 2, '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 55, 4 , 49000, to_date('2023/04/23 13:00','yyyy/mm/dd hh24:mi'), '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 56, 4 , 47000, to_date('2023/04/29 11:00','yyyy/mm/dd hh24:mi'), '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 57, 4 , 49000, to_date('2023/04/29 13:00','yyyy/mm/dd hh24:mi'), '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 58, 4 , 49000, to_date('2023/04/30 13:00','yyyy/mm/dd hh24:mi'), '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)' );

insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 59, 5 , 40000, to_date('2023/04/21 13:00','yyyy/mm/dd hh24:mi'), '커스텀! 에코백+파우치 원데이 클래스' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 60, 5 , 40000, to_date('2023/04/21 16:00','yyyy/mm/dd hh24:mi'), 2, '커스텀! 에코백+파우치 원데이 클래스' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 61, 5 , 40000, to_date('2023/04/22 13:00','yyyy/mm/dd hh24:mi'), '커스텀! 에코백+파우치 원데이 클래스' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 62, 5 , 40000, to_date('2023/04/22 16:00','yyyy/mm/dd hh24:mi'), '커스텀! 에코백+파우치 원데이 클래스' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 63, 5 , 40000, to_date('2023/04/23 13:00','yyyy/mm/dd hh24:mi'), '커스텀! 에코백+파우치 원데이 클래스' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 64, 5 , 40000, to_date('2023/04/23 16:00','yyyy/mm/dd hh24:mi'), '커스텀! 에코백+파우치 원데이 클래스' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 65, 5 , 40000, to_date('2023/04/28 13:00','yyyy/mm/dd hh24:mi'), '커스텀! 에코백+파우치 원데이 클래스' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 66, 5 , 40000, to_date('2023/04/28 16:00','yyyy/mm/dd hh24:mi'), '커스텀! 에코백+파우치 원데이 클래스' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 67, 5 , 40000, to_date('2023/04/29 13:00','yyyy/mm/dd hh24:mi'), '커스텀! 에코백+파우치 원데이 클래스' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 68, 5 , 40000, to_date('2023/04/29 16:00','yyyy/mm/dd hh24:mi'), '커스텀! 에코백+파우치 원데이 클래스' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 69, 5 , 40000, to_date('2023/04/30 13:00','yyyy/mm/dd hh24:mi'), '커스텀! 에코백+파우치 원데이 클래스' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 70, 5 , 40000, to_date('2023/04/30 16:00','yyyy/mm/dd hh24:mi'), '커스텀! 에코백+파우치 원데이 클래스' );

insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 71, 11 , 38500, to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 6, '반짝반짝 투명한 매력, 누구나 쉽게 배우는 레진공예'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 72, 12 , 19000, to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 4, '누구나 즐기는 드로잉 클래스 A.도안 B.백드롭 C.미러 페인팅'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 73, 12 , 19000, to_date('2023/03/25 17:00','yyyy/mm/dd hh24:mi'), 2, '누구나 즐기는 드로잉 클래스 A.도안 B.백드롭 C.미러 페인팅'); 

create sequence li_episode_seq
start with 74
increment by 1
minvalue 1
nocycle
nocache;





-- 9. li_reserve
create table li_reserve (
    r_no number not null,                       --예약번호
    user_no number not null,                    --회원번호
    ep_no number not null,                      --회차번호
    c_title varchar2(1000) not null,            --클래스 제목
    r_date date not null,                       --예약일자
    reg_date date default sysdate not null,     --예약진행일자
    r_state number default 1 not null,          --예약상태 1:예약중(결제예정) / 2:예약완료(결제완료) / 3: 예약취소(환불) 
    r_price number not null,                    --예약금액
    r_cnt number not null,                      --예약인원
    
    constraint li_reserve primary key(r_no),
    constraint li_reserve_fk1 foreign key(ep_no) references li_episode(ep_no),
    constraint li_reserve_fk2 foreign key(user_no) references li_user(user_no) 
);

comment on table li_reserve is '클래스 예약 테이블';
comment on column li_reserve.r_no is '예약 번호';
comment on column li_reserve.r_date is '예약 일자';
comment on column li_reserve.r_state is '예약 상태';
comment on column li_reserve.r_price is '예약 금액';
comment on column li_reserve.r_cnt is '예약 인원';
comment on column li_reserve.reg_date is '예약 수행일자';
comment on column li_reserve.user_no is '예약자 번호';
comment on column li_reserve.ep_no is '예약회차 번호';
comment on column li_reserve.c_title is '예약강좌 이름';

insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 1, 9205045442, 2, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 2, 116000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 2, 9205045442, 11, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',to_date('2023/04/04 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 3, 1, 55000 ); --예약취소
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 3, 2302282828, 3, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/04/01 14:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 6, 348000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 4, 2001110723, 5, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/04/02 11:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 3, 174000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 5, 2303290722, 6, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/04/02 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 6, 348000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 6, 2303290612, 8, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/04/03 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 3, 159000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 7, 2303290625, 9, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/04/04 11:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 1, 53000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 8, 9205045442, 13, '홈카페의 시작, 핸드드립 원데이 클래스', to_date('2023/04/12 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 2, 60000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 9, 2302282828, 15, '홈카페의 시작, 핸드드립 원데이 클래스', to_date('2023/04/14 09:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 1, 25000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 10, 2302282828, 16, '홈카페의 시작, 핸드드립 원데이 클래스', to_date('2023/04/15 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 1, 35000 );

alter table li_reserve add REVIEW_STATUS NUMBER default 0 not null;
comment on column li_reserve.review_status is '리뷰상태';

--이전 예약데이터 10개 + 새로운 예약데이터 15개 = 25개
--예약번호 14, 16., 17 == 환불된 예약건들
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 11, 2302282828, 17, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('23/04/18 11:00','yyyy/mm/dd hh24:mi'), 2, 3, 156000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 12, 2001110723, 19, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('23/04/18 15:00','yyyy/mm/dd hh24:mi'), 2, 6, 324000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 13, 2303290722, 22, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('23/04/26 14:00','yyyy/mm/dd hh24:mi'), 2, 2, 106000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 14, 2303290612, 26, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('23/04/19 13:00','yyyy/mm/dd hh24:mi'), 3, 3, 78000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 15, 2303290625, 28, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('23/04/21 15:00','yyyy/mm/dd hh24:mi'), 2, 2, 52000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 16, 9205045442, 30, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('23/04/12 15:00','yyyy/mm/dd hh24:mi'), 3, 2, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 17, 2302282828, 33, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('23/04/14 17:00','yyyy/mm/dd hh24:mi'), 3, 4, 112000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 18, 2001110723, 38, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('23/04/20 15:00','yyyy/mm/dd hh24:mi'), 2, 3, 81000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 19, 2303290722, 42, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('23/04/24 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 27000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 20, 2303290612, 46, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('23/04/27 14:00','yyyy/mm/dd hh24:mi'), 2, 2, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 21, 2303290625, 49, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('23/04/29 18:00','yyyy/mm/dd hh24:mi'), 2, 4, 120000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 22, 9205045442, 51, '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)', to_date('23/04/15 13:00','yyyy/mm/dd hh24:mi'), 2, 3, 147000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 23, 2302282828, 53, '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)', to_date('23/04/16 13:00','yyyy/mm/dd hh24:mi'), 2, 1, 49000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 24, 2001110723, 54, '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)', to_date('23/04/22 11:00','yyyy/mm/dd hh24:mi'), 2, 2, 94000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 25, 2303290722, 60, '커스텀! 에코백+파우치 원데이 클래스)', to_date('23/04/21 16:00','yyyy/mm/dd hh24:mi'), 2, 2, 80000 );

insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 26, 2302282828, 71, '반짝반짝 투명한 매력, 누구나 쉽게 배우는 레진공예', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 27, 2001110723, 71, '반짝반짝 투명한 매력, 누구나 쉽게 배우는 레진공예', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 28, 2303290722, 71, '반짝반짝 투명한 매력, 누구나 쉽게 배우는 레진공예', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 29, 2303290612, 71, '반짝반짝 투명한 매력, 누구나 쉽게 배우는 레진공예', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 30, 2303290625, 71, '반짝반짝 투명한 매력, 누구나 쉽게 배우는 레진공예', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 31, 9205045442, 71, '반짝반짝 투명한 매력, 누구나 쉽게 배우는 레진공예', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );

insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 32, 2302282828, 72, '누구나 즐기는 드로잉 클래스 A.도안 B.백드롭 C.미러 페인팅', to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 33, 2001110723, 72, '누구나 즐기는 드로잉 클래스 A.도안 B.백드롭 C.미러 페인팅', to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 34, 2303290722, 72, '누구나 즐기는 드로잉 클래스 A.도안 B.백드롭 C.미러 페인팅', to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 35, 2303290612, 72, '누구나 즐기는 드로잉 클래스 A.도안 B.백드롭 C.미러 페인팅', to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 36, 2303290625, 73, '누구나 즐기는 드로잉 클래스 A.도안 B.백드롭 C.미러 페인팅', to_date('2023/03/25 17:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 37, 9205045442, 73, '누구나 즐기는 드로잉 클래스 A.도안 B.백드롭 C.미러 페인팅', to_date('2023/03/25 17:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );

--11.li_payment
create table li_payment (            -- 결제 테이블
    merchant_uid    varchar2(50)  not null, -- 주문번호
    r_no            number        not null, -- 예약번호
    user_no         number        not null, -- 회원번호
    pay_pg          varchar2(50)  not null, -- pg사 구분코드
    pay_method      varchar2(50)  not null, -- 결제수단 구분코드
    pay_name        varchar2(100)  not null, -- 결제대상 제품명
    pay_price       number        not null, -- 결제금액
    pay_buyer_name  varchar2(30)  not null, -- 주문자명
    pay_buyer_tel   varchar2(50)  not null, -- 주문자 연락처
    pay_buyer_email varchar2(100) not null, -- 주문자 이메일
    pay_date        date default  sysdate,  -- 결제일자
    pay_status      number        not null,  -- 결제상태  0: 성공, 1:취소, 2:실패, 3:환불
    
    constraint li_payment_pk primary key(merchant_uid),
    constraint li_refund_fk foreign key(r_no) references li_reserve(r_no)
);

comment on table li_payment is '결제 테이블';
comment on column li_payment.merchant_uid    is '주문번호';
comment on column li_payment.r_no            is '예약번호';
comment on column li_payment.user_no         is '회원번호';
comment on column li_payment.pay_pg          is 'pg사 구분코드';
comment on column li_payment.pay_method      is '결제수단 구분코드';
comment on column li_payment.pay_name        is '결제대상 제품명';
comment on column li_payment.pay_price       is '결제금액';
comment on column li_payment.pay_buyer_name  is '주문자명';
comment on column li_payment.pay_buyer_tel   is '주문자 연락처';
comment on column li_payment.pay_buyer_email is '주문자 이메일';
comment on column li_payment.pay_date        is '결제일자';
comment on column li_payment.pay_status      is '결제상태';

--시퀀스 사용안함..

insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-1',1, 9205045442,'html5_inicis','card','누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',116000,'testUser1','01012341234','test1111@gmail.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-2',2, 9205045442,'html5_inicis','card','누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',55000,'testUser2','01012341234','test2222@gmail.com',3);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-3',3, 2302282828,'html5_inicis','card','누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',348000,'이경민','01017441744','linda284@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-4',4, 2001110723,'html5_inicis','card','누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',174000,'임지민','01012341234','jmlim1107@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-5',5, 2303290722,'html5_inicis','card','누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',348000,'정소영','01012341234','wjdthdud13@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-6',6, 2303290612,'html5_inicis','card','누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',159000,'전웅배','01095990612','dndqo49@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-7',7, 2303290625,'html5_inicis','card','누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',53000,'문민섭','01012341234','ics9133@gmail.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-8',8, 9205045442,'html5_inicis','card','홈카페의 시작, 핸드드립 원데이 클래스',60000,'김은아','01012341234','kimeunazip@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-9',9, 2302282828,'html5_inicis','card','홈카페의 시작, 핸드드립 원데이 클래스',25000,'이경민','01017441744','linda284@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-10',10, 2302282828,'html5_inicis','card','홈카페의 시작, 핸드드립 원데이 클래스',35000,'이경민','01017441744','linda284@naver.com',0);

insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-11',11, 2302282828,'html5_inicis','card','누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',156000,'이경민','01017441744','linda284@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-12',12, 2001110723,'html5_inicis','card','누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',324000,'임지민','01012341234','jmlim1107@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-13',13, 2303290722,'html5_inicis','card','누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',106000,'정소영','01012341234','wjdthdud13@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-14',14, 2303290612,'html5_inicis','card','누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',78000,'전웅배','01095990612','dndqo49@naver.com',3);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-15',15, 2303290625,'html5_inicis','card','누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',52000,'문민섭','01012341234','ics9133@gmail.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-16',16, 9205045442,'html5_inicis','card','따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기',54000,'김은아','01012341234','kimeunazip@naver.com',3);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-17',17, 2302282828,'html5_inicis','card','따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기',112000,'이경민','01017441744','linda284@naver.com',3);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-18',18, 2001110723,'html5_inicis','card','따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기',81000,'임지민','01012341234','jmlim1107@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-19',19, 2303290722,'html5_inicis','card','따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기',27000,'정소영','01012341234','wjdthdud13@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-20',20, 2303290612,'html5_inicis','card','따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기',54000,'전웅배','01095990612','dndqo49@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-21',21, 2303290625,'html5_inicis','card','따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기',120000,'문민섭','01012341234','ics9133@gmail.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-22',22, 9205045442,'html5_inicis','card','오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)',147000,'김은아','01012341234','kimeunazip@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-23',23, 2302282828,'html5_inicis','card','오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)',49000,'이경민','01017441744','linda284@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-24',24, 2001110723,'html5_inicis','card','오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)',94000,'임지민','01012341234','jmlim1107@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-25',25, 2303290722,'html5_inicis','card','오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)',80000,'정소영','01012341234','wjdthdud13@naver.com',0);


--12.li_refund

create table li_refund(
    refund_no     number       not null, -- 환불번호
    merchant_uid  varchar2(50) not null, -- 주문번호
    user_no       number       not null, -- 회원번호
    refund_date   date default sysdate,  -- 환불일자
    refund_price  number       not null, -- 환불금액
    refund_method varchar2(50) not null, -- 환불수단
    refund_status number       not null,  -- 환불상태 0 = 환불 성공, 1 = 환불 실패
    
    constraint li_refund_pk primary key(refund_no),
    constraint li_refund_fk2 foreign key(merchant_uid) references li_payment(merchant_uid),
    constraint li_refund_fk3 foreign key(user_no) references li_user(user_no)
);

comment on table li_refund is '환불 테이블';
comment on column li_refund.refund_no     is '환불번호';
comment on column li_refund.merchant_uid  is '주문번호';
comment on column li_refund.user_no       is '회원번호';
comment on column li_refund.refund_date   is '환불일자';
comment on column li_refund.refund_price  is '환불금액';
comment on column li_refund.refund_method is '환불수단';
comment on column li_refund.refund_status is '환불상태';


insert into li_refund(REFUND_NO,MERCHANT_UID,USER_NO,REFUND_PRICE,REFUND_METHOD,REFUND_STATUS)
values(1,'KH-LICLASS-14','2303290612',78000,'card',0);
insert into li_refund(REFUND_NO,MERCHANT_UID,USER_NO,REFUND_PRICE,REFUND_METHOD,REFUND_STATUS)
values(2,'KH-LICLASS-16','9205045442',54000,'card',0);
insert into li_refund(REFUND_NO,MERCHANT_UID,USER_NO,REFUND_PRICE,REFUND_METHOD,REFUND_STATUS)
values(3,'KH-LICLASS-17','2302282828',112000,'card',0);
insert into li_refund(REFUND_NO,MERCHANT_UID,USER_NO,REFUND_PRICE,REFUND_METHOD,REFUND_STATUS)
values(4,'KH-LICLASS-2','9205045442',55000,'card',0);


--13.
-- 스튜디오 테이블
create table li_studio(
    s_no number(20) not null, --스튜디오게시판 글번호
    ct_bizno varchar2(30) not null, --사업자등록번호
    s_title varchar2(300) not null, --스튜디오게시판 제목
    s_content varchar2(700) not null, --스튜디오게시판 내용
    s_date date default sysdate, --스튜디오게시판 작성일
    s_thumb varchar2(700), --스튜디오게시판 썸네일
    s_file varchar2(700), --스튜디오게시판 파일명

    constraint li_studio_pk primary key(s_no),
    constraint li_studio_fk foreign key(ct_bizno)
                               references li_center(ct_bizno)

);


--drop table li_studio;
--drop sequence li_studio_seq;

comment on table li_studio is '스튜디오 테이블';
comment on column li_studio.s_no is '스튜디오게시판 글번호';
comment on column li_studio.ct_bizno is '사업자등록번호';
comment on column li_studio.s_title is '스튜디오게시판 제목';
comment on column li_studio.s_content is '스튜디오게시판 내용';
comment on column li_studio.s_date is '스튜디오게시판 작성일';
comment on column li_studio.s_thumb is '스튜디오게시판 썸네일';
comment on column li_studio.s_file is '스튜디오게시판 파일명';

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(1, '6670500768', '수수떡케이크 홍보', '인스타 @soosoo_cake

수수케이크 / 광명떡케이크 / 광명앙금플라워 / 광명답례떡

??Gwangmyeong, Korea (경기도 광명 7호선 철산역)
??KFDA 1급 수료
??앙금플라워 정규/원데이 클래스 운영 및 판매
??떡 원데이클래스 운영
??문의??카카오톡 플러스친구 수수케이크 (dm??)
pf.kakao.com/_xiDAxlxl', 'thumbnail_studio_1680068537446_soosoo.png', 'studio_1680068537446_soosoo.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(2, '6538102174', '해윰 홍보', '제철 딸기로 만들어진 리얼 딸기청 입니다.
해윰으로 오셔서 함께 만들어보시지 않을래요?', 'thumbnail_studio_1680068580449_해윰.png', 'studio_1680068580449_해윰.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(3, '4121097783', '헬로해피 홍보', '바느질과 바구니 만들기의 콜라보
오셔서 함께 만들어보아요', 'thumbnail_studio_1680068614488_hellohappy.jpg', 'studio_1680068614488_hellohappy.jpg');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(4, '8177000186', '링메이드 반지공방 홍보', '함께 예쁜 반지 만들어보아요',
    'thumbnail_studio_1680068691710_링메이드.jpg', 'studio_1680068691710_링메이드.jpg');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(5, '1113274803', '동두천공방 더봄아뜰리에 홍보', '인스타 @thebom_atelier

동두천공방 더봄아뜰리에
더봄아뜰리에
동두천공방
동두천 향기공방
동두천 캔들/디퓨저/석고방향제/플라워캔들
천연비누/천연화장품/향수/천연입욕제
원데이클래스
취미/자격증/창업과정
단체선물/답례품/인테리어소품
단체수업/기업출강
카카오ID:더봄아뜰리에
linktr.ee/thebom_atelier', 'thumbnail_studio_1680068799843_더봄아뜰리에.png', 'studio_1680068799843_더봄아뜰리에.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(6, '1011445141', '쫄깃방앗간 홍보', '인스타 : @chewymill

??????????????? | 핸드메이드 인형 | 취미생활 DIY
놀이 공원 및 테마파크
? 가슴 쫄깃한 키덜트 취미생활
? 지친 나를 응원해주는 작은 친구들
? 두둠칫 재미있는 핸드메이드 DIY
?
? Kidult Brand｜@wittypixy
? Made by｜@choran_log
-
linktr.ee/chewymill', 'thumbnail_studio_1680068852892_쫄깃방앗간.png', 'studio_1680068852892_쫄깃방앗간.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(7, '0200600028', '아임유얼ring 홍보', '인스타 : @iam_your_ring
Yes, I AM
#플레이모빌키링 #플모키링 #토이키링 #태슬키링 #빈티지토이#플레이모빌??
?클래스문의는 DM 혹은 카톡 고고!
?구매문의도 DM 혹은 카톡 고고!
?카카오플러스친구은 yes_iam 이예용.
?아이디어,디자인 도용금지 합니다?
m.smartstore.naver.com/iam_your_ring', 'thumbnail_studio_1680068887485_아임유얼링.png', 'studio_1680068887485_아임유얼링.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(8, '2299012336', '꿈블룸 홍보', '인스타 @kkooomblooom

경기도 성남시 중원구 금광동에 위치한 세라믹, 아트 스튜디오 입니다.
소수정예의 도자기 수강과 미술 수업이 이루어지며  예술감성을 나누는 공간입니다. ;)', 'thumbnail_studio_1680068932139_꿈블룸.png', 'studio_1680068932139_꿈블룸.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(9, '1641100542', '앙베르디저트스튜디오 홍보', '인스타 @anverscake

?레터링케이크클래스/의정부레터링케이크/앙베르케이크

?[디자인케이크] 출간
?? 레터링케이크창업클래스
?? 커스텀케이크예약주문제작(일.월 휴무)
유기농밀가루로 신선하게 굽는 케이크
010.9978.4684 (카카오톡anvers)
?의정부시 망월로 28번길 5 .1층
?[디자인케이크]책 온라인구매
?
link.inpock.co.kr/anverscake', 'thumbnail_studio_1680069012758_앙베르디저트스튜디오.png', 'studio_1680069012758_앙베르디저트스튜디오.png');



--스튜디오 테이블 시퀀스
create sequence li_studio_seq
start with 10
increment by 1
minvalue 1
nocycle
nocache;


select * from li_studio;

--10.

------------------ 후기 테이블 -----------------------------

CREATE TABLE Li_Review(
    review_no NUMBER(4) primary key,        -- 리뷰 번호
    review_title varchar2(100) not null,    -- 리뷰 제목
    review_content CLOB not null,           -- 리뷰 콘텐츠
    review_date DATE not null,              -- 리뷰 업로드일
    review_update DATE NULL,                -- 리뷰 업데이트일
    review_status NUMBER(2) not null,       -- 리뷰 상태
    review_rating number(2) null,           -- 리뷰 별점
    review_recommend varchar2(40) null,     -- 리뷰 추천(yes/no)
    
    -- (외래키)
    r_no number not null,                       -- 예약 번호
    c_no NUMBER(8) not null,                    -- 클래스 번호
    user_no NUMBER not null,                    -- 유저 번호

     
    CONSTRAINT li_review_fk1 FOREIGN KEY(r_no) REFERENCES Li_reserve (r_no),        -- 예약 번호
    CONSTRAINT li_review_fk3 FOREIGN KEY(user_no) REFERENCES Li_user (user_no),     -- 클래스 번호
    CONSTRAINT li_review_fk4 FOREIGN KEY(c_no) REFERENCES Li_class (c_no)           -- 유저 번호

);

COMMENT ON TABLE Li_Review is  '후기 게시판 테이블';
COMMENT ON COLUMN Li_Review.review_no is '후기 게시글 번호';
COMMENT ON COLUMN Li_Review.review_title is '후기 제목';
COMMENT ON COLUMN Li_Review.review_content is '후기 내용';
COMMENT ON COLUMN Li_Review.review_date is '후기 작성일';
COMMENT ON COLUMN Li_Review.review_update is '후기 수정일';
COMMENT ON COLUMN Li_Review.review_status is ' 후기 상태(0,1)';
COMMENT ON COLUMN Li_Review.review_rating is '후기 별점';
COMMENT ON COLUMN Li_Review.review_recommend is '후기 추천';




-- DROP SEQUENCE Li_review_seq;
-- Review 테이블 시퀀스
CREATE SEQUENCE Li_review_seq
    INCREMENT BY 1
    START WITH 2
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
    NOCACHE
    NOORDER;
    
-- Test Insert(더미 데이터1)
--create or replace procedure reviewProcedure
--is
--begin
--    for cnt in 1..10 loop
--        insert into Li_review (review_no, review_title, review_content, review_date,review_update,review_status, review_rating, review_recommend, r_no, c_no, user_no)
--        values(li_review_seq.nextval, '포아포아~', '좋아요!~', sysdate,null, 1 , 4, 'yes' , 2 ,9 ,9205045442);
--    end loop;
--    commit;
--end;
--/
--show error;
--EXECUTE reviewProcedure;
--
---- Test Insert(더미 데이터2)
--create or replace procedure reviewProcedure
--is
--begin
--    for cnt in 1..10 loop
--        insert into Li_review (review_no, review_title, review_content, review_date,review_update,review_status, review_rating, review_recommend, r_no, c_no, user_no)
--        values(li_review_seq.nextval, '별루임~~', '강사님이 너무 까칠해요ㅜㅜ', sysdate,null, 1 , 2, 'No' , 2, 10, 2303290612);
--    end loop;
--    commit;
--end;
--/
--show error;
--EXECUTE reviewProcedure;