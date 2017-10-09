package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SourceDao;
import dao.UserDao;
import entity.Source;
import entity.User;
import impl.SourceDaoImpl;
import impl.UserDaoImpl;

@WebServlet("/Admin_User")
public class Admin_User extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Admin_User() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        UserDao dao = new UserDaoImpl();
        List<User> userList = dao.getAllUser();
        System.out.println(userList.size());
        request.getSession().setAttribute("userList", userList);
        request.getRequestDispatcher("admin-index.jsp").forward(request, response);
    }

}
