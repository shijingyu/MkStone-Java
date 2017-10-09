package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SourceDao;
import entity.Source;
import impl.SourceDaoImpl;

@WebServlet("/SourceServlet")
public class SourceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SourceServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        SourceDao dao = new SourceDaoImpl();
        List<Source> sourceList = dao.getAllSource();
        int size = sourceList.size();
        request.getSession().setAttribute("size", size);
        request.getSession().setAttribute("sourceList", sourceList);
        request.getRequestDispatcher("download.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
