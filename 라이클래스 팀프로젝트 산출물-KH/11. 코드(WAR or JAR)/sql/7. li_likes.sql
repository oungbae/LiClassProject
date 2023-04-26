-- 7. li_likes

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
create sequence li_likes_seq
start with 7
increment by 1
minvalue 1
nocycle
cache 2;
-- drop sequence li_likes_seq;

--샘플 데이터
-- like_no 번호 통일을 위해 여기서는 시퀀스를 사용하지않겠습니다.
-- 탈퇴회원을 제외하고 샘플 회원 2명 임의로 관심클래스 등록하겠습니다.

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

