package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    Product create(Product product);
    void update(int id,Product product);
    void remove(int id);
    Product findById(int id);
    List<Product> findByName(String name);
}
