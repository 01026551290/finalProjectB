select * from member;

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

출처: https://all-record.tistory.com/151 [세상의 모든 기록]

commit;

select a.pointStatus,a.status,a.reserveId,a.fk_productid,a.price,a.reserveDate,a.checkIn,a.checkOut,a.checkout-a.checkin+1 as noNight,a.productName,a.roomType,a.fk_largecategoryontioncode as largeCategoryOntionCode,b.name,b.address,b.img 
	from
		(select a.pointStatus,a.status,a.reserveId,a.fk_productid,a.price,a.reservedate,a.checkin,a.checkout,b.fk_largecategoryontioncode,b.productname,b.roomtype 
		from
			(select a.pointStatus,a.status,a.reserveId,a.fk_productid,a.price,a.reservedate,b.checkin,b.checkout 
			from reserve1 a join reserve2 b
			on a.reserveid=b.fk_reserveid
--			where a.memberidx=#{memberidx}
            ) a join product b
		on a.fk_productid=b.productid) a join lontion b
	on a.fk_largecategoryontioncode=largecategoryontioncode;

