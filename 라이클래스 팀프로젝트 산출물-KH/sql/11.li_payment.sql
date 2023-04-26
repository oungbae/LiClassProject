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
    pay_point	  number        not null,  -- ��� ����Ʈ
    
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


insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-01', 1, 2303291111, 'html5_inicis', 'card', '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 116000, 'testUser1', '01012341234', 'test1111@gmail.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-02', 2, 2303292222, 'html5_inicis', 'card', '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 55000, 'testUser2', '01012341234', 'test2222@gmail.com', 3);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-03', 3, 2302282828, 'html5_inicis', 'card', '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 348000, '�̰��', '01017441744', 'linda284@naver.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-04', 4, 2001110723, 'html5_inicis', 'card', '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 174000, '������', '01012341234', 'jmlim1107@naver.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-05', 5, 2303290722, 'html5_inicis', 'card', '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 348000, '���ҿ�', '01012341234', 'wjdthdud13@naver.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-06', 6, 2303290612, 'html5_inicis', 'card', '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 159000, '������', '01095990612', 'dndqo49@naver.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-07', 7, 2303290625, 'html5_inicis', 'card', '������ �ݼ��� �Ǵ� ��������� �ö�� �ɴٹ� ������ Ŭ����', 53000, '���μ�', '01012341234', 'ics9133@gmail.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-08', 8, 9205045442, 'html5_inicis', 'card', 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', 60000, '������', '01012341234', 'kimeunazip@naver.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-09', 9, 2302282828, 'html5_inicis', 'card', 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', 25000, '�̰��', '01017441744', 'linda284@naver.com', 0);
insert into li_payment( merchant_uid, r_no, user_no, pay_pg, pay_method, pay_name, pay_price, pay_buyer_name, pay_buyer_tel, pay_buyer_email, pay_status )
values( 'liclass-10', 10, 2302282828, 'html5_inicis', 'card', 'Ȩī���� ����, �ڵ�帳 ������ Ŭ����', 35000, '�̰��', '01017441744', 'linda284@naver.com', 0);