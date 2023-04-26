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
    pay_point	  number        not null,  -- 사용 포인트
    
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


insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-01', 1, 2303291111, 'html5_inicis', 'card', '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 116000, 'testUser1', '01012341234', 'test1111@gmail.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-02', 2, 2303292222, 'html5_inicis', 'card', '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 55000, 'testUser2', '01012341234', 'test2222@gmail.com', 3);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-03', 3, 2302282828, 'html5_inicis', 'card', '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 348000, '이경민', '01017441744', 'linda284@naver.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-04', 4, 2001110723, 'html5_inicis', 'card', '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 174000, '임지민', '01012341234', 'jmlim1107@naver.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-05', 5, 2303290722, 'html5_inicis', 'card', '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 348000, '정소영', '01012341234', 'wjdthdud13@naver.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-06', 6, 2303290612, 'html5_inicis', 'card', '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 159000, '전웅배', '01095990612', 'dndqo49@naver.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-07', 7, 2303290625, 'html5_inicis', 'card', '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', 53000, '문민섭', '01012341234', 'ics9133@gmail.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-08', 8, 9205045442, 'html5_inicis', 'card', '홈카페의 시작, 핸드드립 원데이 클래스', 60000, '김은아', '01012341234', 'kimeunazip@naver.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-09', 9, 2302282828, 'html5_inicis', 'card', '홈카페의 시작, 핸드드립 원데이 클래스', 25000, '이경민', '01017441744', 'linda284@naver.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-10', 10, 2302282828, 'html5_inicis', 'card', '홈카페의 시작, 핸드드립 원데이 클래스', 35000, '이경민', '01017441744', 'linda284@naver.com', 0);