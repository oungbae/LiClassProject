-- LiClass Project 13���� ���̺� �� ���� ������

-- 1. li_admin

create table li_admin(              --������ ����
 admin_no number not null,          --������ ��ȣ
 admin_id varchar2(50) not null,    --������ ���̵�
 admin_pw varchar2(40) not null,    --������ ��й�ȣ
 admin_name varchar2(30) not null,  --������ �̸�
 admin_email varchar2(40) not null,  --������ �̸���
 
 constraint li_admin_pk primary key(admin_no)
);


--alter table li_admin modify (admin_name varchar2(30));


-- 03.29 ���� ����) ���Ƿ� 1�� �ְ� �����ؾ��ϹǷ� start with 2�� �غ��ϴ�.
create sequence li_admin_seq
start with 2
increment by 1
minvalue 1
nocycle
cache 2;

comment on table li_admin is '������ ���� ���̺�';
comment on column li_admin.admin_no is '������ ��ȣ' ;
comment on column li_admin.admin_id is '������ ���̵�';
comment on column li_admin.admin_pw is '������ ��й�ȣ';
comment on column li_admin.admin_name is '������ �̸�';
comment on column li_admin.admin_email is '������ �̸���';

-- admin_no ��ȣ ������ ���� ���⼭�� �������� ��������ʰڽ��ϴ�.
insert into li_admin(admin_no, admin_id, admin_pw, admin_name, admin_email)
values(1, 'li_admin', 'admin1234', '�ְ������', 'Liclass_Admin@liclass.co.kr');

select * from li_admin;


--2. li_center

-- ���� ���̺�
create table li_center(
    ct_bizno varchar2(30) not null,    --����ڵ�Ϲ�ȣ
    ct_name varchar2(50) not null,     --���͸�
    ct_opbiz_ym varchar2(20) not null,   --���Ͱ������
    ct_intro clob not null,   --���� �Ұ�
    ct_mainart clob not null,  --���� �ֿ���ǰ
    ct_zipno number(10) not null,     --���� �����ȣ
    ct_addr clob not null,    --���� �ּ�
    ct_detail_addr clob not null, --���� ���ּ�
    ct_tel varchar2(30), --���� ��ǥ��ȭ
    ct_hmpg_addr varchar2(700), --���� Ȩ�������ּ�
    ct_date date default sysdate not null, --���� �����

    constraint li_center_pk primary key(ct_bizno)
);

select * from li_center;

--drop table li_center;

comment on table li_center is '���� ���̺�';
comment on column li_center.ct_bizno is '����ڵ�Ϲ�ȣ';
comment on column li_center.ct_name is '���͸�';
comment on column li_center.ct_opbiz_ym is '���Ͱ������';
comment on column li_center.ct_intro is '���� �Ұ�';
comment on column li_center.ct_mainart is '���� �ֿ���ǰ';
comment on column li_center.ct_zipno is '���� �����ȣ';
comment on column li_center.ct_addr is '���� �ּ�';
comment on column li_center.ct_detail_addr is '���� ���ּ�';
comment on column li_center.ct_tel is '���� ��ǥ��ȭ';
comment on column li_center.ct_hmpg_addr is '���� Ȩ�������ּ�';
comment on column li_center.ct_date is '���� �����';

select * from li_center;

--���浥���� ���� ����Ʈ ���ּ���.

-- 3. li_user (���̺�,�Լ�)

-- �����(li_user) 
-- (update 23.03.16 - ȸ����ȣ ���������Լ� �߰�)  
-- (update 23.03.22 - ȸ�������ʻ��� default img) 
-- (update 23.03.29 - �ڸ�Ʈ) 
-- (update 23.04.04 - ���̺� �� �Լ�����, �׽�Ʈ�� insert �ּ�)
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
    
comment on table li_user is 'ȸ�� ���̺�';
comment on column li_user.user_no is 'ȸ����ȣ';
comment on column li_user.user_email is 'ȸ���̸���';
comment on column li_user.user_pw is 'ȸ����й�ȣ';
comment on column li_user.user_name is 'ȸ���̸�';

comment on column li_user.user_tel  is 'ȸ������ó';
comment on column li_user.user_img is 'ȸ�������ʻ���';
comment on column li_user.user_point is '����Ʈ';

comment on column li_user.user_regdate is 'ȸ����������';
comment on column li_user.user_update is 'ȸ����������';
comment on column li_user.user_unregdate is 'ȸ��Ż������';
comment on column li_user.user_status is 'ȸ����������(0:����ȸ�� 1:Ż��ȸ��)';
comment on column li_user.user_type is 'ȸ����������(0:�̸��� 1:īī�� 2:���̹�)'; 

--ȸ����ȣ ���� �Լ�
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

--���� ������
--ȸ����ȣ ������ ���� ���⼭�� �Լ��� ������� �ʰڽ��ϴ�.
--�������� Ż��/�Ϲ�, ��й�ȣ ������ 90�� ���� ȸ���� �����Դϴ�.
--��й�ȣ���� �˸�â�� Ȯ���Ϸ��� 1������ ȸ������ �α������ּ���.

--1. ��й�ȣ ����ȸ��
--insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_regdate,user_update)
--values( '2303291111','test1111@gmail.com','1234','testUser1','01012341234','0','2022/03/29','2022/03/29');

--2. �Ϲ�ȸ��
--insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
--values('2303292222','test2222@gmail.com','1234','testUser2','01012341234','0');

--3. Ż��ȸ��
--insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_regdate,user_unregdate,user_status)
--values( '2303293333','test3333@gmail.com','1234','testUser3','01012341234','0','2022/03/29','2023/03/28','1');

--���� ���̵� (update 23.04.04)

--����
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('9205045442','kimeunazip@naver.com','1234','������','01012341234','0');

--�μ�
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2303290625','ics9133@gmail.com','1234','���μ�','01012341234','0');

--����
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2303290612','dndqo49@naver.com','1234','������','01095990612','0');

--�ҿ�
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2303290722','wjdthdud13@naver.com','1234','���ҿ�','01012341234','0');

--����
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2001110723','jmlim1107@naver.com','1234','������','01012341234','0');

--���
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2302282828','linda284@naver.com','0000','�̰��','01017441744','0');

-- ���Ȯ���� ���� �߰��۾�
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

--���õ����� �߰� (update 23.04.04)
-- �̸���ȸ�� 4�� �߰�
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304044110,'kkkangone@naver.com','1234','���ϳ�','01033265447','0');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304047208,'soooy@naver.com','1234','������','01087753653','0');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304041631,'leesuuu@naver.com','1234','�̼���','01034685436','0');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304048567,'minkyong@naver.com','1234','���ΰ�','01086446735','0');


-- īī�� 5�� �߰�
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

-- ���̹� 5�� �߰�
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304047291,'jinyung@naver.com','1234','������','01012755320','2');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304048961,'garam@naver.com','1234','������','010127551236','2');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304045019,'kimsora@naver.com','1234','��Ҷ�','01012755321','2');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304048491,'honghong@naver.com','1234','��ȫ��','01012552323','2');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values(2304045275,'parkingg@naver.com','1234','�ڱ���','01012255321','2');

-- Ż��ȸ�� 5�� �߰�
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_status)
values(2304048460,'kimjiyoung@naver.com','1234','������','01012355321','0','1');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_status)
values(2304048469,'daidai@naver.com','1234','�̴��','0100755323','0','1');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_status)
values(2304049937,'dongdonijng@naver.com','1234','������','01082755321','0','1');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_status)
values(2304046834,'chachasu@naver.com','1234','������','010547553323','0','1');

insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type,user_status)
values(2304044849,'noaaa11@naver.com','1234','��Ҹ�','01012121321','0','1');


-- 4. li_qna

create table li_qna(
qna_no number not null,                    --����,���ǰԽ��� �۹�ȣ
admin_no number,                           --������ ��ȣ
user_no number,                           --03.29 ���� �߰�. �־���ϴ°� �������?
qna_title varchar2(100) not null,          --����,���ǰԽ��� ����
qna_content varchar2(1000) not null,       --����,���ǰԽ��� ����
qna_date date default sysdate,             --����,���ǰԽ��� �����
qna_date_fix date,                          --����,���ǰԽ��� ������
qna_category varchar2(10) not null,        --����,���ǰԽ��� ī�װ�
qna_top_state number default 0 not null,   --��������,���ǻ��� ���� �� �������� ��� ���� ���°�
qna_group number default 0,                          --���ǰԽ��� �亯 �׷��ȣ
qna_indent number default 0,                         --���ǰԽ��� �亯���� ��ġ��ȣ
qna_step number default 0,                           --���ǰԽ��� �亯���� ������ȣ
    constraint li_qna_pk primary key(qna_no),
    constraint li_admin_fk1 foreign key(admin_no) references li_admin(admin_no),
    constraint li_admin_fk2 foreign key(user_no) references li_user(user_no) --03.29 ���� �߰�. �־���ϴ°� �������?
);  

commit;

select * from li_qna;

