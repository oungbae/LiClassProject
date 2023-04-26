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

insert into li_refund( refund_no, merchant_uid, user_no, refund_price, refund_method, refund_status )
values( 1, 'liclass-02', 2303292222, 55000, 'card', 0 );