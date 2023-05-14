select * from DETAI
select * from KHOA
select * from GIAOVIEN
select * from ThamGiaDT

--Cau 1 (chuan roi anh)
create table ThamGiaDT (
	madt char(3),
	magv char (5),
	phucap float,
	tiendo nchar(10)
	primary key(madt, magv)
)
--drop table ThamGiaDT

--Cau 2 (khong chac dung)
alter table thamgiadt
add constraint fk_madt
foreign key (madt)
references detai(madt)

alter table thamgiadt
add constraint fk_magv
foreign key (magv)
references giaovien(magv)

--Cau 3 (dung 100)
alter table giaovien
add constraint kiemTraNgaySinh
check (year(getdate()) - year(ngsinh) > 25)

--Cau 4 (dung 100 )
insert into ThamGiaDT
select MADT,'001',5000000,'0%'
from DETAI 
where makhoa like 'CNTT'

--Cau 5 (dung 100%)
update DETAI
set KINHPHI = KINHPHI * 0.2
where MONTH(ngaykt) - MONTH(ngaybd) > 15

--CAu 6 (dung 100%)
select *
from GIAOVIEN
where phai = N'Nữ' and	MONTH(getdate()) = MONTH(ngsinh)

--Cau 7 (khong chac dung)
select detai.*
from GIAOVIEN join KHOA on GIAOVIEN.makhoa = khoa.makhoa
	left join DETAI on detai.makhoa = khoa.makhoa
where MAGV = '004'

--Cau 8(chua hoan thanh)


--Cau 9 (dung 100)
select *
from DETAI
where KINHPHI >= (select AVG(kinhphi) from detai)

--Cau 10(chua hoan thanh)
select * from ThamGiaDT
select * from DETAI
select * from KHOA
select * from GIAOVIEN

select 
from detai join khoa on detai.makhoa=khoa.makhoa
group by 	

--Cau 11 (dung 100)
select khoa.makhoa, TENKHOA, matrkhoa, HOTEN as HoTenGiangVien
from khoa join GIAOVIEN on khoa.makhoa=GIAOVIEN.makhoa