package board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board_save")
public class board_save extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BorderDTO border = new BorderDTO();
		int lastbno = BorderDAO.maxCnt()+1;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		border.setBno(lastbno);
		border.setTitle(request.getParameter("title"));
		String content = request.getParameter("content");
		//content = content.replaceAll("`", "'");
		border.setContent(content);
		border.setWriter(request.getParameter("writer"));
		BorderDAO.insertDB(border);
		response.sendRedirect("board_list");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
