package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CollectionDao;
import dao.UserDao;
import impl.CollectionDaoImpl;
import impl.UserDaoImpl;

@WebServlet("/UserCancelCollection")
public class UserCancelCollection extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserCancelCollection() {
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
        String username = (String) request.getSession().getAttribute("loginUserName");
        int aId = Integer.parseInt(request.getParameter("aId"));
        System.out.println(aId);
        UserDao user = new UserDaoImpl();
        int userid = user.getUserInfo(username).get(0).getUserid();
        System.out.println(userid);
        CollectionDao dao = new CollectionDaoImpl();
        int res = dao.cancelCollection(aId, userid);
        if (res == 1) {
            out.println("<script>alert('取消收藏成功');location.href='GetUserInfoServlet';</script>");
        } else {
            out.println("<script>alert('取消收藏失败');location.href='GetUserInfoServlet';</script>");
        }
    }

}
