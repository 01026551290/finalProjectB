select * from review;
select * from review_img;
select * from lontion;
select fk_largecategoryontioncode,count(*) from product group by fk_largecategoryontioncode;
select * from member where memberid='minam';

update member set status=1 where memberid='minam';

commit;
rollback;
select * from reserve2;

-- 예약취소 
select a.price,a.reserveDate,a.checkIn,a.checkOut,a.noNight,b.name,b.address,b.img,b.productName,b.roomType
from 
    (
    select fk_productid,price,reservedate,checkin,checkout,checkout-checkin+1 as nonight
    from reserve1 a join reserve2 b
    on a.reserveid=b.fk_reserveid
    where a.reserveid=40
    ) a join (
    select name,address,img,productid,productname,roomtype
    from lontion a join product b
    on a.largecategoryontioncode=b.fk_largecategoryontioncode
    ) b
on a.fk_productid=b.productid;
-- 예약취소 

update reserve1 set checkin= where reserveid=11;

select * from reserve1;
select * from reserve2;
select * from reserve1 a join reserve2 b on a.reserveid=b.fk_reserveid;
select * from review;
select * from member;

alter table reserve1 add(pointStatus number(1) default 1);

update member set point=1000 where memberid='chez';

ALTER TABLE reserve1 ADD CONSTRAINT test_ck_reserve;

ALTER TABLE reserve1 ADD CONSTRAINT test_ck_reserve CHECK(pointstatus in (1));
ALTER TABLE reserve1 DROP CONSTRAINT test_ck_reserve


commit;

--구매기록
select a.title,a.pointStatus,a.status,a.reserveId,a.fk_productid,a.price,a.reserveDate,a.checkIn,a.checkOut,a.checkout-a.checkin+1 as noNight,a.productName,a.roomType,a.fk_largecategoryontioncode as largeCategoryOntionCode,b.name,b.address,b.img 
	from
		(select a.title,a.pointStatus,a.status,a.reserveId,a.fk_productid,a.price,a.reservedate,a.checkin,a.checkout,b.fk_largecategoryontioncode,b.productname,b.roomtype 
		from
			(select a.*,b.title as title
            from 
                (
                select a.memberidx,a.pointStatus,a.status,a.reserveId,a.fk_productid,a.price,a.reservedate,b.checkin,b.checkout 
                from reserve1 a join reserve2 b
                on a.reserveid=b.fk_reserveid
                ) a left join review b
                on a.reserveid=b.reserveidx
                where a.memberidx=89
--                #{memberidx}
            ) a join product b
		on a.fk_productid=b.productid) a join lontion b
	on a.fk_largecategoryontioncode=largecategoryontioncode;
--구매기록
select * from review where memberidx=89;

select distinct col as pontion
		from(
			Select Regexp_Substr((select roomoption from (select listagg(roomoption||',')within group (order by roomoption) as roomoption
			from (select 1,roomoption from product)
			group by 1)),'[^,]+', 1, Level) COL From Dual
			Connect By Regexp_Substr((select roomoption from (select listagg(roomoption||',')within group (order by roomoption) as roomoption
			from (select 1,roomoption from product)
			group by 1)), '[^,]+', 1, Level) Is Not Null
		);
        
        
select distinct col as lontion
		from(
			Select Regexp_Substr((select ontiontype from (select listagg(ontiontype||',')within group (order by ontiontype) as ontiontype
			from (select 1,ontiontype from lontion)
			group by 1)),'[^,]+', 1, Level) COL From Dual
			Connect By Regexp_Substr((select ontiontype from (select listagg(ontiontype||',')within group (order by ontiontype) as ontiontype
			from (select 1,ontiontype from lontion)
			group by 1)), '[^,]+', 1, Level) Is Not Null
		);        