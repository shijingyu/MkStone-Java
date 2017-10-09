package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDao;
import dao.SourceDao;
import entity.Comment;
import entity.Source;
import impl.CommentDaoImpl;
import impl.SourceDaoImpl;

@WebServlet("/SourceDetailServlet")
public class SourceDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SourceDetailServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        SourceDao dao = new SourceDaoImpl();
        CommentDao dao1 = new CommentDaoImpl();
        int sId = Integer.parseInt(request.getParameter("id"));
        System.out.println("sId:" + sId);
        request.getSession().setAttribute("sId", sId);
        List<Source> source = dao.getAllSourceById(sId);
        List<Comment> comment = dao1.getComent(sId);
        request.getSession().setAttribute("comment", comment);
        request.getSession().setAttribute("sourcedetail", source);
        request.getRequestDispatcher("single.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
