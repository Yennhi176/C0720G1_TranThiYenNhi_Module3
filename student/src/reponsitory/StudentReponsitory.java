package reponsitory;

import model.Student;

import java.util.List;

public interface StudentReponsitory {
    List<Student> findAll();

    void save (Student user);

    Student findById(int id);

    void update(int id,Student user);

    void delete(int id);
}
