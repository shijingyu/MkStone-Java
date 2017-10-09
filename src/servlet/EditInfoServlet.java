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

@WebServlet("/EditInfoServlet")
public class EditInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditInfoServlet() {
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
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String name = (String) request.getSession().getAttribute("loginUserName");
        UserDao dao = new UserDaoImpl();
        int res = dao.editInfo(email, phone, name);
        if (res == 1) {
            out.println("<script>alert('编辑成功');location.href='GetUserInfoServlet';</script>");
        } else {
            out.println("<script>alert('编辑失败');location.href='GetUserInfoServlet';</script>");
        }

    }

}
