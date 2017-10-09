package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SourceDao;
import impl.SourceDaoImpl;

@WebServlet("/DeleteSourceByName")
public class DeleteSourceByName extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteSourceByName() {
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
        System.out.println("当前/xianianjun/src/servlet/DeleteSourceByName.java");
        String name = request.getParameter("sName");
        SourceDao dao = new SourceDaoImpl();
        int res = dao.deleteSourceByName(name);
        if (res == 1) {
            out.println("<script>alert('删除成功');location.href='SourceServlet';</script>");
        } else {
            out.println("<script>alert('删除失败');location.href='SourceServlet';</script>");
        }
    }

}
