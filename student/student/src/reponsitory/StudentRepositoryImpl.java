package reponsitory;

import model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentRepositoryImpl implements StudentReponsitory {
    private static final String SELECT_ALL_STUDENT = "select * from student";
    private static final String INSERT_NEW_STUDENT = "insert into student(name,age,classCode) value(?,?,?);";
    private static final String DELETE_STUDENT = "delete from student where id = ? ";
    private static final String SELECT_STUDENT_FINDBYID = "select * from student where id =?";
    private static final String UPDATE_STUDENT = "update student set name = ?, age = ?, classCode = ? where id = ?";
    private static final String SEARCH_STUDENT = "select * from student where name like ?";

    @Override
    public List<Student> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Student> listStudent = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_STUDENT);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Student student = new Student(resultSet.getInt("id"),
                            resultSet.getString("name"), resultSet.getInt("age"), resultSet.getString("classCode"));
                    listStudent.add(student);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    statement.close();
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            DBConnection.close();
        }
        return listStudent;
    }

    @Override
    public void save(Student student) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(INSERT_NEW_STUDENT);
                statement.setString(1,student.getName());
                statement.setInt(2,student.getAge());
                statement.setString(3,student.getClassCode());
                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            DBConnection.close();
        }

    }

    @Override
    public Student findById(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Student student = new Student();
        if (connection != null){
            try {
                statement = connection.prepareStatement(SELECT_STUDENT_FINDBYID);
                statement.setInt(1,id);
               resultSet = statement.executeQuery();
               while (resultSet.next()){
                    student = new Student(resultSet.getInt("id"),resultSet.getString("name"),
                           resultSet.getInt("age"),resultSet.getString("classCode"));
               }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    statement.close();
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            DBConnection.close();
        }
        return student;
    }

    @Override
    public void update(int id, Student student) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(UPDATE_STUDENT);
                statement.setString(1,student.getName());
                statement.setInt(2,student.getAge());
                statement.setString(3,student.getClassCode());
                statement.setInt(4,id);
                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            DBConnection.close();
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(DELETE_STUDENT);
                statement.setInt(1,id);
                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            DBConnection.close();
        }
    }

    @Override
    public List<Student> searchByName(String name) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Student> listStudent = new ArrayList<>();
        if (connection != null){
            try {
                statement = connection.prepareStatement(SEARCH_STUDENT);
                statement.setString(1, "%" + name + "%");
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                   Student student = new Student(resultSet.getInt("id"),resultSet.getString("name"),
                            resultSet.getInt("age"),resultSet.getString("classCode"));
                   listStudent.add(student);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    statement.close();
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            DBConnection.close();
        }
        return listStudent;
    }
}
