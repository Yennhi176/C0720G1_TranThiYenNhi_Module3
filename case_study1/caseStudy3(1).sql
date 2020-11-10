drop database case_study;
use case_study;

insert into dichVu values (null,"villa",30,2,"5","5000000","ok",1,1);
insert into dichVu values (null,"villa",40,4,"7","10000000","ok",2,2);
insert into dichVu values (null,"house",25,3,"4","3000000","ok",3,3);
insert into dichVu values (null,"room",20,1,"2","1000000","ok",4,4);
insert into dichVu values (null,"room",30,3,"1","2000000","ok",5,5);
insert into dichVu values (null,"house",35,1,"3","2000000","ok",6,6);

insert into dichVuDiKem values (null,"massage",100000,20,"tot");
insert into dichVuDiKem values (null,"karaoke",1000000,30,"tot");
insert into dichVuDiKem values (null,"thức ăn",500000,20,"tot");
insert into dichVuDiKem values (null,"nước uống",10000,10,"tot");
insert into dichVuDiKem values (null,"thuê xe",100000,20,"tot");

insert into kieuThue values (null,"ngày",5000000);
insert into kieuThue values (null,"năm",10000000);
insert into kieuThue values (null,"tháng",5000000);
insert into kieuThue values (null,"giờ",600000);
insert into kieuThue values (null,"ngày",2000000);
insert into kieuThue values (null,"tháng",4000000);

insert into loaiDichVu values (null,"villa");
insert into loaiDichVu values (null,"villa");
insert into loaiDichVu values (null,"house");
insert into loaiDichVu values (null,"room");
insert into loaiDichVu values (null,"room");
insert into loaiDichVu values (null,"house");

insert into hopDong values (null,'2019/02/01','2019/02/28',100000,5000000,1,1,1);
insert into hopDong values (null,'2020/03/05','2020/03/15',500000,2000000,2,2,2);
insert into hopDong values (null,'2019/04/02','2019/04/10',1000000,3000000,3,3,3);
insert into hopDong values (null,'2020/04/04','2020/04/05',600000,4000000,4,4,4);
insert into hopDong values (null,'2020/05/03','2020/05/06',800000,3000000,5,5,5);
-- insert into hopDong values (null,2/6/2020,16/6/2020,900000,2000000,6,6,6);

insert into hopDongChiTiet values (null,1,1,1);
insert into hopDongChiTiet values (null,1,2,2);
insert into hopDongChiTiet values (null,1,3,3);
insert into hopDongChiTiet values (null,1,4,4);
insert into hopDongChiTiet values (null,1,5,5);
-- insert into hopDongChiTiet values (null,1,6,6);

insert into khachHang values (null,"Trần Yến Nhi",'1998/06/17',"123456789","012345678","nhi@gmail.com","Đà Nẵng",1);
insert into khachHang values (null,"Nguyễn Hoàng Tứ",'1997/06/20',"223456789","112345678","tu@gmail.com","Quảng Nam",2);
insert into khachHang values (null,"Nguyễn Phúc Duy",'1997/06/12',"323456789","212345678","duy@gmail.com","Quảng Trị",3);
insert into khachHang values (null,"Võ Thành Khôi",'1993/05/23',"423456789","312345678","tin@gmail.com","Quảng Ngãi",4);
insert into khachHang values (null,"Bùi Huỳnh Như",'1996/01/19',"523456789","412345678","nhu@gmail.com","Đà Nẵng",5);


insert into loaiKhachHang values (null,"Diamond");
insert into loaiKhachHang values (null,"silver");
insert into loaiKhachHang values (null,"bronze");
insert into loaiKhachHang values (null,"golden");



