package service;

import model.Student;
import reponsitory.StudentReponsitory;
import reponsitory.StudentRepositoryImpl;

import java.util.List;

public class StudentServiceImpl implements StudentSevice {
    private StudentReponsitory studentReponsitory = new StudentRepositoryImpl();
    @Override
    public List<Student> findAll() {
        return studentReponsitory.findAll();
    }

    @Override
    public void save(Student student) {
        studentReponsitory.save(student);
    }

    @Override
    public Student findById(int id) {
        return studentReponsitory.findById(id);
    }

    @Override
    public void update(int id, Student student) {
        studentReponsitory.update(id,student);
    }

    @Override
    public void delete(int id) {
        studentReponsitory.delete(id);
    }

    @Override
    public List<Student> searchByName(String name) {
        return studentReponsitory.searchByName(name);
    }
}
