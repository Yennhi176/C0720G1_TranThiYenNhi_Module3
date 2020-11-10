package reponsitory;

import model.Student;

import java.util.List;

public interface StudentReponsitory {
    List<Student> findAll();

    void save (Student student);

    Student findById(int id);

    void update(int id,Student student);

    void delete(int id);

    List<Student> searchByName(String name);
}
