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
import utils.MessageCode;

@WebServlet("/ChangePwdServlet")
public class ChangePwdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ChangePwdServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        UserDao dao = new UserDaoImpl();
        String phone = request.getParameter("phone");
        String newpassword = request.getParameter("newPassword");
        String inputmessagecode = request.getParameter("messageCode");
        String messageCode = (String) request.getSession().getAttribute("messageCode");
        if (messageCode.equals(inputmessagecode)) {
            int res = dao.changePwd(MD5Utils.toMD5(newpassword), phone);
            if (res == 1) {
                out.println("<script>alert('修改密码成功');location.href='userinfo.jsp';</script>");
            } else {
                out.println("<script>alert('修改密码失败');location.href='userinfo.jsp';</script>");
            }
        } else {
            out.println("<script>alert('短信验证码错误');location.href='userinfo.jsp';</script>");
        }

    }

}