insert into nhanVien values (null,"Hoàng1",'1982/06/02',"134567890","500000","987654321","hoang123@gmail.com","Huế",1,1,1);
insert into nhanVien values (null,"Thúy",'1985/03/13',"234567890","5000000","887654321","thuy123@gmail.com","Đà Nẵng",2,2,2);
insert into nhanVien values (null,"Thanh",'1997/06/17',"334567890","5000000","787654321","thanh123@gmail.com","Đà Nẵng",3,3,3);
insert into nhanVien values (null,"Việt",'1992/07/20',"434567890","5000000","687654321","viet123@gmail.com","Quảng Trị",4,4,4);
insert into nhanVien values (null,"Ngân",'1998/03/06',"534567890","5000000","587654321","ngan123@gmail.com","Huế",5,5,5);
insert into nhanVien values (null,"Khánh",'1996/07/12',"634567890","5000000","487654321","my123@gmail.com","Quảng Trị",6,6,6);

insert into viTri values (null,"nhân viên");
insert into viTri values (null,"nhân viên");
insert into viTri values (null,"nhân viên");
insert into viTri values (null,"nhân viên");
insert into viTri values (null,"nhân viên");
insert into viTri values (null,"nhân viên");

insert into trinhDo values (null,"tốt");
insert into trinhDo values (null,"tốt");
insert into trinhDo values (null,"tốt");
insert into trinhDo values (null,"tốt");
insert into trinhDo values (null,"tốt");
insert into trinhDo values (null,"tốt");

insert into boPhan values (null,"lễ tân");
insert into boPhan values (null,"lễ tân");
insert into boPhan values (null,"kế toán");
insert into boPhan values (null,"marketing");
insert into boPhan values (null,"marketing");
insert into boPhan values (null,"kế toán");
-- yêu cầu2
select * from nhanVien where (hoTen like 'T%' or 'H%' or 'K%' and length(hoTen) >= 15);

-- yêu cầu3
select * from khachHang 
where ((year(curdate()) - year(ngaySinh)) > 18 and (year(curdate()) - year(ngaySinh)) < 50) and (diaChi = "Đà Nẵng" or "Quảng Trị");

-- yêu câù4

select khachHang.hoTen, count(hopDong.idHopDong) as so_lan_dat_phong from khachHang
inner join hopDong on khachHang.idKhachHang = hopDong.idKhachHang
inner join loaikhachhang on khachHang.idLoaiKhach = loaikhachhang.idLoaiKhach where loaikhachhang.tenLoaiKhach = 'Diamond'
group by khachHang.idKhachHang order by so_lan_dat_phong;

-- yêu cầu5

select khachHang.idKhachHang,khachHang.hoTen,loaiKhachHang.idloaiKhach,hopDong.idHopDong,dichVu.tenDichVu,hopDong.ngayLamHopDong,hopDong.ngayKetThuc,
sum(dichVu.chiPhiThue+hopDongChiTiet.soLuong*dichVuDiKem.gia) as TongTien from khachHang
left join loaiKhachHang on khachHang.idLoaiKhach = loaiKhachHang.idLoaiKhach
left join hopDong on khachHang.idKhachHang = hopDong.idKhachHang
left join dichVu on hopDong.idDichVu = dichVu.idDichVu
left join hopDongChiTiet on hopDong.idHopDong = hopDongChiTiet.idHopDong
left join dichVuDiKem on hopDongChiTiet.idDichVuDiKem = dichVuDiKem.idDichVuDiKem
group by hopDong.idHopDong;

-- yêu cầu 6

select dichVu.idDichVu,dichVu.tenDichVu,dichVu.dienTich,dichVu.chiPhiThue,LoaiDichVu.tenLoaiDichVu from dichVu
inner join loaiDichVu on dichVu.idLoaiDichVu = loaiDichVu.idLoaiDichVu
where not exists(select hopDong.idHopDong from hopDong where (hopDong.ngayLamHopDong between "2019/01/01" and "2019/03/31") and hopDong.idDichVu=dichVu.idDichVu);

-- yêu câu7

select dichVu.idDichVu,dichVu.tenDichVu,dichVu.dienTich,dichVu.soNguoiToiDa,dichVu.chiPhiThue,loaiDichVu.tenLoaiDichVu from dichVu
inner join loaidichvu on dichVu.idLoaiDichVu = loaidichvu.idLoaiDichVu
where not exists(select hopDong.idHopDong from hopDong where year(hopDong.ngayLamHopDong) = '2018' and hopDong.idDichVu=dichVu.idDichVu)
and not exists(select hopDong.idHopDong from hopDong where year(hopDong.ngayLamHopDong) = '2019' and hopDong.idDichVu=dichVu.idDichVu);

