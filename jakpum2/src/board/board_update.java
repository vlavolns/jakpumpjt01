package board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board_update")
public class board_update extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BorderDTO border = new BorderDTO();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		border.setBno(bno);
		border.setTitle(request.getParameter("title"));
		String content = request.getParameter("content");
		//content = content.replaceAll("'", "`");
		
		border.setContent(content);
		BorderDAO.updateDB(border);
		response.sendRedirect("board_list");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
