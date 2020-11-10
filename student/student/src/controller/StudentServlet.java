package controller;

import model.Student;
import service.StudentServiceImpl;
import service.StudentSevice;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = {"","/student"})
public class StudentServlet extends HttpServlet {
    private StudentSevice studentSevice = new StudentServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                createStudent(request,response);
                showListStudent(request,response);
                break;
            case "search":
                searchStudent(request,response);
                break;
            case "update":
                updateStudent(request,response);
                break;
            default:
                showListStudent(request,response);
                break;
        }

    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String classCode = request.getParameter("classCode");
        Student student = new Student(id,name,age,classCode);
        studentSevice.update(id,student);
        showListStudent(request,response);
    }

    private void createStudent(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String classCode = request.getParameter("classCode");
        Student student = new Student(name,age,classCode);
        studentSevice.save(student);
    }

    private void showListStudent(HttpServletRequest request, HttpServletResponse response) {
        List<Student> studentList = studentSevice.findAll();
        request.setAttribute("studentListService",studentList);
//        hứng data từ servlet sang jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("student/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =  request.getParameter("action");

        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                showCreateForm(request,response);
                break;
            case "update":
                updateStudentFrom(request,response);
                break;
            case "delete":
                deleteStudent(request,response);
                showListStudent(request,response);
                break;
            default:
                showListStudent(request,response);
                break;
        }
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        studentSevice.delete(id);
    }

    private void updateStudentFrom(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
       Student student = studentSevice.findById(id);
        request.setAttribute("update",student);
        RequestDispatcher dispatcher = request.getRequestDispatcher("student/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchStudent(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("search");
        System.out.println(name);
        List<Student> studentListService = studentSevice.searchByName(name);
        request.setAttribute("studentListService",studentListService);
        RequestDispatcher dispatcher = request.getRequestDispatcher("student/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("student/create.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
