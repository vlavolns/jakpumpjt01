package upload;

import java.io.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImageViewServlet
 */
@WebServlet("/view")
public class ImageViewServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String filename = request.getParameter("file"); //�Է¿� ���ϸ�
		File image = new File("D:/dbwork/jakpum/WebContent/IMAGE/" + filename);
		FileInputStream fis = new FileInputStream(image); //���� �������
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		byte[] buf = new byte[1024];
		int readlength = 0;
		while ((readlength = fis.read(buf)) != -1) {
			bos.write(buf, 0, readlength);
		}
		byte[] imgbuf = null;
		imgbuf = bos.toByteArray(); //���� ��������� ���� �����͸� ����Ʈ �迭�� ��ȯ
		bos.close();
		fis.close();
		
		int length = imgbuf.length;
		OutputStream out = response.getOutputStream();
		out.write(imgbuf, 0, length); //����Ʈ �迭�� ȭ�鿡 ���
		out.close();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
