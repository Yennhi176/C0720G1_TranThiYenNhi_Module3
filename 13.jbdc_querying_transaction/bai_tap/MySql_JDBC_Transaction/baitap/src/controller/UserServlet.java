package controller;

import service.UserService;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet(name = "UserServlet",urlPatterns = {"","/users"})
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;


    public void init() {
        userService = new UserService();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(request, response);
                    break;
                case "edit":
                    updateUser(request, response);
                    break;
                case "find":
                    selectByCountry(request,response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "permision":

                    addUserPermision(request, response);

                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }

    private void addUserPermision(HttpServletRequest request, HttpServletResponse response) {

        User user = new User("Khanh", "kienhoang@gmail.com", "vn");

        int[] permision = {1, 2, 3};

        userService.addUserTransaction(user, permision);

    }


    private void selectByCountry(HttpServletRequest request,HttpServletResponse response){
        String country=request.getParameter("country");
        List<User>listUser= userService.selectUserByCountry(country);
        for(User user:listUser){
            System.out.println(user.getName());
        }
        request.setAttribute("listUser",listUser);
        try {
            request.getRequestDispatcher("users/selectCountry.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
//        List<User> listUser = userDAO.selectAllUsers();
        List<User>listUser= userService.seeAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("users/list.jsp");
        dispatcher.forward(request, response);
    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action);
        RequestDispatcher dispatcher = request.getRequestDispatcher("users/create.jsp");
        dispatcher.forward(request, response);
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        //User existingUser = userDAO.selectUser(id);
        User existingUser = userService.getUserById(id);
        System.out.println(existingUser.toString());
        RequestDispatcher dispatcher = request.getRequestDispatcher("users/edit.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);

    }


    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name, email, country);
//        int []permision={2,3,4};
        userService.insertUser(newUser);
//        userService.addUserTransaction(newUser,permision);

        response.sendRedirect("/users");
    }


    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User book = new User(id, name, email, country);
//        userDAO.updateUser(book);
        userService.updateUserProcedure(book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("users/edit.jsp");
        dispatcher.forward(request, response);
    }


    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
//        userDAO.deleteUser(id);
        userService.delteteProcedure(id);

        List<User> listUser = userService.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("users/list.jsp");
        dispatcher.forward(request, response);
    }

}