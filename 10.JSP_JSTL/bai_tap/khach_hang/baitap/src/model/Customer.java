package model;

public class Customer {
    private String name;
    private String birthday;
    private String address;
    private String img;

    public Customer(String ten, String ngaySinh, String diaChi, String anh) {
        this.name = ten;
        this.birthday = ngaySinh;
        this.address = diaChi;
        this.img = anh;
    }

    public Customer() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
