drop database case_study;
create database case_study;
use case_study;
create table dichVu(
idDichVu int primary key,
tenDichVu varchar(45),
dienTich int,
soTang int,
soNguoiToiDa varchar(45),
chiPhiThue varchar(45),
trangThai varchar(45)
);

create  table dichVuDiKem(
idDichVuDiKem int primary key,
tenDichVuDiKem varchar(45),
gia int,
donVi int,
trangThaiKhaDung varchar(45)
);

create table kieuThue(
idKieuThue int primary key,
tenKieuThue varchar(45),
gia int 
);

create table loaiDichVu(
idLoaiDichVu int primary key,
tenLoaiDichVu varchar(45)
);

create table hopDong(
idHopDong int primary key,
ngayLamHopDong date,
ngayKetThuc date,
tienDatCoc int,
tongTien int
);

create table khachHang(
idKhachHang int primary key,
hoTen varchar(45),
ngaySinh varchar(45),
soCMND varchar(45),
sdt  varchar(45),
email varchar(45),
diaChi varchar(45)
);

create table loaiKhachHang(
idLoaiKhach int primary key,
tenLoaiKhach varchar(45)
);

create table nhanVien(
idNhanVien int primary key,
hoTen int,
ngaySinh date,
soCMND varchar(45),
luong varchar(45),
sdt varchar(45),
email varchar(45),
diaChi varchar(45)
);

create table viTri(
idViTri int primary key,
tenViTri varchar(45)
);

create table trinhDo(
idTrinhDo int primary key,
trinhDo varchar(45)
);

create table boPhan(
idBoPhan int primary key,
tenBoPhan varchar(45)
);

create table hopDongChiTiet(
idHopDongChiTiet int primary key,
soLuong int
);

alter table nhanVien
add idViTri int;

alter table nhanVien
add constraint nhanVien_fk
foreign key (idViTri) references viTri(idViTri);

alter table nhanVien
add idTrinhDo int;

alter table nhanVien
add constraint nhanVien1_fk
foreign key (idTrinhDo) references trinhDo(idTrinhDo);

alter table nhanVien
add idBoPhan int;

alter table nhanVien
add constraint nhanVien2_fk
foreign key (idBoPhan) references boPhan(idBoPhan);

alter table hopDong
add idNhanVien int;

alter table hopDong
add constraint hopDong_fk
foreign key (idNhanVien) references nhanVien(idNhanVien);

alter table hopDong
add idKhachHang int;

alter table hopDong
add constraint hopDong1_fk
foreign key (idKhachHang) references khachHang(idKhachHang);

alter table hopDong
add idDichVu int;

alter table hopDong
add constraint hopDong2_fk
foreign key (idDichVu) references dichVu(idDichVu);

alter table hopDongChiTiet
add idHopDong int;

alter table hopDongChiTiet
add constraint hopDongChiTiet_fk
foreign key (idHopDong) references hopDong(idHopDong);

alter table hopDongChiTiet
add idDichVuDiKem int;

alter table hopDongChiTiet
add constraint hopDongChiTiet1_fk
foreign key (idDichVuDiKem) references dichVuDiKem(idDichVuDiKem);

alter table khachHang
add idLoaiKhach int;

alter table khachHang
add constraint khachHang_fk
foreign key (idLoaiKhach) references loaiKhachHang(idLoaiKhach);

alter table dichVu
add idKieuThue int;

alter table dichVu
add constraint dichVu_fk
foreign key (idKieuThue) references kieuThue(idKieuThue);

alter table dichVu
add idLoaiDichVu int;

alter table dichVu
add constraint dichVu1_fk
foreign key (idLoaiDichVu) references loaiDichVu(idLoaiDichVu);
