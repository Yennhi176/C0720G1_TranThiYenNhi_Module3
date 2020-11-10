package model;

public class Student {
    private int id;
    private String name;
    private int age;
    private String classCode;

    public Student() {
    }

    public Student(int id, String name, int age, String classCode) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.classCode = classCode;
    }

    public Student(String name, int age, String classCode) {
        this.name = name;
        this.age = age;
        this.classCode = classCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getClassCode() {
        return classCode;
    }

    public void setClassCode(String classCode) {
        this.classCode = classCode;
    }
}
