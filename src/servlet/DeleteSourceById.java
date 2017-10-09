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
import net.sf.json.JSONArray;

@WebServlet("/DeleteSourceById")
public class DeleteSourceById extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteSourceById() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        System.out.println("当前/xianianjun/src/servlet/DeleteSourceById.java");
        String[] id = request.getParameterValues("id[]");
        for (int k = 0; k < id.length; k++) {
            System.out.println(id[k]);
            SourceDao dao = new SourceDaoImpl();
            int res = dao.deleteSourceById(Integer.parseInt(id[k]));
        }
        System.out.println("============");
        out.println("<script>location.href='Admin_Source';</script>");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