comment on table li_qna is '����, ���ǰԽ���';
comment on column li_qna.qna_no is '����, ���ǰԽ��� �۹�ȣ';
comment on column li_qna.user_no is '���ǰԽ��� �ۼ�ȸ����ȣ'; --03.29 ���� �߰�. �־���ϴ°� �������?
comment on column li_qna.qna_title is '����, ���ǰԽ��� ����';
comment on column li_qna.qna_content is '����, ���ǰԽ��� ����';
comment on column li_qna.qna_date is '����, ���ǰԽ��� �����';
comment on column li_qna.qna_date_fix is '����, ���ǰԽ��� ������';
comment on column li_qna.qna_category is '��������,���ǻ��� ī�װ�';
comment on column li_qna.qna_top_state is '��������,���ǻ��� ���� �� �������� ��� ���� ���°�';
comment on column li_qna.qna_group is '���ǰԽ��� �亯 �׷��ȣ';
comment on column li_qna.qna_indent is '���ǰԽ��� �亯���� ��ġ��ȣ';
comment on column li_qna.qna_step is '���ǰԽ��� �亯���� ������ȣ';


-- 03.29 ���� ����) ���Ƿ� 9���� �ְ� �����ؾ��ϹǷ� start with 10�� �غ��ϴ�.

create sequence li_qna_seq
start with 10
increment by 1
minvalue 1
nocycle
cache 2;

-- 23.03.29 ���� �߰�
-- qna_no ��ȣ ������ ���� ���⼭�� �������� ��������ʰڽ��ϴ�.
-- ȸ���� 3���� ���Ǳ� �����ϴ�.
-- not null �÷� qna_top_state �켱 0���� �־��µ� �������?

--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(1,1,2303291111,'testQnaTitle1','testQnaContent1','����','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(2,1,2303291111,'testQnaTitle2','testQnaContent2','����','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(3,1,2303291111,'testQnaTitle3','testQnaContent3','����','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(4,1,2303292222,'testQnaTitle4','testQnaContent4','����','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(5,1,2303292222,'testQnaTitle5','testQnaContent5','����','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(6,1,2303292222,'testQnaTitle6','testQnaContent6','����','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(7,1,2303293333,'testQnaTitle7','testQnaContent7','����','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(8,1,2303293333,'testQnaTitle8','testQnaContent8','����','0');
--
--insert into li_qna(qna_no,admin_no,user_no,qna_title,qna_content,qna_category,qna_top_state)
--values(9,1,2303293333,'testQnaTitle9','testQnaContent9','����','0');

--FAQ �Խ��� ���Ǳ� �����߾��~~
--���� ���ϰ� �ϽǺе��� �Ʒ� delete�� 2�� �����ּ���
--delete li_qna where qna_top_state = 0;
--delete li_qna where qna_top_state = 1;

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(1,9205045442,'Ŭ���� �������� �� �ñ��ؿ�~','���װ��� Ŭ������������ ���̵��� �ڼ��� ������ �� �ñ��ؿ�~~','����','0',1);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(2,2001110723,'Ŭ���� ����� �ʹ� ��Ѱ� ���ƿ�~','�����Ҽ��ִ� ����ֳ���?','����','0',2);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(3,2303290625,'Ŭ���� �����ߴµ� ��¥�� �����ϰ�;��~','4/7�� �ߴµ� 4/14�� �����ұ��~?','����','0',3);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(4,2303290612,'Ŭ���� �ڼ��� ��Ұ� �˰�;��~','���ּҴ� �����ϸ� �����ִ� �ǰ���?','����','0',4);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(5,2303290722,'��������ϰ�;��','��ҹ���� �ñ��մϴ�.','����','0',5);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(6,2302282828,'�ڸ��� ���µ� ����ڸ��� ���ܳ����?','�ö��Ŭ���� �� �������� �̤̤��ڸ��������','����','0',6);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(7,2001110723,'�۰��� ������ �ñ��ؿ�','�߻��峪��????','����','0',7);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(8,2303290625,'��������ߴµ� ȯ���� �ȵƾ��Ф�','��� ����ߴµ� �����Ǵ°ſ���!!!�������ּ���!!','����','0',8);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(9,9205045442,'Ŭ���� ���൵�� �ڸ��� ���������Ф�','�׻��� �ڸ��� �������ϱ��???','����','0',9);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(10,2303290722,'���̵� �ٲٰ������ �ȵǿ�ФФ�','���̵� �ٲٰ������ �� �ȵǴ°ſ���????','����','0',10);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(11,2302282828,'��й�ȣ�� �ٲٰ������ �ȵǿ�ФФ�','1234�� �ٲٰ������ �� �ȵǴ°ſ���????','����','0',11);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(12,2303290612,'ȸ��Ż���Ϸ��� ��� �ؾ��ϳ���','�� ����Ʈ ���� �ȵ� Ż���ҷ���','����','0',12);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(13,9205045442,'Ŭ���� ���������� �� �� �� �ֳ���?','Ŭ���� ���������� �ʹ� �ñ��ؿ� ','����','0',13);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(14,2303290625,'���� �� �ı⸦ �����ϰ������ ��ã�ھ��','���� �� �ı� ������ ��� �� �� �ֳ���?','����','0',14);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(15,2303290612,'���� ����� ������?','����� ��������','����','0',15);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(16,2303290722,'�ڸ��� ���µ� ����ڸ��� ���ܳ����?','�ö��Ŭ���� �� �������� �̤̤��ڸ��������','����','0',16);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(17,2001110723,'�۰��� ������ �ñ��ؿ�','�߻��峪��????','����','0',17);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(18,2302282828,'��������ߴµ� ȯ���� �ȵƾ��Ф�','��� ����ߴµ� �����Ǵ°ſ���!!!�������ּ���!!','����','0',18);

insert into li_qna(qna_no,user_no,qna_title,qna_content,qna_category,qna_top_state,qna_group)
values(19,2303290612,'Ŭ���� ���൵�� �ڸ��� ���������Ф�','�׻��� �ڸ��� �������ϱ��???','����','0',19);

commit;
--select * from li_qna;


-- 5. li_class

-- 5. li_class

-- Ŭ����(Li_Class)���� (update 23.03.23)                                                     
create table li_class (
	c_no number not null,                   --Ŭ���� ��ȣ
    ct_bizno varchar2(30) not null,         --����� ��Ϲ�ȣ
    c_title varchar2(1000) not null,        --Ŭ���� ����
    c_content clob not null,                --Ŭ���� �Ұ���
    c_category varchar2(10) not null,       --Ŭ���� ī�װ� ( 0.����, 1.�丮, 2.�̼�, 3.�ö��, 4.��Ƽ, 5.ü��ױ�Ÿ )
    c_level varchar2(3) not null,           --Ŭ���� ���̵�
    c_area varchar2(100) not null,          --Ŭ���� ����
    c_luv number default 0 not null,        --Ŭ���� ���ɼ�
    c_leadtime number not null,             --Ŭ���� �ҿ�ð�
    c_maxcnt number not null,               --Ŭ���� �ִ��ο�
    c_mincnt number default 1 not null,     --Ŭ���� �ּ��ο�
    c_date date default sysdate not null,   --Ŭ���� �������
    c_state number default 0 not null,      --Ŭ���� ���� ( 0:��ϿϷ�/���డ��, 1:����/����Ұ� )
   	constraint li_class_pk primary key(c_no),
   	constraint li_class_fk foreign key(ct_bizno) references li_center(ct_bizno)
);
comment on table li_class is 'Ŭ���� ���̺�';
comment on column li_class.c_no is 'Ŭ���� ��ȣ';
comment on column li_class.c_title is 'Ŭ���� ����';
comment on column li_class.c_content is 'Ŭ���� �Ұ���';
comment on column li_class.c_category is 'Ŭ���� ī�װ�';
comment on column li_class.c_level is 'Ŭ���� ���̵�';
comment on column li_class.c_area is 'Ŭ���� ����';
comment on column li_class.c_luv is 'Ŭ���� ���ɼ�';
comment on column li_class.c_leadtime is 'Ŭ���� �ҿ�ð�';
comment on column li_class.c_maxcnt is 'Ŭ���� �ִ��ο�';
comment on column li_class.c_mincnt is 'Ŭ���� �ּ��ο�';
comment on column li_class.c_date is 'Ŭ���� �������';

-- 03.29 ���� ����) ���Ƿ� 10�� ������ �ְ� �����ؾ��ϹǷ� start with 11�� �غ��ϴ�.
--Ŭ���� ��ȣ ������
create sequence li_class_seq
increment by 1
start with 11
minvalue 1
nocycle
nocache;

-- 23.03.29 ���� �߰�
-- ���� Ŭ���� 10��
-- c_no ��ȣ ������ ���� ���⼭�� �������� ��������ʰڽ��ϴ�.
--1. 
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(1, 8584400500, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', '�����ϱ⵵ ���� �����Կ�, ����̴� ���� �� �����Կ� ��ǰ���ε� ���ӻ��� ���� �ɴٹ��� ������.
�õ��� �ʵ��� ����ó���� ��������� �ö�� �ɴٹ��� ���� �ְų� ���ŷο� ���� ���̵� �����Ⱓ �̻ڰ� �� �� �־ ���׸��� ��ǰ���ε� ����� Ư���� �ǹ��� �����̶�� �õ�ų� ������ �ʾƼ� �޴� ���� 
�������� ������ �� �ֽ��ϴ�. ���������� Ư���� ������ �ְ� �ʹٸ� ����� ������ �������� ��� ���� ����� ������. ����̴� ������ ���� �Կ� ��ǰ���� ģ����� �Բ� �غ��Ͻø� ���� �߾��� �ǰ�����?',
3, '��', '��� ������', 1, 6);

--2.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(2, 8466400320, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', 
'Ȩī���� ����.. ���ΰ��� ���� ���ְ� �����ϴ� ������� �ڵ�帳 ������ Ŭ����! ���� ������ ������~!
����, �پ��� ������, Ŀ�ǿ� �����ִ� �е��� ������ �����Ͻ� �� �ֽ��ϴ�!
�߰ſ� ���� �ٷ��� �ϰ� Ŀ���� Ư���� ����л� �̻� ������ �����մϴ�. �ݷ������� �Բ� ���������� �Ұ��մϴ�.
�ٸ���¥�� ������ ���Ͻô� ��� ������ �޼����� ������ �ּ���~������ �ð��� �ִ��� ����帮�� �ֽ��ϴ�~!
(�ָ������� ���Ͻ� ��� �޼����� �����ּ���)',
1, '��', '��� ���ν�', 2, 4);

--3.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(3, 1304758832, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', 
'�ڿ������� ���� �ִ� �ó���ĵ��, �ν�Ÿ�� Ŭ������ �Ұ��� �帳�ϴ�.
-�ó��� ĵ��
�Ĺ��� ���̿ν��� ĵ���� ����� �ó��� ��ƽ�� ������ö���� ����� ĵ���� ���ϴ´�� �ٸ纸�� �� �ִ� Ŭ�����Դϴ�. 
���� �����̳ʿ� ����� ����Ͻñ⿡�� ���� ĵ���̿���. :)
-�ó��� �ν�Ÿ��
õ�� �ν��� �ж�(����ν�)�� �ν� Ÿ���� ����� �ó��� ��ƽ�� ������ö���� ���ڰ� �ٸ纾�ϴ�.
�ν�Ÿ���� ���ϴ� ���� �ɾ�ΰ� �������ε� ����� �� �־��. ���� ���� ���� ���� ���׸��� ��ǰ ������ ������ �Ѵ�ϴ�. :)',
0, '��', '��� ��õ��', 2, 4);

--4.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 4, 6306200298, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)', 
'���� �ϳ��ۿ� ���� ��ǰ ��������⸦ �����ϼ���..
- ��ǰ����� ���̽��� �ҿ��ϰ� ������ �� 30���� �߿� �߰��Ͽ� ���󿡼� �ϳ����� ����� ���� �� �ֽ��ϴ�.
+ ��� ���� �� �����۷� ����ó�� �̿��� �� �ְ� ���������
+ Ŭ���� ������ ���� ���� �ڲڲ� �湮�ϽǶ����� ������ ������ϴ�.
+ Ŭ���� ���� �� �Ȱ��� ���� �� ����ʹٸ�, �ù�� �߼� �����ϴٴ� ��!',
4, '��', '��� �Ⱦ��', 1, 4);

