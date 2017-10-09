package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;

import dao.UserDao;
import impl.UserDaoImpl;

@WebServlet("/ChangeUimageServlet")
public class ChangeUimageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ChangeUimageServlet() {
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
        String filepath = getServletContext().getRealPath("/") + "images/userinfo/";
        File file = new File(filepath);
        if (!file.exists()) {
            file.mkdir();
        }
        System.out.println(file.getAbsoluteFile());
        SmartUpload su = new SmartUpload();
        su.initialize(getServletConfig(), request, response);
        su.setMaxFileSize(1024 * 1024 * 10);
        su.setTotalMaxFileSize(1024 * 1024 * 100);
        su.setAllowedFilesList("jpeg,jpg,gif,png");
        String result = "";
        try {
            su.setDeniedFilesList("jsp,js");
            su.upload();
            int count = su.save(filepath);
            System.out.println("�ϴ��ɹ���" + count + "���ļ�");
        } catch (Exception e) {
            result = "�ϴ�ʧ��";
            if (e.getMessage().indexOf("1015") != -1) {
                result = "�ϴ�ʧ�ܣ��ϴ��ļ����Ͳ���ȷ��";
            } else if (e.getMessage().indexOf("1110") != -1) {
                result = "�ϴ�ʧ�ܣ��ϴ��ļ����Ͳ���ȷ��";
            } else if (e.getMessage().indexOf("1105") != -1) {
                result = "�ϴ�ʧ�ܣ��ϴ��ļ��Ĵ�С���������ϴ��ļ������ֵ��";
            }
            e.printStackTrace();
        }

        com.jspsmart.upload.File tempFile = su.getFiles().getFile(0);
        String filename = tempFile.getFilePathName().toString();
        System.out.println(filename);
        String changeUimage = filename;
        UserDao dao = new UserDaoImpl();
        String name = request.getSession().getAttribute("loginUserName").toString();
        int res = dao.changeUimage(changeUimage, name);
        System.out.println(res);
        if (res == 1) {
            out.println("<script>location.href='GetUserInfoServlet';</script>");
        } else {
            out.println("<script>alert('修改头像失败');location.href='GetUserInfoServlet';</script>");
        }
    }

}
