package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import impl.UserDaoImpl;
import utils.MD5Utils;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserLoginServlet() {
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
        String name = request.getParameter("username");
        String pwd = request.getParameter("password");
        String rand = (String) request.getSession().getAttribute("code");
        String inputCode = request.getParameter("code");
        UserDao dao = new UserDaoImpl();
        request.getSession().setAttribute("loginUserName", name);
        if (rand.equalsIgnoreCase(inputCode)) {
            if (dao.loginUser(name, MD5Utils.toMD5(pwd))) {
                out.println("<script>location.href='ArticleServlet';</script>");
            } else {
                out.println("<script>alert('用户名或密码错误');location.href='login.jsp';</script>");
            }
        } else {
            out.println("<script>alert('验证码错误');location.href='login.jsp';</script>");
        }
    }

}