-- yêu cầu8 : tên khách hàng k trùng nhau

-- cách 1
select distinct khachHang.hoTen from khachHang;
-- cách 2
select khachHang.hoTen from khachHang group by khachHang.hoTen;
-- cách 3
select khachHang.hoTen from khachHang union select khachHang.hoTen from khachHang;

-- yêu cầu 9

select temp.month , count(month(hopDong.ngayLamHopDong)) as so_khach_hang_dang_ki, sum(hopDong.tongTien) as tongTien from
(select 1 as month
union select 2 as month
union select 3 as month
union select 4 as month
union select 5 as month
union select 6 as month
union select 7 as month
union select 8 as month
union select 9 as month
union select 10 as month
union select 11 as month
union select 12 as month ) as temp
left join hopDong on month (hopDong.ngayLamHopDong)=temp.month
left join khachHang on khachHang.idKhachHang = hopDong.idKhachHang
where year (hopDong.ngayLamHopDong) ='2019' or year (hopDong.ngayLamHopDong) is null or month (hopDong.ngayLamHopDong) is null
group by temp.month
order by temp.month;

-- yêu cầu10

select hopDong.idHopDong,hopDong.ngayLamHopDong,hopDong.ngayKetThuc,hopDong.tienDatCoc,count(hopDongChiTiet.idDichVuDiKem) as so_luong_dich_vu_di_kem
from hopDong inner join hopDongChiTiet on hopDong.idHopDong= hopDongChiTiet.idHopDong group by hopDong.idHopDong;

-- yêu cầu11

select distinct dichVuDiKem.tenDichVuDiKem,dichVuDiKem.gia,dichVuDiKem.donVi from hopDong
inner join hopDongChiTiet on hopDong.idHopDong=hopDongChiTiet.idHopDong
inner join dichVuDiKem on hopDongChiTiet.idDichVuDiKem= dichVuDiKem.idDichVuDiKem
inner join khachHang on khachHang.idKhachHang=hopDong.idKhachHang
inner join loaiKhachHang on khachHang.idLoaiKhach=loaiKhachHang.idLoaiKhach
where loaiKhachHang.tenLoaiKhach='Diamond' and khachHang.diaChi in("Vinh","Quảng Ngãi");

-- yêu cầu12

select hopDong.idHopDong,hopDong.tongTien,hopDong.tienDatCoc,nhanVien.hoTen,khachHang.hoTen,khachHang.sdt,dichVu.tenDichVu,
count(hopDongChiTiet.idDichVuDiKem) as so_lan_su_dung from hopDong
inner join nhanVien on hopDong.idNhanVien=nhanVien.idNhanVien
inner join khachHang on hopDong.idKhachHang=khachHang.idKhachHang
inner join dichVu on dichVu.idDichVu=hopDong.idDichVu
inner join hopDongChiTiet on hopDong.idHopDong=hopDongChiTiet.idHopDong
where not exists(select hopDong.idHopDong where hopDong.ngayLamHopDong between '2019/01/01' and '2019/06/31')
and not exists(select hopDong.idHopDong where hopDong.ngayLamHopDong between '2019/09/01' and '2019/12/31');

-- yêu cầu13

create temporary table temp
select dichVuDiKem.tenDichVuDiKem as ten_dich_vu_di_kem, count(hopDongChiTiet.idDichVuDiKem) as so_lan_su_dung from hopDongChiTiet
inner join dichVuDiKem on dichVuDiKem.idDichVuDiKem=hopDongChiTiet.idDichVuDiKem
group by dichVuDiKem.tenDichVuDiKem;
select * from temp;

create temporary table temp1
select max(temp.so_lan_su_dung) as max_so_lan_su_dung from temp;
select * from temp1;

