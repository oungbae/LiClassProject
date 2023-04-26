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

insert into li_refund( refund_no, merchant_uid, user_no, refund_price, refund_method, refund_status )
values( 1, 'liclass-02', 2303292222, 55000, 'card', 0 );