--5.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 5, 1352837035, '�������� ���� ���� ����� ŰƮ �����', 
'���� ���� ���� ����, 4��! ���� �¾� ������ ��ȹ�ϰ� �ִ� ����Ŭ���� �������� �ֳ���? �����̴� ������ ����� �Ϻ��ϰ� ������� ������ �����ǰ����
���� ����� ����ϸ鼭 �߾��� �׾ƺ� �� �־��.',
0, '��', '��⵵ ������', 2, 6);

--6.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(6, 6306200298, '��Ȱ �� ��ǰ�� ����, �� �� �� �� �������ڼ� Ŭ����', 
'�������ڼ����� ���� ����ϴ� ��Ƽġ �����
����� �����θ�, Ŭ������ ���� ���Ŀ���
ȥ�ڼ� ������ �� �ִ� �ڽŰ��� ���� �ſ���.�������ڼ� Ŭ��������
��Ʋ�� �⺻ ��� ���� �� ���� �ŵ��������
�������� �˷��帱�Կ�.',
0, '��', '��⵵ �����ν�', 1, 4);

--7.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 7, 8466400320, 'Ȩ��Ƽ ������ �׸�! ������� ���� �丮 Ŭ����', 
'������� ���� �丮 Ŭ����,�丮�� �ٽ����� ����!
Į���� �� ��������.���ʺ��� źź�ϰ� �˷��帳�ϴ�:),���� 8�� ��,
�������뷯 ���̽� �۰����� �˷��ִ� ������ ������!���� �ϸ� �ݼ� �ϼ��Ǵ� �ٻ��� �丮���,
Ȩ��Ƽ ���� ���̻� ����� ���� �ſ���',
1, '��', '��⵵ �ǿս�', 2, 7);

--8.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 8, 2885600271, '�̷� ���װ����� ó���̾�, ���� ����ȭ Ŭ����', 
'�������� �ƴ� ��ΰ� ����
�ڽŸ��� ����ȭ�� ����� �� �� �ֵ���
���ʺ��� �Ĳ��ϰ� �˷��帮��,
������ �������� ������ô� ���� ����� ����
������ �Ź��� �տ� �������� �ſ���. �Ź��� �������� ������?�� ������ ������ ������
������ �����
��ü���� ���ϰ� õ�� �� ������ �����
�縻�� ���� �� ����� ��ȭ����
������ �� ���� �ſ���!',
0, '��', '��⵵ ������', 2, 6);

--9.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values( 9, 8961600886, '�����̾� ����� ���ø��� ������ �����', 
'���� ��� ������ø�������� ����� ������ Ŭ���� �Դϴ�
���� ���̸� �� �� ���� ������ ����� ���� �⿡ ���ϴ� ���� ����� ������ ������� ���� �߰��ϰ� �˴ϴ�.���� ���� ���������� ������ �ϰ� ������ �е�
���� ����� ���� ������ �е�
������ ����� �ڵ� ���̵尡 ������ �е鿡�� ��õ�մϴ�.',
1, '��', '��⵵ ������', 2, 8);

--10.
insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
values(10, 6670500768, '������ ���� ������ ���̾�Ʈ ������ġ', 
'������ġ ������� ��ä�� �����ϼ̴ٰ� �õ�� ���ȴ� ��� ��������?
����, ��ä �Ƴ��� ���� ���� �ֱ�� �ؿ�!
�� ������ ����� �����ϰ� �� �ǰ��ϰ� ���� �� �ִ� ������ġ��
���̾�Ʈ �����ε� �Ǹ��ϰ� ��ä�� �� ���ְ� ��� �� �ֽ��ϴ�.
Ư�� ī�並 ��Ͻô� �е� �߿� ������ġ ǰ���� �߰��ϰ� ������ �е鿡�Ե� ������ �����Դϴ�.
��� ����ó�� ������ �˷������ :)',
1, '��', '��⵵ �����',2, 8);



--********** ���̺� ���泻�� : DDL���� ��� �ݿ��س��ҽ��ϴ�! **********
--�÷� ����(update 23.03.15)
--alter table li_class modify c_title varchar2(1000);
--alter table li_class modify c_level varchar2(3);
--alter table li_class modify c_area varchar2(100);
--alter table li_class modify c_luv number default 0;
--alter table li_class modify ct_bizno varchar2(30);
--Į�� ����(update 23.03.18)
--alter table li_class drop column c_state;
--�������� �߰�(update 23.03.19)
--alter table li_class add constraint li_class_fk foreign key(ct_bizno) references li_center(ct_bizno);
--************************************************************************

--********** sample data **********--
--create or replace procedure class_insert1
--is
--begin
--    for cnt in 1..30 loop
--        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
--        values( li_class_seq.nextval, 8584400500, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', '�����ϱ⵵ ���� �����Կ�, ����̴� ���� �� �����Կ� ��ǰ���ε� ���ӻ��� ���� �ɴٹ��� ������.
--        �õ��� �ʵ��� ����ó���� ��������� �ö�� �ɴٹ��� ���� �ְų� ���ŷο� ���� ���̵� �����Ⱓ �̻ڰ� �� �� �־ ���׸��� ��ǰ���ε� ����� Ư���� �ǹ��� �����̶�� �õ�ų� ������ �ʾƼ� �޴� ���� 
--        �������� ������ �� �ֽ��ϴ�. ���������� Ư���� ������ �ְ� �ʹٸ� ����� ������ �������� ��� ���� ����� ������. ����̴� ������ ���� �Կ� ��ǰ���� ģ����� �Բ� �غ��Ͻø� ���� �߾��� �ǰ�����?',
--        3, '��', '��� ������', 1, 6);
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
--        values( li_class_seq.nextval, 8466400320, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', 
--        'Ȩī���� ����.. ���ΰ��� ���� ���ְ� �����ϴ� ������� �ڵ�帳 ������ Ŭ����! ���� ������ ������~!
--        ����, �پ��� ������, Ŀ�ǿ� �����ִ� �е��� ������ �����Ͻ� �� �ֽ��ϴ�!
--        �߰ſ� ���� �ٷ��� �ϰ� Ŀ���� Ư���� ����л� �̻� ������ �����մϴ�. �ݷ������� �Բ� ���������� �Ұ��մϴ�.
--        �ٸ���¥�� ������ ���Ͻô� ��� ������ �޼����� ������ �ּ���~������ �ð��� �ִ��� ����帮�� �ֽ��ϴ�~!
--        (�ָ������� ���Ͻ� ��� �޼����� �����ּ���)',
--        1, '��', '��� ���ν�', 2, 4);
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
--        values( li_class_seq.nextval, 1304758832, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', 
--        '�ڿ������� ���� �ִ� �ó���ĵ��, �ν�Ÿ�� Ŭ������ �Ұ��� �帳�ϴ�.
--        -�ó��� ĵ��
--        �Ĺ��� ���̿ν��� ĵ���� ����� �ó��� ��ƽ�� ������ö���� ����� ĵ���� ���ϴ´�� �ٸ纸�� �� �ִ� Ŭ�����Դϴ�. 
--        ���� �����̳ʿ� ����� ����Ͻñ⿡�� ���� ĵ���̿���. :)
--        
--        -�ó��� �ν�Ÿ��
--        õ�� �ν��� �ж�(����ν�)�� �ν� Ÿ���� ����� �ó��� ��ƽ�� ������ö���� ���ڰ� �ٸ纾�ϴ�.
--        �ν�Ÿ���� ���ϴ� ���� �ɾ�ΰ� �������ε� ����� �� �־��. ���� ���� ���� ���� ���׸��� ��ǰ ������ ������ �Ѵ�ϴ�. :)',
--        0, '��', '��� ��õ��', 2, 4);
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
--        values( li_class_seq.nextval, 6306200298, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)', 
--        '���� �ϳ��ۿ� ���� ��ǰ ��������⸦ �����ϼ���..
--        - ��ǰ����� ���̽��� �ҿ��ϰ� ������ �� 30���� �߿� �߰��Ͽ� ���󿡼� �ϳ����� ����� ���� �� �ֽ��ϴ�.
--        + ��� ���� �� �����۷� ����ó�� �̿��� �� �ְ� ���������
--        + Ŭ���� ������ ���� ���� �ڲڲ� �湮�ϽǶ����� ������ ������ϴ�.
--        + Ŭ���� ���� �� �Ȱ��� ���� �� ����ʹٸ�, �ù�� �߼� �����ϴٴ� ��!',
--        4, '��', '��� �Ⱦ��', 1, 4);
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

