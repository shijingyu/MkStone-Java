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

@WebServlet("/EditArticleByName")
public class EditArticleByName extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditArticleByName() {
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
        System.out.println(name);
        String newname = request.getParameter("aname");
        System.out.println(newname);
        String content = request.getParameter("acontent");
        System.out.println(content);
        String author = request.getParameter("aauthor");
        System.out.println(author);
        String type = request.getParameter("atype");
        System.out.println(type);
        ArticleDao dao = new ArticleDaoImpl();
        int res = dao.editArticleByName(newname, content, author, type, name);
        if (res == 1) {
            out.println("<script>alert('编辑成功');location.href='ArticleServlet';</script>");
        } else {
            out.println("<script>alert('编辑失败');location.href='Admin_Article';</script>");
        }
    }

}
