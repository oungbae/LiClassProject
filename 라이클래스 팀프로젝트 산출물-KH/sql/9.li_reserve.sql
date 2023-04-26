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
values( 1, 2303291111, 2, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'), '23/03/29', 2, 2, 116000 );
insert into li_reserve( r_no, user_no, ep_no, c_title, r_date, reg_date, r_state, r_cnt, r_price )
values( 2, 2303292222, 11, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스',to_date('2023/04/04 15:00','yyyy/mm/dd hh24:mi'), '23/03/29', 3, 1, 55000 ); --예약취소
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

--시퀀스 사용안함..