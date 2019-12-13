package templet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JoinItemServlet")
public class JoinItemServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String userid = request.getParameter("cid");
		joinDTO user = joinDAO.readDB(userid);
		boolean result = joinDAO.idcheck(userid);
		request.setAttribute("cid", userid);
		request.setAttribute("result", result);
		request.setAttribute("user", user);
		RequestDispatcher dis = request.getRequestDispatcher("id.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