update li_class set c_title = 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' where c_no=5;

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 11, '0200600028' , '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������', '������ ��������', '0', '��', '��� ������', 3, 8, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 12, '2641001086' , '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������', '������ ��������', '2', '��', '��� �����ֽ�', 2, 4, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 13, '6072666671' , '���� �׸��� ������ �׸�?', '������ ��������', '2', '��', '��� ��õ��', 1, 15, 3 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 14, '8945000297' , '�ε巯�� MP�� Ŭ����', '������ ��������', '4', '��', '��� ����', 1, 4, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 15, '5927100101' , '[DOG] ������ �Ʒθ��׶��� �ɾ���ǰ ����� ������ Ŭ����', '������ ��������', '5', '��', '��� ������', 2, 4, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 16, '2043018185' , '[�ڰ��� ����] ���ο��̽�Ʈ �������� ����', '������ ��������', '5', '��', '��� �Ⱦ��', 8, 4, 2 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 17, '1245329750' , '?��������� �ö�� ?�̳�� �߼�(��)', '������ ��������', '3', '��', '��� ������', 1, 1, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 18, '1223120810' , '? �ö�� ���� �ٽ���(�������� ���� �ּ���)', '������ ��������', '3', '��', '��� ��õ��', 1, 2, 2 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 19, '6501100908' , '���� �ϳ����� ���ٸ� �ʻ�ȭ ����� �˾�Ʈ�ʻ�ȭ Ŭ����', '������ ��������', '2', '��', '��� ������', 2, 3, 4 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 20, '5451300594' , '���ο����� ����ϴ� ��꼺 ��Ǫ�� �����', '������ ��������', '4', '��', '��� ���ν�', 2, 4, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 21, '1641100542' , 'JMT! ���޲ٴ��� �Ƹ޸�ĭ ��Ű �����', '������ ��������', '1', '��', '��� �����ν�', 1, 12, 3 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 22, '3060480273' , '���۵��� ���� Ķ���׶���', '������ ��������', '2', '��', '��� ������', 2, 6, 1 );

insert into li_class( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt, c_mincnt ) 
values( 23, '1390506312' , '�������� �����ϴ� �Ƹ��ٿ�, ��������� �ö�� �ڽ�?', '������ ��������', '3', '��', '��� ����', 4, 4, 1 );

--6.li_class_img

--Ŭ���� �̹���(Li_Class_img)      (update 23.03.23)
create table li_class_img (
    c_img_no number not null,                            --������ȣ
    c_no number not null,                                --Ŭ���� ��ȣ
    c_img_file varchar2(500) not null,                   --�̹��� �̸�
    thumb_file varchar2(500) not null,                   --����� �̸�
    c_img_date date default sysdate not null,            --�̹��� �����
    constraint li_class_img_pk primary key(c_img_no),
    constraint li_class_img_uk unique(c_img_file),
    constraint li_class_img_fk foreign key(c_no) references li_class(c_no)
);
comment on table li_class_img is 'Ŭ���� �̹��� ���̺�';
comment on column li_class_img.c_img_file is '�̹��� �̸�';
comment on column li_class_img.thumb_file is '����� �̸�';
comment on column li_class_img.c_img_date is '�̹��� �����';

-- 03.29 ���� ����) ���Ƿ�1~18�� �ְ� �����ؾ��ϹǷ� start with 19�� �غ��ϴ�.

--���� ��ȣ ������
create sequence li_class_img_seq
increment by 1
start with 11
minvalue 1
nocycle
nocache;

--********** ���̺� ���泻�� : DDL���� ��� �ݿ��س��ҽ��ϴ�! **********
--alter table li_class_img drop constraint LI_CLASS_IMG_UK2;
--************************************************************************
select * from li_class_img;



