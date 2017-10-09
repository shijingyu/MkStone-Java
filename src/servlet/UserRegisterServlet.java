package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UserDao;
import entity.User;
import impl.UserDaoImpl;
import utils.MD5Utils;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserRegisterServlet() {
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
        String name = request.getParameter("username");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String pwd = request.getParameter("password");
        String uimage = "default.jpg";
        User user = new User(name, MD5Utils.toMD5(pwd), email, phone, uimage);
        System.out.println(user);
        int res = dao.addUser(user);
        if (res == 1) {
            System.out.println(res);
            out.println("<script>alert('注册成功');location.href='login.jsp';</script>");
        } else {
            System.out.println(res);
            out.println("<script>alert('注册失败');location.href='register.jsp';</script>");
        }
    }

}
