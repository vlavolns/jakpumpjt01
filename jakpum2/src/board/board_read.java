package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board_read")
public class board_read extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String SeqNo = request.getParameter("SEQ_NO");
		int bno = Integer.parseInt(SeqNo);
		BorderDTO border = BorderDAO.readDB(bno);
		border.setReadcnt(border.getReadcnt()+1);
		BorderDAO.updatecnt(border);
		request.setAttribute("border", border);
		request.setAttribute("bno", bno);
		RequestDispatcher dis = request.getRequestDispatcher("BoardItemView.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
