package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.ArticleDao;
import dao.SourceDao;
import entity.Article;
import entity.Source;
import impl.ArticleDaoImpl;
import impl.SourceDaoImpl;
import utils.QiniuUtil;

@WebServlet("/ReleaseArticleServlet")
public class ReleaseArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReleaseArticleServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String savePath = this.getServletContext().getRealPath("/article");
		String tempPath = this.getServletContext().getRealPath("/temp");
		File tmpFile = new File(tempPath);
		if (!tmpFile.exists()) {
			tmpFile.mkdir();
		}
		List list1 = new ArrayList();
		List list2 = new ArrayList();
		try {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(1024 * 100);// 设置缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
			factory.setRepository(tmpFile);
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setProgressListener(new ProgressListener() {
				public void update(long pBytesRead, long pContentLength, int arg2) {
					System.out.println("文件大小为：" + pContentLength + ",当前已处理：" + pBytesRead);
				}
			});
			upload.setHeaderEncoding("UTF-8");
			if (!ServletFileUpload.isMultipartContent(request)) {
				return;
			}
			upload.setFileSizeMax(1024 * 1024 * 10);
			upload.setSizeMax(1024 * 1024 * 100);
			List<FileItem> list = upload.parseRequest(request);
			for (FileItem item : list) {
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString("UTF-8");
					// value = new String(value.getBytes("iso8859-1"),"UTF-8");
					list1.add(value);
				} else {
					String filename = item.getName();
					if (filename == null || filename.trim().equals("")) {
						continue;
					}
					filename = filename.substring(filename.lastIndexOf("\\") + 1);
					list2.add(filename);
					System.out.println(filename);
					String fileExtName = filename.substring(filename.lastIndexOf(".") + 1);
					System.out.println("上传的文件的扩展名是：" + fileExtName);
					InputStream in = item.getInputStream();
					FileOutputStream out1 = new FileOutputStream(savePath + "\\" + filename);
					byte buffer[] = new byte[1024];
					int len = 0;
					while ((len = in.read(buffer)) > 0) {
						out1.write(buffer, 0, len);
					}
					in.close();
					item.delete();
					//out.close();
				}
			}
			ArticleDao dao = new ArticleDaoImpl();
			String aName = (String) list1.get(0);
			System.out.println(aName);
			String aAuthor = (String) list1.get(1);
			System.out.println(aAuthor);
			String aType = (String) list1.get(2);
			System.out.println(aType);
			String aContent = (String) list1.get(3);
			String aPicture = (String) list2.get(0);
			System.out.println(aContent);
			Date currentTime = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String aDate = formatter.format(currentTime);
			Article article = new Article(aName, aContent, aPicture, aAuthor, aDate, aType);
			System.out.println(article);
			int res = dao.releaseArticle(article);
			if (res == 1) {
				System.out.println(res);
				String filePath=this.getServletContext().getRealPath("/article/"+aPicture);;
		        String fileName=aPicture;
		        QiniuUtil qiniuUtil = new QiniuUtil();
		        try {
		            // 上传到七牛云
		            qiniuUtil.upload(filePath, fileName);
		        } catch (IOException e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		        }
				out.println("<script>location.href='ArticleServlet';</script>");
				out.close();
			} else {
				System.out.println(res);
				out.println("<script>alert('发布失败');location.href='admin-form.jsp';</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
