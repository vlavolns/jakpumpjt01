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
		String filename = request.getParameter("file"); //입력용 파일명
		File image = new File("D:/dbwork/jakpum/WebContent/IMAGE/" + filename);
		FileInputStream fis = new FileInputStream(image); //내부 저장공간
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		byte[] buf = new byte[1024];
		int readlength = 0;
		while ((readlength = fis.read(buf)) != -1) {
			bos.write(buf, 0, readlength);
		}
		byte[] imgbuf = null;
		imgbuf = bos.toByteArray(); //내부 저장공간에 쌓인 데이터를 바이트 배열로 변환
		bos.close();
		fis.close();
		
		int length = imgbuf.length;
		OutputStream out = response.getOutputStream();
		out.write(imgbuf, 0, length); //바이트 배열을 화면에 출력
		out.close();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
