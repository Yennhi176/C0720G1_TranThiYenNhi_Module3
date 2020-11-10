package repository;

import model.User;

import java.util.List;

public interface UserRepository {
    List<User> findAll();

    void save (User user);

    User findById(int id);

    void update(int id,User user);

    void delete(int id);
}
