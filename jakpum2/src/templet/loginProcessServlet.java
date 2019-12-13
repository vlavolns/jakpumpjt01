package templet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginProcess")
public class loginProcessServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String userid = request.getParameter("id");
		String password = request.getParameter("pass");
		joinDTO user = joinDAO.readDB(userid);
		if(password.equals(user.getPassword())) {
			session.setAttribute("user", user);
			RequestDispatcher dis = request.getRequestDispatcher("mainpage.jsp");
			dis.forward(request, response);
		} else {
			request.setAttribute("result", "false");
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
