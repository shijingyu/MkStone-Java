package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDao;
import dao.UserDao;
import entity.Article;
import impl.ArticleDaoImpl;
import impl.UserDaoImpl;

@WebServlet("/ArticleServlet")
public class ArticleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ArticleServlet() {
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
        ArticleDao dao = new ArticleDaoImpl();
        String loginUserName = null;
        loginUserName = (String) request.getSession().getAttribute("loginUserName");
        if (loginUserName != null) {
            UserDao user = new UserDaoImpl();
            int uid = user.getUserInfo(loginUserName).get(0).getUserid();
            List<Article> articleList = dao.getCollection(uid);
            request.getSession().setAttribute("articleList", articleList);
        } else {
            List<Article> articleList = dao.getAllArticle();
            request.getSession().setAttribute("articleList", articleList);
        }
        request.getRequestDispatcher("article.jsp").forward(request, response);
    }

}
