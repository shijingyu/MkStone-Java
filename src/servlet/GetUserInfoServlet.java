package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CollectionDao;
import dao.UserDao;
import entity.Collection;
import entity.User;
import impl.CollectionDaoImpl;
import impl.UserDaoImpl;

@WebServlet("/GetUserInfoServlet")
public class GetUserInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GetUserInfoServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        UserDao dao = new UserDaoImpl();
        String username = (String) request.getSession().getAttribute("loginUserName");
        List<User> list = dao.getUserInfo(username);
        request.getSession().setAttribute("userinfo", list);
        CollectionDao dao1 = new CollectionDaoImpl();
        List<Collection> collectionList = dao1.listCollection(username);
        request.getSession().setAttribute("collectionList", collectionList);
        request.getRequestDispatcher("userinfo.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
