package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import impl.AdminDaoImpl;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminLoginServlet() {
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
        String name = request.getParameter("adminname");
        String pwd = request.getParameter("password");
        request.getSession().setAttribute("admin_name", name);
        AdminDao dao = new AdminDaoImpl();
        boolean res = dao.adminLogin(name, pwd);
        System.out.println(res);
        if (res) {
            out.println("<script>location.href='Admin_User';</script>");
        } else {
            out.println("<script>alert('登录失败');location.href='admin-login.jsp';</script>");
        }

    }

}
