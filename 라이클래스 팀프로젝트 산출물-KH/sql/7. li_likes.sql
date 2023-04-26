-- 7. li_likes

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
create sequence li_likes_seq
start with 7
increment by 1
minvalue 1
nocycle
cache 2;
-- drop sequence li_likes_seq;

--���� ������
-- like_no ��ȣ ������ ���� ���⼭�� �������� ��������ʰڽ��ϴ�.
-- Ż��ȸ���� �����ϰ� ���� ȸ�� 2�� ���Ƿ� ����Ŭ���� ����ϰڽ��ϴ�.

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(1,sysdate,2303291111,5);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(2,sysdate,2303291111,6);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(3,sysdate,2303291111,7);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(4,sysdate,2303292222,8);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(5,sysdate,2303292222,9);

insert into li_likes(like_no,like_regdate,user_no,c_no)
values(6,sysdate,2303292222,10);

