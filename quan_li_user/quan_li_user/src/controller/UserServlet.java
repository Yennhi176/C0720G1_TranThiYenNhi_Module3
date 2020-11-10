package controller;

import model.User;
import service.UserServiceImpl;
import service.UserSevice;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.MidiFileFormat;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet",urlPatterns = {"","/users"})
public class UserServlet extends HttpServlet {
    private UserSevice userSevice = new UserServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");

        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                createUser(request,response);
                showListUser(request,response);
                break;
            case "update" :
                updateUser(request,response);
                showListUser(request,response);
                break;
            default:
                showListUser(request,response);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name =request.getParameter("userName");
        String email = request.getParameter("userEmail");
        String country = request.getParameter("userCountry");

        User user = new User(id,name,email,country);
        userSevice.update(id,user);
    }


    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String name =request.getParameter("userName");
        String email = request.getParameter("userEmail");
        String country = request.getParameter("userCountry");

        User user = new User(name,email,country);
        userSevice.save(user);

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
            case "detail":
                detailUserFrom(request,response);
                break;
            case "update":
                updateUserFrom(request,response);
                break;
            case "delete":
                deleteUser(request,response);
                showListUser(request,response);
                break;
            default:
                showListUser(request,response);
                break;
        }
    }

    private void updateUserFrom(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userSevice.findById(id);
        request.setAttribute("detailUser",user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void detailUserFrom(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
         User user = userSevice.findById(id);
        request.setAttribute("detailUser",user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/view.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        userSevice.delete(id);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
//        try {
//            dispatcher.forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    private void showListUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userSevice.findAll();
        request.setAttribute("userListService",userList);
       RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
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
            response.sendRedirect("user/create.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
