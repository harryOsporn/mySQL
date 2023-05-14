create database quanLyDeTai
go
use quanLyDeTai
go

create table GIAOVIEN 
(
	MAGV char (5), 
	HOTEN nvarchar(40), 
	LUONG float, 
	PHAI nchar(3), 
	NGSINH datetime, 
	makhoa char(4)
	PRIMARY KEY (MAGV)
)
create table KHOA 
(
	makhoa char(4), 
	TENKHOA nvarchar(40), 
	matrkhoa char(5), 
	PRIMARY KEY (MAKHOA)	
)
create table DETAI 
(
	MADT char(3), 
	KINHPHI float, 
	NGAYBD datetime, 
	NGAYKT datetime, 	
	makhoa char(4)	
	PRIMARY KEY (MADT)
)
insert into DETAI (MADT, KINHPHI, NGAYBD, NGAYKT, makhoa) values ('001',20,'10/20/2007','10/20/2008','CNTT')
insert into DETAI (MADT, KINHPHI, NGAYBD, NGAYKT, makhoa) values ('002',20,'10/12/2000','10/12/2001','CNTT')
insert into DETAI (MADT, KINHPHI, NGAYBD, NGAYKT, makhoa) values ('003',300,'05/15/2008','05/15/2010','HH')
insert into DETAI (MADT, KINHPHI, NGAYBD, NGAYKT, makhoa) values ('004',100,'01/01/2007','12/31/2009','SH')
insert into DETAI (MADT, KINHPHI, NGAYBD, NGAYKT, makhoa) values ('005',200,'10/10/2003','12/10/2004','HH')
insert into DETAI (MADT, KINHPHI, NGAYBD, NGAYKT, makhoa) values ('006',4000,'10/20/2006','10/20/2009','SH')
insert into DETAI (MADT, KINHPHI, NGAYBD, NGAYKT, makhoa) values ('007',20,'5/10/2009','05/10/2010','CNTT')
--alter table giaovien
--drop constraint fk_maKhoa

alter table giaovien
add constraint fk_maKhoa
foreign key (makhoa)
references khoa(maKhoa)

alter table khoa
add constraint fk_maTrKhoa
foreign key (matrkhoa)
references giaovien(magv)

alter table detai
add constraint fk_maKhoa2
foreign key (makhoa)
references khoa(maKhoa)

insert into KHOA values ('CNTT',N'Công nghệ thông tin',null)
insert into KHOA values ('VL',N'Vật lý',null)
insert into KHOA values ('SH',N'Sinh học',null)
insert into KHOA values ('HH',N'Hóa học',null)

insert into GIAOVIEN values ('001',N'Nguyễn Hoài An',2000,N'Nam','02/15/1973', 'CNTT')
insert into GIAOVIEN values ('002',N'Trần Trà Hương',2500,N'Nữ','06/20/1960','SH')
insert into GIAOVIEN values ('003',N'Nguyễn Ngọc Ánh',2200,N'Nữ','05/11/1975','VL')
insert into GIAOVIEN values ('004',N'Trương Nam Sơn',2300,N'Nam','06/20/1959','CNTT')
insert into GIAOVIEN values ('005',N'Lý Hoàng Hà',2500,N'Nam','10/23/1954','CNTT' )
insert into GIAOVIEN values ('006',N'Trần Bạch Tuyết',1500,N'Nữ','05/20/1980','HH')
insert into GIAOVIEN values ('007',N'Nguyễn An Trung',2100,N'Nam','06/05/1976','CNTT')
insert into GIAOVIEN values ('008',N'Trần Trung Hiếu',1800,N'Nam','08/06/1977','VL')
insert into GIAOVIEN values ('009',N'Trần Hoàng Nam',2000,N'Nam','11/22/1975','SH')
insert into GIAOVIEN values ('010',N'Phạm Nam Thanh',1500,N'Nam','12/12/1980','HH')

update KHOA
set matrkhoa = '010'
where makhoa = 'HH'