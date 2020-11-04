package dao;

import model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerDao {
    static List<Customer> listCustomer = new ArrayList<>();

    static {
        listCustomer.add(new Customer("Trần Yến Nhi","17-06-1998","Quảng Ngãi","nhi.jpg"));
        listCustomer.add(new Customer("Võ Doãn Lân","17-06-1998","Quảng Ngãi","lan.jpg"));
        listCustomer.add(new Customer("Bùi Huỳnh Như","17-06-1998","Quảng Ngãi","nhu.jpg"));
        listCustomer.add(new Customer("Nguyễn Phúc Duy","17-06-1998","Quảng Ngãi","duy.jpg"));
        listCustomer.add(new Customer("Nguyễn Hoàng Tứ","17-06-1998","Quảng Ngãi"," tu.jpg"));

    }
    public static List<Customer> showCustomer(){
        return listCustomer;
    }
}
