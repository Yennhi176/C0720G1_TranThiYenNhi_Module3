create database ung_dung_quan_ly_thu_vien_p1;
use ung_dung_quan_ly_thu_vien_p1;

create table sach(
maSach int primary key,
tenSach varchar(50),
nhaXuatBan varchar(50),
tacGia varchar(50),
namXuatBan date,
soLanXuatBan int,
gia double,
anh varchar(4000)
);

create table loaiSach(
maLoaiSach int primary key,
tenSach varchar(50),
phanLoaiSach varchar(50)
);

create table sinhVien(
maSV int primary key,
tenSV varchar(50),
ngaySinh date,
diaChi varchar(50),
email varchar(50),
soDT int,
anh varchar(4000)
);

create table phieuMuon(
maPhieuMuon int primary key,
tenSach varchar(50),
ngayMuon date,
ngayTra date
);

create table chiTietPhieuMuon(
maPhieu int,
maSach int,
primary key(maPhieu,maSach)
);

alter table sach
add maLoaiSach int;

alter table sach
add constraint sach_fk
foreign key(maLoaiSach) references loaiSach(maLoaiSach);

alter table chiTietPhieuMuon
add constraint chiTietPhieuMuon_fk
foreign key(maPhieu) references phieuMuon(maPhieuMuon);

alter table chiTietPhieuMuon
add constraint chiTiet_fk
foreign key(maSach) references sach(maSach);

alter table phieuMuon
add maSV int;

alter table phieuMuon
add constraint phieuMuon_fk
foreign key(maSV) references sinhVien(maSV);


