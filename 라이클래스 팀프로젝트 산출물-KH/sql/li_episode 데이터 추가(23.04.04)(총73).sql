drop sequence li_episode_seq;
create sequence li_episode_seq
start with 74
increment by 1
minvalue 1
nocycle
nocache;


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
