alter table li_reserve add REVIEW_STATUS NUMBER default 0 not null;
comment on column li_reserve.review_status is '리뷰상태';

--예약번호 14, 16, 17 == 환불된 예약건들
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