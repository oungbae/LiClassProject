--6.li_class_img

--클래스 이미지(Li_Class_img)      (update 23.03.23)
create table li_class_img (
    c_img_no number not null,                            --사진번호
    c_no number not null,                                --클래스 번호
    c_img_file varchar2(500) not null,                   --이미지 이름
    thumb_file varchar2(500) not null,                   --썸네일 이름
    c_img_date date default sysdate not null,            --이미지 등록일
    constraint li_class_img_pk primary key(c_img_no),
    constraint li_class_img_uk unique(c_img_file),
    constraint li_class_img_fk foreign key(c_no) references li_class(c_no)
);
comment on table li_class_img is '클래스 이미지 테이블';
comment on column li_class_img.c_img_file is '이미지 이름';
comment on column li_class_img.thumb_file is '썸네일 이름';
comment on column li_class_img.c_img_date is '이미지 등록일';

-- 03.29 은아 수정) 임의로1~18을 넣고 시작해야하므로 start with 19로 해봅니다.

--사진 번호 시퀀스
create sequence li_class_img_seq
increment by 1
start with 11
minvalue 1
nocycle
nocache;

--********** 테이블 변경내용 : DDL문에 모두 반영해놓았습니다! **********
--alter table li_class_img drop constraint LI_CLASS_IMG_UK2;
--************************************************************************
select * from li_class_img;



-- 23.03.29 은아 추가
-- c_img_no 번호 통일을 위해 여기서는 시퀀스를 사용하지않겠습니다.
--c_no 1의 이미지 3장.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(1,1,'thumbnail_class_1629551284217_플라워1.jpg','class_1629551284217_플라워1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(2,1,'thumbnail_class_1629551284317_플라워2.jpg','class_1629551284317_플라워2.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(3,1,'thumbnail_class_1629521284217_플라워3.jpg','class_1629521284217_플라워3.jpg');

--c_no 2의 이미지 3장.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(4,2,'thumbnail_class_1629551784312_핸드드립1.jpg','class_1629551784312_핸드드립1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(5,2,'thumbnail_class_1629551284312_핸드드립2.jpg','class_1629551284312_핸드드립2.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(6,2,'thumbnail_class_1629551284313_핸드드립3.jpg','class_1629551284313_핸드드립3.jpg');

--c_no 3의 이미지 3장.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(7,3,'thumbnail_class_1679551784314_캔들1.jpg','class_1679551784314_캔들1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(8,3,'thumbnail_class_1679551784312_캔들2.jpg','class_1679551784312_캔들2.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(9,3,'thumbnail_class_1679551784514_캔들3.jpg','class_1679551784514_캔들3.jpg');

--c_no 4의 이미지 3장.
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(10,4,'thumbnail_class_1679551633205_향수1.jpg','class_1679551633205_향수1.jpg');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(11,4,'thumbnail_class_1679551634012_향수2.png','class_1679551634012_향수2.png');
insert into li_class_img(c_img_no,c_no,thumb_file,c_img_file)
values(12,4,'thumbnail_class_1679551634013_향수3.png','class_1679551634013_향수3.png');

--5. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(13,5,'class5.jpg','thumbnail_class5.jpg');

--6. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(14,6,'class6.jpg','thumbnail_class6.jpg');

--7. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(15,7,'class7.jpg','thumbnail_class7.jpg');

--8. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(16,8,'class8.jpg','thumbnail_class8.jpg');

--9. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(17,9,'class9.jpg','thumbnail_class9.jpg');

--10. 
insert into li_class_img(c_img_no,c_no,c_img_file,thumb_file)
values(18,10,'class10.jpg','thumbnail_class10.jpg');