-- 23.03.29 ���� �߰�
-- c_img_no ��ȣ ������ ���� ���⼭�� �������� ��������ʰڽ��ϴ�.
--c_no 1�� �̹��� 3��.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(1,1,'thumbnail_class_1629551284217_�ö��1.jpg','class_1629551284217_�ö��1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(2,1,'thumbnail_class_1629551284317_�ö��2.jpg','class_1629551284317_�ö��2.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(3,1,'thumbnail_class_1629521284217_�ö��3.jpg','class_1629521284217_�ö��3.jpg');

--c_no 2�� �̹��� 3��.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(4,2,'thumbnail_class_1629551784312_�ڵ�帳1.jpg','class_1629551784312_�ڵ�帳1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(5,2,'thumbnail_class_1629551284312_�ڵ�帳2.jpg','class_1629551284312_�ڵ�帳2.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(6,2,'thumbnail_class_1629551284313_�ڵ�帳3.jpg','class_1629551284313_�ڵ�帳3.jpg');

--c_no 3�� �̹��� 3��.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(7,3,'thumbnail_class_1679551784314_ĵ��1.jpg','class_1679551784314_ĵ��1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(8,3,'thumbnail_class_1679551784312_ĵ��2.jpg','class_1679551784312_ĵ��2.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(9,3,'thumbnail_class_1679551784514_ĵ��3.jpg','class_1679551784514_ĵ��3.jpg');

--c_no 4�� �̹��� 3��.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(10,4,'thumbnail_class_1679551633205_���1.jpg','class_1679551633205_���1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(11,4,'thumbnail_class_1679551634012_���2.png','class_1679551634012_���2.png');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(12,4,'thumbnail_class_1679551634013_���3.png','class_1679551634013_���3.png');

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
values(10, 4, 'class_1679551633205_���1.jpg', 'thumbnail_class_1679551633205_���1.jpg' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(11, 4, 'class_1679551634012_���2.png', 'thumbnail_class_1679551634012_���2.png' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(12, 4, 'class_1679551634013_���3.png', 'thumbnail_class_1679551634013_���3.png' );

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(13, 5, 'Ŭ����5_����1.jpg', 'thumbnail_class_Ŭ����5 ����1' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(14, 5, 'Ŭ����5_����2.jpg', 'thumbnail_class_Ŭ����5 ����2' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(15, 5, 'Ŭ����5_����3.jpg', 'thumbnail_class_Ŭ����5 ����3' );

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(16, 6, 'Ŭ����6_����1.jpg', 'thumbnail_class_Ŭ����6 ����1' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(17, 6, 'Ŭ����6_����2.png', 'thumbnail_class_Ŭ����6 ����2' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(18, 6, 'Ŭ����6_����3.jpg', 'thumbnail_class_Ŭ����6 ����3' );

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(19, 7, 'Ŭ����7_����1.png', 'thumbnail_class_Ŭ����7 ����1' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(20, 7, 'Ŭ����7_����2.png', 'thumbnail_class_Ŭ����7 ����2' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(21, 7, 'Ŭ����7_����3.jpg', 'thumbnail_class_Ŭ����7 ����3' );

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(22, 8, 'Ŭ����8_����1.jpg', 'thumbnail_class_Ŭ����8 ����1' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(23, 8, 'Ŭ����8_����2.jpg', 'thumbnail_class_Ŭ����8 ����2' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(24, 8, 'Ŭ����8_����3.jpg', 'thumbnail_class_Ŭ����8 ����3' );

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(25, 9, 'Ŭ����9_����1.jpg', 'thumbnail_class_Ŭ����9 ����1' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(26, 9, 'Ŭ����9_����2.jpg', 'thumbnail_class_Ŭ����9 ����2' );
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(27, 9, 'Ŭ����9_����3.jpg', 'thumbnail_class_Ŭ����9 ����3' );

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(28, 10, 'Ŭ����10_����1.jpg', 'thumbnail_class_Ŭ����10 ����1');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(32, 11, 'class_1679551918773_������Ʈ1.jpg', 'thumbnail_class_1679551918773_������Ʈ1.jpg');
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(30, 11, 'class_1679551932996_������Ʈ2.jpg', 'thumbnail_class_1679551932996_������Ʈ2.jpg');
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(31, 11, 'class_1679551938809_������Ʈ3.jpg', 'thumbnail_class_1679551938809_������Ʈ3.jpg');
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(29, 11, 'class_1679551946125_������Ʈ4.jpg', 'thumbnail_class_1679551946125_������Ʈ4.jpg');
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(33, 11, 'class_1679551954897_������Ʈ5.jpg', 'thumbnail_class_1679551954897_������Ʈ5.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(34, 12, 'class_1679551784314_�̼�1.jpg', 'thumbnail_class_1679551784314_�̼�1.jpg');
insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(35, 12, 'class_1679551784430_�̼�2.jpg', 'thumbnail_class_1679551784430_�̼�2.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(36, 13, 'class_Ŭ����13_����1.jpg', 'thumbnail_class_Ŭ����13_����1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(37, 14, 'class_Ŭ����14_����1.jpg', 'thumbnail_class_Ŭ����14_����1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(38, 15, 'class_Ŭ����15_����1.jpg', 'thumbnail_class_Ŭ����15_����1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(39, 16, 'class_Ŭ����16_����1.jpg', 'thumbnail_class_Ŭ����16_����1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(40, 17, 'class_Ŭ����17_����1.png', 'thumbnail_class_Ŭ����17_����1.png');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(41, 18, 'class_Ŭ����18_����1.jpg', 'thumbnail_class_Ŭ����18_����1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(42, 19, 'class_Ŭ����19_����1.png', 'thumbnail_class_Ŭ����19_����1.png');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(43, 20, 'class_Ŭ����20_����1.png', 'thumbnail_class_Ŭ����20_����1.png');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(44, 21, 'class_Ŭ����21_����1.jpg', 'thumbnail_class_Ŭ����21_����1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(45, 22, 'class_Ŭ����22_����1.jpg', 'thumbnail_class_Ŭ����22_����1.jpg');

insert into li_class_img(c_img_no, c_no, c_img_file, thumb_file)
values(46, 23, 'class_Ŭ����23_����1.png', 'thumbnail_class_Ŭ����23_����1.png');

-- 04.04 2�� ����
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����5_����1.jpg' where c_img_no = 13;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����5_����2.jpg' where c_img_no = 14;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����5_����3.jpg' where c_img_no = 15;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����6_����1.jpg' where c_img_no = 16;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����6_����2.png' where c_img_no = 17;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����6_����3.jpg' where c_img_no = 18;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����7_����1.png' where c_img_no = 19;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����7_����2.png' where c_img_no = 20;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����7_����3.jpg' where c_img_no = 21;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����8_����1.jpg' where c_img_no = 22;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����8_����2.jpg' where c_img_no = 23;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����8_����3.jpg' where c_img_no = 24;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����9_����1.jpg' where c_img_no = 25;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����9_����2.jpg' where c_img_no = 26;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����9_����3.jpg' where c_img_no = 27;
update li_class_img set thumb_file = 'thumbnail_class_Ŭ����10_����1.jpg' where c_img_no = 28;

update li_class_img set c_img_file = 'class_Ŭ����5_����1.jpg' where c_img_no = 13;
update li_class_img set c_img_file = 'class_Ŭ����5_����2.jpg' where c_img_no = 14;
update li_class_img set c_img_file = 'class_Ŭ����5_����3.jpg' where c_img_no = 15;
update li_class_img set c_img_file = 'class_Ŭ����6_����1.jpg' where c_img_no = 16;
update li_class_img set c_img_file = 'class_Ŭ����6_����2.png' where c_img_no = 17;
update li_class_img set c_img_file = 'class_Ŭ����6_����3.jpg' where c_img_no = 18;
update li_class_img set c_img_file = 'class_Ŭ����7_����1.png' where c_img_no = 19;
update li_class_img set c_img_file = 'class_Ŭ����7_����2.png' where c_img_no = 20;
update li_class_img set c_img_file = 'class_Ŭ����7_����3.jpg' where c_img_no = 21;
update li_class_img set c_img_file = 'class_Ŭ����8_����1.jpg' where c_img_no = 22;
update li_class_img set c_img_file = 'class_Ŭ����8_����2.jpg' where c_img_no = 23;
update li_class_img set c_img_file = 'class_Ŭ����8_����3.jpg' where c_img_no = 24;
update li_class_img set c_img_file = 'class_Ŭ����9_����1.jpg' where c_img_no = 25;


drop sequence li_class_seq;

create sequence li_class_seq
start with 24
increment by 1
minvalue 1
nocycle
nocache;

- 7. li_likes

-- ����Ŭ����(li_likes)      
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
    
comment on table li_likes is '����Ŭ���� ���̺�';
comment on column li_likes.like_no is '����Ŭ������ȣ';
comment on column li_likes.like_regdate  is '����Ŭ�����������';
comment on column li_likes.user_no is 'ȸ����ȣ';
comment on column li_likes.c_no is 'Ŭ�����̸�';

-- 03.29 ���� ����) ���Ƿ� 6�� ������ �ְ� �����ؾ��ϹǷ� start with 7�� �غ��ϴ�.
--create sequence li_likes_seq
--start with 7
--increment by 1
--minvalue 1
--nocycle
--cache 2;
-- drop sequence li_likes_seq;

--���� ������
-- like_no ��ȣ ������ ���� ���⼭�� �������� ��������ʰڽ��ϴ�.
-- Ż��ȸ���� �����ϰ� ���� ȸ�� 2�� ���Ƿ� ����Ŭ���� ����ϰڽ��ϴ�.
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

-- like_no�� ��������Ͱ��� �������� �����ϴ�.
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
comment on table li_episode is 'Ŭ���� ȸ�� ���̺�';
comment on column li_episode.ep_no is 'ȸ�� ��ȣ';
comment on column li_episode.ep_price is 'ȸ�� ����';
comment on column li_episode.ep_date is 'ȸ�� ��¥�׽ð�';
comment on column li_episode.ep_cnt is 'ȸ�� �����ο�';
comment on column li_episode.c_no is 'ȸ�� �ҼӰ��� �̸�';
comment on column li_episode.c_title is 'ȸ�� �ҼӰ��� ��ȣ';


insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date )
values( 1, 1 , '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����' , 52000, to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi') );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 2, 1 , '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 58000, to_date('2023/04/01 11:00','yyyy/mm/dd hh24:mi'),2 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 3, 1 , '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 58000, to_date('2023/04/01 14:00','yyyy/mm/dd hh24:mi'),6 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 4, 1 , '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 58000, to_date('2023/04/01 17:00','yyyy/mm/dd hh24:mi'),0 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 5, 1 , '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 58000, to_date('2023/04/02 11:00','yyyy/mm/dd hh24:mi'),3 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 6, 1 , '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 58000, to_date('2023/04/02 15:00','yyyy/mm/dd hh24:mi'),6 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 7, 1 , '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 53000, to_date('2023/04/03 11:00','yyyy/mm/dd hh24:mi'),0 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 8, 1 , '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 55000, to_date('2023/04/03 15:00','yyyy/mm/dd hh24:mi'),2 ); 
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 9, 1 , '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 53000, to_date('2023/04/04 11:00','yyyy/mm/dd hh24:mi'),1 );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 10, 1 , '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 55000, to_date('2023/04/04 15:00','yyyy/mm/dd hh24:mi'),0 );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 11, 1 , '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 100, to_date('2023/04/04 17:00','yyyy/mm/dd hh24:mi'),0 );

insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 12, 2 , 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', 25000, to_date('2023/04/12 09:00','yyyy/mm/dd hh24:mi'),0 );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 13, 2 , 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', 30000, to_date('2023/04/12 15:00','yyyy/mm/dd hh24:mi'),2 );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 14, 2 , 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', 25000, to_date('2023/04/13 09:00','yyyy/mm/dd hh24:mi'),0 );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 15, 2 , 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', 25000, to_date('2023/04/14 09:00','yyyy/mm/dd hh24:mi'),1 );
insert into li_episode( ep_no, c_no, c_title, ep_price, ep_date, ep_cnt )
values( 16, 2 , 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', 35000, to_date('2023/04/15 15:00','yyyy/mm/dd hh24:mi'),1 );



--���� ���Ǽҵ� 16�� + ���ο� ���Ǽҵ� 54�� = 70��
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 17, 1 , 52000, to_date('2023/04/18 11:00','yyyy/mm/dd hh24:mi'),3,'������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 18, 1 , 52000, to_date('2023/04/19 11:00','yyyy/mm/dd hh24:mi'), '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title )
values( 19, 1 , 54000, to_date('2023/04/21 15:00','yyyy/mm/dd hh24:mi'),6,'������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 20, 1 , 53000, to_date('2023/04/24 14:00','yyyy/mm/dd hh24:mi'),'������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 21, 1 , 53000, to_date('2023/04/25 14:00','yyyy/mm/dd hh24:mi'),'������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 22, 1 , 53000, to_date('2023/04/26 14:00','yyyy/mm/dd hh24:mi'),2, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 23, 1 , 53000, to_date('2023/04/27 14:00','yyyy/mm/dd hh24:mi'), '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 24, 1 , 53000, to_date('2023/04/28 14:00','yyyy/mm/dd hh24:mi'), '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����' ); 

insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 25, 2 , 25000, to_date('2023/04/18 13:00','yyyy/mm/dd hh24:mi'), 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 26, 2 , 26000, to_date('2023/04/19 13:00','yyyy/mm/dd hh24:mi'), 3, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 27, 2 , 26000, to_date('2023/04/20 14:00','yyyy/mm/dd hh24:mi'), 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 28, 2 , 26000, to_date('2023/04/21 15:00','yyyy/mm/dd hh24:mi'), 2, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����' ); 

insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 29, 3 , 27000, to_date('2023/04/12 13:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 30, 3 , 27000, to_date('2023/04/12 15:00','yyyy/mm/dd hh24:mi'),2, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 31, 3 , 27000, to_date('2023/04/13 13:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 32, 3 , 27000, to_date('2023/04/13 16:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 33, 3 , 28000, to_date('2023/04/14 17:00','yyyy/mm/dd hh24:mi'), 4, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 34, 3 , 30000, to_date('2023/04/15 13:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 35, 3 , 30000, to_date('2023/04/16 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 36, 3 , 27000, to_date('2023/04/18 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 37, 3 , 27000, to_date('2023/04/19 13:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 38, 3 , 27000, to_date('2023/04/20 15:00','yyyy/mm/dd hh24:mi'), 3, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 39, 3 , 27000, to_date('2023/04/21 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 40, 3 , 30000, to_date('2023/04/22 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 41, 3 , 30000, to_date('2023/04/23 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 42, 3 , 27000, to_date('2023/04/24 14:00','yyyy/mm/dd hh24:mi'), 1, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 43, 3 , 27000, to_date('2023/04/24 18:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 44, 3 , 27000, to_date('2023/04/25 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 45, 3 , 27000, to_date('2023/04/26 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 46, 3 , 27000, to_date('2023/04/27 14:00','yyyy/mm/dd hh24:mi'), 2, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 47, 3 , 27000, to_date('2023/04/28 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 48, 3 , 30000, to_date('2023/04/29 14:00','yyyy/mm/dd hh24:mi'), '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 49, 3 , 30000, to_date('2023/04/29 18:00','yyyy/mm/dd hh24:mi'), 4, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����' ); 

insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 50, 4 , 47000, to_date('2023/04/15 11:00','yyyy/mm/dd hh24:mi'), '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 51, 4 , 49000, to_date('2023/04/15 13:00','yyyy/mm/dd hh24:mi'), 3, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 52, 4 , 47000, to_date('2023/04/16 11:00','yyyy/mm/dd hh24:mi'), '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 53, 4 , 49000, to_date('2023/04/16 13:00','yyyy/mm/dd hh24:mi'), 1, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 54, 4 , 47000, to_date('2023/04/22 11:00','yyyy/mm/dd hh24:mi'), 2, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 55, 4 , 49000, to_date('2023/04/23 13:00','yyyy/mm/dd hh24:mi'), '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 56, 4 , 47000, to_date('2023/04/29 11:00','yyyy/mm/dd hh24:mi'), '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 57, 4 , 49000, to_date('2023/04/29 13:00','yyyy/mm/dd hh24:mi'), '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 58, 4 , 49000, to_date('2023/04/30 13:00','yyyy/mm/dd hh24:mi'), '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)' );

insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 59, 5 , 40000, to_date('2023/04/21 13:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 60, 5 , 40000, to_date('2023/04/21 16:00','yyyy/mm/dd hh24:mi'), 2, 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 61, 5 , 40000, to_date('2023/04/22 13:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 62, 5 , 40000, to_date('2023/04/22 16:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 63, 5 , 40000, to_date('2023/04/23 13:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 64, 5 , 40000, to_date('2023/04/23 16:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 65, 5 , 40000, to_date('2023/04/28 13:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 66, 5 , 40000, to_date('2023/04/28 16:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 67, 5 , 40000, to_date('2023/04/29 13:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 68, 5 , 40000, to_date('2023/04/29 16:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 69, 5 , 40000, to_date('2023/04/30 13:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );
insert into li_episode(ep_no, c_no, ep_price, ep_date, c_title)
values( 70, 5 , 40000, to_date('2023/04/30 16:00','yyyy/mm/dd hh24:mi'), 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����' );

insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 71, 11 , 38500, to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 6, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 72, 12 , 19000, to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 4, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 73, 12 , 19000, to_date('2023/03/25 17:00','yyyy/mm/dd hh24:mi'), 2, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������'); 

create sequence li_episode_seq
start with 74
increment by 1
minvalue 1
nocycle
nocache;





-- 9. li_reserve
create table li_reserve (
    r_no number not null,                       --�����ȣ
    user_no number not null,                    --ȸ����ȣ
    ep_no number not null,                      --ȸ����ȣ
    c_title varchar2(1000) not null,            --Ŭ���� ����
    r_date date not null,                       --��������
    reg_date date default sysdate not null,     --������������
    r_state number default 1 not null,          --������� 1:������(��������) / 2:����Ϸ�(�����Ϸ�) / 3: �������(ȯ��) 
    r_price number not null,                    --����ݾ�
    r_cnt number not null,                      --�����ο�
    
    constraint li_reserve primary key(r_no),
    constraint li_reserve_fk1 foreign key(ep_no) references li_episode(ep_no),
    constraint li_reserve_fk2 foreign key(user_no) references li_user(user_no) 
);

comment on table li_reserve is 'Ŭ���� ���� ���̺�';
comment on column li_reserve.r_no is '���� ��ȣ';
comment on column li_reserve.r_date is '���� ����';
comment on column li_reserve.r_state is '���� ����';
comment on column li_reserve.r_price is '���� �ݾ�';
comment on column li_reserve.r_cnt is '���� �ο�';
comment on column li_reserve.reg_date is '���� ��������';
comment on column li_reserve.user_no is '������ ��ȣ';
comment on column li_reserve.ep_no is '����ȸ�� ��ȣ';
comment on column li_reserve.c_title is '���భ�� �̸�';

insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 1, 9205045442, 2, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 2, 116000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 2, 9205045442, 11, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',to_date('2023/04/04 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 3, 1, 55000 ); --�������
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 3, 2302282828, 3, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('2023/04/01 14:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 6, 348000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 4, 2001110723, 5, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('2023/04/02 11:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 3, 174000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 5, 2303290722, 6, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('2023/04/02 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 6, 348000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 6, 2303290612, 8, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('2023/04/03 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 3, 159000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 7, 2303290625, 9, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('2023/04/04 11:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 1, 53000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 8, 9205045442, 13, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', to_date('2023/04/12 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 2, 60000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 9, 2302282828, 15, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', to_date('2023/04/14 09:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 1, 25000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 10, 2302282828, 16, 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', to_date('2023/04/15 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 1, 35000 );

alter table li_reserve add REVIEW_STATUS NUMBER default 0 not null;
comment on column li_reserve.review_status is '�������';

--���� ���൥���� 10�� + ���ο� ���൥���� 15�� = 25��
--�����ȣ 14, 16., 17 == ȯ�ҵ� ����ǵ�
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 11, 2302282828, 17, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('23/04/18 11:00','yyyy/mm/dd hh24:mi'), 2, 3, 156000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 12, 2001110723, 19, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('23/04/18 15:00','yyyy/mm/dd hh24:mi'), 2, 6, 324000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 13, 2303290722, 22, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('23/04/26 14:00','yyyy/mm/dd hh24:mi'), 2, 2, 106000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 14, 2303290612, 26, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('23/04/19 13:00','yyyy/mm/dd hh24:mi'), 3, 3, 78000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 15, 2303290625, 28, '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', to_date('23/04/21 15:00','yyyy/mm/dd hh24:mi'), 2, 2, 52000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 16, 9205045442, 30, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', to_date('23/04/12 15:00','yyyy/mm/dd hh24:mi'), 3, 2, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 17, 2302282828, 33, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', to_date('23/04/14 17:00','yyyy/mm/dd hh24:mi'), 3, 4, 112000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 18, 2001110723, 38, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', to_date('23/04/20 15:00','yyyy/mm/dd hh24:mi'), 2, 3, 81000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 19, 2303290722, 42, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', to_date('23/04/24 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 27000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 20, 2303290612, 46, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', to_date('23/04/27 14:00','yyyy/mm/dd hh24:mi'), 2, 2, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 21, 2303290625, 49, '������ ����, �ó��� ĵ��, �ν�Ÿ�� �����', to_date('23/04/29 18:00','yyyy/mm/dd hh24:mi'), 2, 4, 120000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 22, 9205045442, 51, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)', to_date('23/04/15 13:00','yyyy/mm/dd hh24:mi'), 2, 3, 147000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 23, 2302282828, 53, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)', to_date('23/04/16 13:00','yyyy/mm/dd hh24:mi'), 2, 1, 49000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 24, 2001110723, 54, '���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)', to_date('23/04/22 11:00','yyyy/mm/dd hh24:mi'), 2, 2, 94000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 25, 2303290722, 60, 'Ŀ����! ���ڹ�+�Ŀ�ġ ������ Ŭ����)', to_date('23/04/21 16:00','yyyy/mm/dd hh24:mi'), 2, 2, 80000 );

insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 26, 2302282828, 71, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 27, 2001110723, 71, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 28, 2303290722, 71, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 29, 2303290612, 71, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 30, 2303290625, 71, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 31, 9205045442, 71, '��¦��¦ ������ �ŷ�, ������ ���� ���� ��������', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 38500 );

insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 32, 2302282828, 72, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������', to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 33, 2001110723, 72, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������', to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 34, 2303290722, 72, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������', to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 35, 2303290612, 72, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������', to_date('2023/03/25 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 36, 2303290625, 73, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������', to_date('2023/03/25 17:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 37, 9205045442, 73, '������ ���� ����� Ŭ���� A.���� B.���� C.�̷� ������', to_date('2023/03/25 17:00','yyyy/mm/dd hh24:mi'), 2, 1, 19000 );

--11.li_payment
create table li_payment (            -- ���� ���̺�
    merchant_uid    varchar2(50)  not null, -- �ֹ���ȣ
    r_no            number        not null, -- �����ȣ
    user_no         number        not null, -- ȸ����ȣ
    pay_pg          varchar2(50)  not null, -- pg�� �����ڵ�
    pay_method      varchar2(50)  not null, -- �������� �����ڵ�
    pay_name        varchar2(100)  not null, -- ������� ��ǰ��
    pay_price       number        not null, -- �����ݾ�
    pay_buyer_name  varchar2(30)  not null, -- �ֹ��ڸ�
    pay_buyer_tel   varchar2(50)  not null, -- �ֹ��� ����ó
    pay_buyer_email varchar2(100) not null, -- �ֹ��� �̸���
    pay_date        date default  sysdate,  -- ��������
    pay_status      number        not null,  -- ��������  0: ����, 1:���, 2:����, 3:ȯ��
    
    constraint li_payment_pk primary key(merchant_uid),
    constraint li_refund_fk foreign key(r_no) references li_reserve(r_no)
);

comment on table li_payment is '���� ���̺�';
comment on column li_payment.merchant_uid    is '�ֹ���ȣ';
comment on column li_payment.r_no            is '�����ȣ';
comment on column li_payment.user_no         is 'ȸ����ȣ';
comment on column li_payment.pay_pg          is 'pg�� �����ڵ�';
comment on column li_payment.pay_method      is '�������� �����ڵ�';
comment on column li_payment.pay_name        is '������� ��ǰ��';
comment on column li_payment.pay_price       is '�����ݾ�';
comment on column li_payment.pay_buyer_name  is '�ֹ��ڸ�';
comment on column li_payment.pay_buyer_tel   is '�ֹ��� ����ó';
comment on column li_payment.pay_buyer_email is '�ֹ��� �̸���';
comment on column li_payment.pay_date        is '��������';
comment on column li_payment.pay_status      is '��������';

--������ ������..

insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-1',1, 9205045442,'html5_inicis','card','������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',116000,'testUser1','01012341234','test1111@gmail.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-2',2, 9205045442,'html5_inicis','card','������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',55000,'testUser2','01012341234','test2222@gmail.com',3);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-3',3, 2302282828,'html5_inicis','card','������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',348000,'�̰��','01017441744','linda284@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-4',4, 2001110723,'html5_inicis','card','������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',174000,'������','01012341234','jmlim1107@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-5',5, 2303290722,'html5_inicis','card','������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',348000,'���ҿ�','01012341234','wjdthdud13@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-6',6, 2303290612,'html5_inicis','card','������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',159000,'������','01095990612','dndqo49@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-7',7, 2303290625,'html5_inicis','card','������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',53000,'���μ�','01012341234','ics9133@gmail.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-8',8, 9205045442,'html5_inicis','card','Ȩī���� ����, �ڵ�帳 ������ Ŭ����',60000,'������','01012341234','kimeunazip@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-9',9, 2302282828,'html5_inicis','card','Ȩī���� ����, �ڵ�帳 ������ Ŭ����',25000,'�̰��','01017441744','linda284@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-10',10, 2302282828,'html5_inicis','card','Ȩī���� ����, �ڵ�帳 ������ Ŭ����',35000,'�̰��','01017441744','linda284@naver.com',0);

insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-11',11, 2302282828,'html5_inicis','card','������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',156000,'�̰��','01017441744','linda284@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-12',12, 2001110723,'html5_inicis','card','������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',324000,'������','01012341234','jmlim1107@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-13',13, 2303290722,'html5_inicis','card','������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',106000,'���ҿ�','01012341234','wjdthdud13@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-14',14, 2303290612,'html5_inicis','card','������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',78000,'������','01095990612','dndqo49@naver.com',3);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-15',15, 2303290625,'html5_inicis','card','������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����',52000,'���μ�','01012341234','ics9133@gmail.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-16',16, 9205045442,'html5_inicis','card','������ ����, �ó��� ĵ��, �ν�Ÿ�� �����',54000,'������','01012341234','kimeunazip@naver.com',3);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-17',17, 2302282828,'html5_inicis','card','������ ����, �ó��� ĵ��, �ν�Ÿ�� �����',112000,'�̰��','01017441744','linda284@naver.com',3);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-18',18, 2001110723,'html5_inicis','card','������ ����, �ó��� ĵ��, �ν�Ÿ�� �����',81000,'������','01012341234','jmlim1107@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-19',19, 2303290722,'html5_inicis','card','������ ����, �ó��� ĵ��, �ν�Ÿ�� �����',27000,'���ҿ�','01012341234','wjdthdud13@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-20',20, 2303290612,'html5_inicis','card','������ ����, �ó��� ĵ��, �ν�Ÿ�� �����',54000,'������','01095990612','dndqo49@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-21',21, 2303290625,'html5_inicis','card','������ ����, �ó��� ĵ��, �ν�Ÿ�� �����',120000,'���μ�','01012341234','ics9133@gmail.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-22',22, 9205045442,'html5_inicis','card','���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)',147000,'������','01012341234','kimeunazip@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-23',23, 2302282828,'html5_inicis','card','���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)',49000,'�̰��','01017441744','linda284@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-24',24, 2001110723,'html5_inicis','card','���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)',94000,'������','01012341234','jmlim1107@naver.com',0);
insert into li_payment(merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email,pay_status)
values('KH-LICLASS-25',25, 2303290722,'html5_inicis','card','���� ���ǰ���� �� ������ ��ǰ �������� (�۽��� 50�̸�)',80000,'���ҿ�','01012341234','wjdthdud13@naver.com',0);


--12.li_refund

create table li_refund(
    refund_no     number       not null, -- ȯ�ҹ�ȣ
    merchant_uid  varchar2(50) not null, -- �ֹ���ȣ
    user_no       number       not null, -- ȸ����ȣ
    refund_date   date default sysdate,  -- ȯ������
    refund_price  number       not null, -- ȯ�ұݾ�
    refund_method varchar2(50) not null, -- ȯ�Ҽ���
    refund_status number       not null,  -- ȯ�һ��� 0 = ȯ�� ����, 1 = ȯ�� ����
    
    constraint li_refund_pk primary key(refund_no),
    constraint li_refund_fk2 foreign key(merchant_uid) references li_payment(merchant_uid),
    constraint li_refund_fk3 foreign key(user_no) references li_user(user_no)
);

comment on table li_refund is 'ȯ�� ���̺�';
comment on column li_refund.refund_no     is 'ȯ�ҹ�ȣ';
comment on column li_refund.merchant_uid  is '�ֹ���ȣ';
comment on column li_refund.user_no       is 'ȸ����ȣ';
comment on column li_refund.refund_date   is 'ȯ������';
comment on column li_refund.refund_price  is 'ȯ�ұݾ�';
comment on column li_refund.refund_method is 'ȯ�Ҽ���';
comment on column li_refund.refund_status is 'ȯ�һ���';


insert into li_refund(REFUND_NO,MERCHANT_UID,USER_NO,REFUND_PRICE,REFUND_METHOD,REFUND_STATUS)
values(1,'KH-LICLASS-14','2303290612',78000,'card',0);
insert into li_refund(REFUND_NO,MERCHANT_UID,USER_NO,REFUND_PRICE,REFUND_METHOD,REFUND_STATUS)
values(2,'KH-LICLASS-16','9205045442',54000,'card',0);
insert into li_refund(REFUND_NO,MERCHANT_UID,USER_NO,REFUND_PRICE,REFUND_METHOD,REFUND_STATUS)
values(3,'KH-LICLASS-17','2302282828',112000,'card',0);
insert into li_refund(REFUND_NO,MERCHANT_UID,USER_NO,REFUND_PRICE,REFUND_METHOD,REFUND_STATUS)
values(4,'KH-LICLASS-2','9205045442',55000,'card',0);


--13.
-- ��Ʃ��� ���̺�
create table li_studio(
    s_no number(20) not null, --��Ʃ����Խ��� �۹�ȣ
    ct_bizno varchar2(30) not null, --����ڵ�Ϲ�ȣ
    s_title varchar2(300) not null, --��Ʃ����Խ��� ����
    s_content varchar2(700) not null, --��Ʃ����Խ��� ����
    s_date date default sysdate, --��Ʃ����Խ��� �ۼ���
    s_thumb varchar2(700), --��Ʃ����Խ��� �����
    s_file varchar2(700), --��Ʃ����Խ��� ���ϸ�

    constraint li_studio_pk primary key(s_no),
    constraint li_studio_fk foreign key(ct_bizno)
                               references li_center(ct_bizno)

);


--drop table li_studio;
--drop sequence li_studio_seq;

comment on table li_studio is '��Ʃ��� ���̺�';
comment on column li_studio.s_no is '��Ʃ����Խ��� �۹�ȣ';
comment on column li_studio.ct_bizno is '����ڵ�Ϲ�ȣ';
comment on column li_studio.s_title is '��Ʃ����Խ��� ����';
comment on column li_studio.s_content is '��Ʃ����Խ��� ����';
comment on column li_studio.s_date is '��Ʃ����Խ��� �ۼ���';
comment on column li_studio.s_thumb is '��Ʃ����Խ��� �����';
comment on column li_studio.s_file is '��Ʃ����Խ��� ���ϸ�';

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(1, '6670500768', '����������ũ ȫ��', '�ν�Ÿ @soosoo_cake

��������ũ / ��������ũ / ����ӱ��ö�� / �����ʶ�

??Gwangmyeong, Korea (��⵵ ���� 7ȣ�� ö�꿪)
??KFDA 1�� ����
??�ӱ��ö�� ����/������ Ŭ���� � �� �Ǹ�
??�� ������Ŭ���� �
??����??īī���� �÷���ģ�� ��������ũ (dm??)
pf.kakao.com/_xiDAxlxl', 'thumbnail_studio_1680068537446_soosoo.png', 'studio_1680068537446_soosoo.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(2, '6538102174', '���� ȫ��', '��ö ����� ������� ���� ����û �Դϴ�.
�������� ���ż� �Բ� �������� ��������?', 'thumbnail_studio_1680068580449_����.png', 'studio_1680068580449_����.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(3, '4121097783', '������� ȫ��', '�ٴ����� �ٱ��� ������� �ݶ�
���ż� �Բ� �����ƿ�', 'thumbnail_studio_1680068614488_hellohappy.jpg', 'studio_1680068614488_hellohappy.jpg');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(4, '8177000186', '�����̵� �������� ȫ��', '�Բ� ���� ���� �����ƿ�',
    'thumbnail_studio_1680068691710_�����̵�.jpg', 'studio_1680068691710_�����̵�.jpg');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(5, '1113274803', '����õ���� �����ƶ㸮�� ȫ��', '�ν�Ÿ @thebom_atelier

����õ���� �����ƶ㸮��
�����ƶ㸮��
����õ����
����õ ������
����õ ĵ��/��ǻ��/���������/�ö��ĵ��
õ����/õ��ȭ��ǰ/���/õ���Կ���
������Ŭ����
���/�ڰ���/â������
��ü����/���ǰ/���׸����ǰ
��ü����/����Ⱝ
īī��ID:�����ƶ㸮��
linktr.ee/thebom_atelier', 'thumbnail_studio_1680068799843_�����ƶ㸮��.png', 'studio_1680068799843_�����ƶ㸮��.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(6, '1011445141', '�̱��Ѱ� ȫ��', '�ν�Ÿ : @chewymill

??????????????? | �ڵ���̵� ���� | ��̻�Ȱ DIY
���� ���� �� �׸���ũ
? ���� �̱��� Ű��Ʈ ��̻�Ȱ
? ��ģ ���� �������ִ� ���� ģ����
? �ε�ĩ ����ִ� �ڵ���̵� DIY
?
? Kidult Brand��@wittypixy
? Made by��@choran_log
-
linktr.ee/chewymill', 'thumbnail_studio_1680068852892_�̱��Ѱ�.png', 'studio_1680068852892_�̱��Ѱ�.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(7, '0200600028', '��������ring ȫ��', '�ν�Ÿ : @iam_your_ring
Yes, I AM
#�÷��̸��Ű�� #�ø�Ű�� #����Ű�� #�½�Ű�� #��Ƽ������#�÷��̸��??
?Ŭ�������Ǵ� DM Ȥ�� ī�� ���!
?���Ź��ǵ� DM Ȥ�� ī�� ���!
?īī���÷���ģ���� yes_iam �̿���.
?���̵��,������ ������� �մϴ�?
m.smartstore.naver.com/iam_your_ring', 'thumbnail_studio_1680068887485_��������.png', 'studio_1680068887485_��������.png');
    
INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(8, '2299012336', '�޺�� ȫ��', '�ν�Ÿ @kkooomblooom

��⵵ ������ �߿��� �ݱ����� ��ġ�� �����, ��Ʈ ��Ʃ��� �Դϴ�.
�Ҽ������� ���ڱ� ������ �̼� ������ �̷������  ���������� ������ �����Դϴ�. ;)', 'thumbnail_studio_1680068932139_�޺��.png', 'studio_1680068932139_�޺��.png');

INSERT INTO li_studio(s_no, ct_bizno, s_title, s_content, s_thumb, s_file)
    VALUES(9, '1641100542', '�Ӻ�������Ʈ��Ʃ��� ȫ��', '�ν�Ÿ @anverscake

?���͸�����ũŬ����/�����η��͸�����ũ/�Ӻ�������ũ

?[����������ũ] �Ⱓ
?? ���͸�����ũâ��Ŭ����
?? Ŀ��������ũ�����ֹ�����(��.�� �޹�)
�����а���� �ż��ϰ� ���� ����ũ
010.9978.4684 (īī����anvers)
?�����ν� ������ 28���� 5 .1��
?[����������ũ]å �¶��α���
?
link.inpock.co.kr/anverscake', 'thumbnail_studio_1680069012758_�Ӻ�������Ʈ��Ʃ���.png', 'studio_1680069012758_�Ӻ�������Ʈ��Ʃ���.png');



--��Ʃ��� ���̺� ������
create sequence li_studio_seq
start with 10
increment by 1
minvalue 1
nocycle
nocache;


select * from li_studio;

--10.

------------------ �ı� ���̺� -----------------------------

CREATE TABLE Li_Review(
    review_no NUMBER(4) primary key,        -- ���� ��ȣ
    review_title varchar2(100) not null,    -- ���� ����
    review_content CLOB not null,           -- ���� ������
    review_date DATE not null,              -- ���� ���ε���
    review_update DATE NULL,                -- ���� ������Ʈ��
    review_status NUMBER(2) not null,       -- ���� ����
    review_rating number(2) null,           -- ���� ����
    review_recommend varchar2(40) null,     -- ���� ��õ(yes/no)
    
    -- (�ܷ�Ű)
    r_no number not null,                       -- ���� ��ȣ
    c_no NUMBER(8) not null,                    -- Ŭ���� ��ȣ
    user_no NUMBER not null,                    -- ���� ��ȣ

     
    CONSTRAINT li_review_fk1 FOREIGN KEY(r_no) REFERENCES Li_reserve (r_no),        -- ���� ��ȣ
    CONSTRAINT li_review_fk3 FOREIGN KEY(user_no) REFERENCES Li_user (user_no),     -- Ŭ���� ��ȣ
    CONSTRAINT li_review_fk4 FOREIGN KEY(c_no) REFERENCES Li_class (c_no)           -- ���� ��ȣ

);

COMMENT ON TABLE Li_Review is  '�ı� �Խ��� ���̺�';
COMMENT ON COLUMN Li_Review.review_no is '�ı� �Խñ� ��ȣ';
COMMENT ON COLUMN Li_Review.review_title is '�ı� ����';
COMMENT ON COLUMN Li_Review.review_content is '�ı� ����';
COMMENT ON COLUMN Li_Review.review_date is '�ı� �ۼ���';
COMMENT ON COLUMN Li_Review.review_update is '�ı� ������';
COMMENT ON COLUMN Li_Review.review_status is ' �ı� ����(0,1)';
COMMENT ON COLUMN Li_Review.review_rating is '�ı� ����';
COMMENT ON COLUMN Li_Review.review_recommend is '�ı� ��õ';




-- DROP SEQUENCE Li_review_seq;
-- Review ���̺� ������
CREATE SEQUENCE Li_review_seq
    INCREMENT BY 1
    START WITH 2
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
    NOCACHE
    NOORDER;
    
-- Test Insert(���� ������1)
--create or replace procedure reviewProcedure
--is
--begin
--    for cnt in 1..10 loop
--        insert into Li_review (review_no, review_title, review_content, review_date,review_update,review_status, review_rating, review_recommend, r_no, c_no, user_no)
--        values(li_review_seq.nextval, '��������~', '���ƿ�!~', sysdate,null, 1 , 4, 'yes' , 2 ,9 ,9205045442);
--    end loop;
--    commit;
--end;
--/
--show error;
--EXECUTE reviewProcedure;
--
---- Test Insert(���� ������2)
--create or replace procedure reviewProcedure
--is
--begin
--    for cnt in 1..10 loop
--        insert into Li_review (review_no, review_title, review_content, review_date,review_update,review_status, review_rating, review_recommend, r_no, c_no, user_no)
--        values(li_review_seq.nextval, '������~~', '������� �ʹ� ��ĥ�ؿ�̤�', sysdate,null, 1 , 2, 'No' , 2, 10, 2303290612);
--    end loop;
--    commit;
--end;
--/
--show error;
--EXECUTE reviewProcedure;