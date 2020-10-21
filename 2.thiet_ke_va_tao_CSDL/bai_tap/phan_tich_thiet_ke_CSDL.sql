create database bai_tap2;
use bai_tap2;
create table khachHang(
maKH int primary key,
tenCongTyKH varchar(50) not null,
hoKH varchar(50) not null,
tenKH varchar(50) not null,
phone varchar(50) not null,
diaChi1 varchar(50) not null,
diaChi2 varchar(50),
thanhPho varchar(50) not null,
vung varchar(50) not null,
maVung varchar(15) not null,
quocGia varchar(50) not null,
hanMucTinDung double
);
create table donHangCuaKhach(
maHoaDon int primary key,
ngayMua date not null,
ngayYeuCauGiaoSP date not null,
ngayGiaoThucTe date not null,
trangThai varchar(15) not null,
ghiChu text,
soLuongDatHang int not null,
donGia double not null
);
create table thanhToan(
maKH int not null,
maKiemTra varchar(50) not null,
ngayThanhToan date not null,
soTien double not null
);
create table sanPham(
maSP varchar(15) primary key,
tenSP varchar(70) not null,
phamViSP varchar(10) not null,
nhaCungCap varchar(50) not null,
moTaSP text not null,
soLuongTrongKho int not null,
giaNhap double not null,
giaBanLe double not null
);
create table loaiSP(
maLoaiSP varchar(50) primary key,
moTa text not null,
anh varchar(1000)  not null
);
create table nhanVien(
maNhanVien int primary key,
hoNhanVien varchar(50) not null,
tenNhanVien varchar(50) not null,
email varchar(100) not null,
tenCongViec varchar(50) not null
);
create table vanPhong(
maVanPhong varchar(10) primary key,
thanhPho varchar(50) not null,
dienThoai varchar(50) not null,
diaChi1 varchar(50) not null,
diaChi2 varchar(50),
vung varchar(50),
quocGia varchar(50) not null,
maVung varchar(15) not null
);

create table chiTietDonHang(
maHoaDon int,
maSP varchar(15),
primary key (maHoaDon,maSP)
);



alter table donHangCuaKhach 	
add maKH int;

alter table donHangCuaKhach
add constraint donHangCuaKhach_fk
foreign key(maKH) references khachHang(maKH);



alter table thanhToan
add constraint thanhToan_fk
foreign key(maKH) references khachHang(maKH);

alter table chiTietDonHang
add constraint chiTietDonHang_fk
foreign key(maHoaDon) references donHangCuaKhach(maHoaDon);

alter table chiTietDonHang
add constraint chiTietDH_fk
foreign key(maSP) references sanPham(maSP);

alter table sanPham
add maLoaiSP varchar(50);

alter table sanPham
add constraint sanPham_fk
foreign key(maLoaiSP) references loaiSP(maLoaiSP);

alter table khachHang
add maNhanVien int;

alter table khachHang
add constraint khachHang_fk
foreign key(maNhanVien) references nhanVien(maNhanVien);

alter table nhanVien
add maVanPhong varchar(10);

alter table nhanVien
add constraint nhanVien_fk
foreign key(maVanPhong) references vanPhong(maVanPhong);

alter table nhanVien
add maNV int;

alter table nhanVien
add constraint nV_fk
foreign key(maNV) references nhanVien(maNhanVien);

