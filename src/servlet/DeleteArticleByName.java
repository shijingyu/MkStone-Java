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

@WebServlet("/DeleteArticleByName")
public class DeleteArticleByName extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteArticleByName() {
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
        String name = request.getParameter("aName");
        System.out.println("name的值是"+name);
        System.out.println("进入--删除文章通过名字");
        ArticleDao dao = new ArticleDaoImpl();
        int res = dao.deleteArticleByName(name);
        if (res == 1) {
            out.println("<script>alert('删除成功');location.href='Admin_Article';</script>");
        } else {
            out.println("<script>alert('删除失败');location.href='Admin_Article';</script>");
        }
    }

}
