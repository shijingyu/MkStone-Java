package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDao;
import dao.CollectionDao;
import dao.UserDao;
import entity.Collection;
import impl.ArticleDaoImpl;
import impl.CollectionDaoImpl;
import impl.UserDaoImpl;

@WebServlet("/CancelCollection")
public class CancelCollection extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CancelCollection() {
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
        String username = (String) request.getSession().getAttribute("loginUserName");
        int aId = Integer.parseInt(request.getParameter("aId"));
        System.out.println(aId);
        UserDao user = new UserDaoImpl();
        int userid = user.getUserInfo(username).get(0).getUserid();
        System.out.println(userid);
        // ArticleDao article=new ArticleDaoImpl();
        // String aName=article.getArticleInfo(aId).get(0).getaName();
        /*
         * Date currentTime = new Date(); SimpleDateFormat formatter = new
         * SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); String date1 =
         * formatter.format(currentTime); ParsePosition pos = new
         * ParsePosition(0); Date DATE = formatter.parse(date1, pos);
         * System.out.println(DATE);
         */
        CollectionDao dao = new CollectionDaoImpl();
        int res = dao.cancelCollection(aId, userid);
        String message = null;
        if (res == 1) {
            out.print(message);
        } else {
            out.println(message);
        }

    }

}
