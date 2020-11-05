package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "ao1", 500, "tốt", "VN"));
        products.put(2, new Product(2, "ao2", 500, "tốt", "VN"));
        products.put(3, new Product(3, "ao3", 500, "tốt", "VN"));
        products.put(5, new Product(5, "ao5", 500, "tốt", "VN"));
        products.put(4, new Product(4, "ao4", 500, "tốt", "VN"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public Product create(Product product) {
        return products.put(product.getId(), product);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productSearch = new ArrayList<>();
        for (Map.Entry<Integer, Product> entry : products.entrySet()) {
            if (entry.getValue().getName().contains(name)) {
                productSearch.add(entry.getValue());
            }
        }
        return productSearch;
    }

}

