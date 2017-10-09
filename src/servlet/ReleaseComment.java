package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDao;
import dao.UserDao;
import entity.Comment;
import entity.User;
import impl.CommentDaoImpl;
import impl.UserDaoImpl;

@WebServlet("/ReleaseComment")
public class ReleaseComment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReleaseComment() {
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
        CommentDao dao1 = new CommentDaoImpl();
        int sId = Integer.parseInt(request.getParameter("sId"));
        System.out.println(sId);
        String username = request.getParameter("username");
        System.out.println(username);
        String message = request.getParameter("message");
        System.out.println(message);
        UserDao dao = new UserDaoImpl();
        List<User> userList = dao.getUserInfo(username);
        int userid = userList.get(0).getUserid();
        System.out.println(userid);
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date1 = formatter.format(currentTime);
        ParsePosition pos = new ParsePosition(0);
        Date date = formatter.parse(date1, pos);
        System.out.println(date);
        Comment comment = new Comment(userid, sId, message, date, null, null);
        int res = dao1.releaseComment(comment);
        if (res == 1) {
            System.out.println("res==" + res);
            out.println("<script>alert('发布成功');location.href='SourceDetailServlet?id=" + sId + "';</script>");
        } else {
            System.out.println(res);
            out.println("<script>alert('发布失败');location.href='download.jsp';</script>");
        }

    }

}
