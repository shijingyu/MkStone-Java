package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDao;
import impl.ArticleDaoImpl;

@WebServlet("/DeleteArticleById")
public class DeleteArticleById extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteArticleById() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        String[] id = request.getParameterValues("id[]");
        for (int k = 0; k < id.length; k++) {
            System.out.println(id[k]);
            ArticleDao dao = new ArticleDaoImpl();
            int res = dao.deleteArticleById(Integer.parseInt(id[k]));
        }
        System.out.println("============");
        out.println("<script>location.href='Admin_Article';</script>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
