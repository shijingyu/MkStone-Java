package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SourceDao;
import entity.Source;
import impl.SourceDaoImpl;

@WebServlet("/EditSourceByName")
public class EditSourceByName extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditSourceByName() {
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
        String name = request.getParameter("sName");
        String newname = request.getParameter("sname");
        String description = request.getParameter("sdescription");
        String size = request.getParameter("ssize");
        String type = request.getParameter("stype");
        String support = request.getParameter("ssupport");
        SourceDao dao = new SourceDaoImpl();
        int res = dao.editSourceByName(newname, description, size, support, type, name);
        if (res == 1) {
            out.println("<script>alert('编辑成功');location.href='SourceServlet';</script>");
        } else {
            out.println("<script>alert('编辑失败');location.href='SourceServlet';</script>");
        }

    }

}
