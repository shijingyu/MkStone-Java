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
import entity.Article;
import impl.ArticleDaoImpl;


@WebServlet("/UserClickType")
public class UserClickType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserClickType() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        String articletype = request.getParameter("articletype");
        System.out.println("articletype:" + articletype);
        ArticleDao dao = new ArticleDaoImpl();
        if (articletype != null) {
            List<Article> articleList = dao.getArticleByType(articletype);
            request.getSession().setAttribute("articleList", articleList);
        } else {
            List<Article> articleList = dao.getAllArticle();
            request.getSession().setAttribute("articleList", articleList);
        }
        request.getRequestDispatcher("article.jsp").forward(request, response);
	}

}
