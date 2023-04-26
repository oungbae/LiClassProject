--Á¶¿ø ¾ÆÀÌµğ (update 23.04.04)

--Àº¾Æ
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('9205045442','kimeunazip@naver.com','1234','±èÀº¾Æ','01012341234','0');

--¹Î¼·
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2303290625','ics9133@gmail.com','1234','¹®¹Î¼·','01012341234','0');

--¿õ¹è
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2303290612','dndqo49@naver.com','1234','Àü¿õ¹è','01095990612','0');

--¼Ò¿µ
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2303290722','wjdthdud13@naver.com','1234','Á¤¼Ò¿µ','01012341234','0');

--Áö¹Î
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2001110723','jmlim1107@naver.com','1234','ÀÓÁö¹Î','01012341234','0');

--°æ¹Î
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_type)
values('2302282828','linda284@naver.com','0000','ÀÌ°æ¹Î','01017441744','0');

--23.04.03 ±â´ÉÈ®ÀÎÀ» À§ÇÑ Ãß°¡ÀÛ¾÷
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