select temp.ten_dich_vu_di_kem, temp.so_lan_su_dung from temp inner join temp1 on temp.so_lan_su_dung = temp1.max_so_lan_su_dung;
drop temporary table temp;
drop temporary table temp1;

-- yêu cầu14

select hopDong.idHopDong,loaiDichVu.tenLoaiDichVu,dichVuDiKem.tenDichVuDiKem,count(hopDongChiTiet.idDichVuDiKem) as so_lan_su_dung
from hopDong inner join dichVu on hopDong.idDichVu=dichVu.idDichVu
inner join loaiDichVu on loaiDichVu.idLoaiDichVu=dichVu.idLoaiDichVu
inner join hopDongChiTiet on hopDongChiTiet.idHopDong=hopDong.idHopDong
inner join dichVuDiKem on dichVuDiKem.idDichVuDiKem=hopDongChiTiet.idDichVuDiKem
group by (dichVuDiKem.tenDichVuDiKem) having so_lan_su_dung=1;

-- yêu cầu15

select nhanVien.idNhanVien,nhanVien.hoTen,nhanVien.sdt,nhanVien.diaChi,trinhDo.TrinhDo,boPhan.tenBoPhan,count(hopDong.idNhanVien) as so_lan_tao_hop_dong
from nhanVien inner join trinhDo on trinhDo.idTrinhDo=nhanVien.idTrinhDo
inner join boPhan on boPhan.idBoPhan=nhanVien.idBoPhan
inner join hopDong on hopDong.idNhanVien=nhanVien.idNhanVien
where hopDong.ngayLamHopDong between "2018/01/01" and "2019/12/31"
group by nhanVien.hoTen
having so_lan_tao_hop_dong < 4;

-- yêu cầu16

delete from nhanVien where not exists(select nhanVien.idNhanVien from hopDong
where hopDong.ngayLamHopDong between "2017/01/01" and "2019/12/31" and hopDong.idNhanVien=nhanVien.idNhanVien);

-- yêu cầu17

update khachHang,(select hopDong.idKhachHang as id,sum(hopDong.tongTien) as tong_tien from hopDong
where year(hopDong.ngayLamHopDong)=2019
group by hopDong.idKhachHang
having tong_tien>10000000) as temp set khachHang.idLoaiKhach=(select loaiKhachHang.idLoaiKhach from loaiKhachHang where loaiKhachHang.tenLoaiKhach="Dianmond")
where khachHang.idLoaiKhach=(select loaiKhachHang.idLoaiKhach from loaiKhachHang where loaiKhachHang.tenLoaiKhach="Platinium")
and temp.id=khachHang.idKhachHang;

-- yêu câu18

delete khachHang,hopDong,hopDongChiTiet from khachHang inner join hopDong on khachHang.idKhachHang=hopDong.idKhachHang
inner join hopDongChiTiet on hopDong.idHopDong=hopDongChiTiet.idHopDong
where not exists(select hopDong.idHopDong where year(hopDong.ngayLamHopDong)>'2016' and khachHang.idKhachHang=hopDong.idKhachHang);

-- yêu cầu19

update dichVuDiKem inner join (select dichVuDiKem.tenDichVuDiKem as ten_dich_vu_di_kem 
from hopDongChiTiet inner join dichVuDiKem on dichVuDiKem.idDichVuDiKem= hopDongChiTiet.idDichVuDiKem
group by dichVuDiKem.idDichVuDiKem
having count(hopDongChiTiet.idDichVuDiKem)>3) as temp set dichVuDiKem.gia=dichVuDiKem.gia*2 where dichVuDiKem.tenDichVuDiKem=temp.ten_dich_vu_di_kem;

-- yêu cầu20

select nhanVien.idNhanVien as id,nhanVien.hoTen,nhanVien.email,nhanVien.sdt,nhanVien.ngaySinh,nhanVien.diaChi,"nhanVien" as FromTable
from nhanVien
union all
select khachHang.idKhachHang as id,khachHang.hoTen,khachHang.email,khachHang.sdt,khachHang.ngaySinh,khachHang.diaChi,"khachHang" as FromTable
from khachHang;