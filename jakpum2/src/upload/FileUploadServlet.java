package upload;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String URL = "D:/DataFile/";
		String URL = "D:\\dbwork\\jakpum\\WebContent\\IMAGE";
		System.out.println(URL);
		String encType = "utf-8";
		int MaxSize = 50 * 1024 * 1024; //�ִ� ���ε� ũ��
		String result = "";
		
		try {
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			MultipartRequest multi = new MultipartRequest(request, URL, MaxSize, encType, policy);
			
			//���⼭���ʹ� �׳� ��� ���
			String name = (String) multi.getFileNames().nextElement(); // form �� type = "file" �� name �Ӽ�
			String filename = (String) multi.getFilesystemName(name); // ������ ���ϸ�
			System.out.println("name : " + name);
			System.out.println("filename : " + filename);
			
			if (filename != null) {
				result = "SUCCESS";
			} else {
				result = "FAIL";
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
		response.sendRedirect("uploadResult.jsp?result=" + result); 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
