package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.MessageCode;

@WebServlet("/SendMessageServlet")
public class SendMessageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SendMessageServlet() {
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
        String phone = (String) request.getParameter("phone");
        request.getSession().setAttribute("phone", phone);
        MessageCode send = new MessageCode();
        send.sendMessage(phone, request);
    }

}
