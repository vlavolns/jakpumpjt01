package book;

import java.io.IOException;
import templet.joinDTO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import templet.joinDAO;

@WebServlet("/rentinsert")
public class rentinsert extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		joinDTO user = joinDAO.readDB(id);
		String name = (String)user.getName();
		String title = request.getParameter("title");
		bookDAO.rentinsert(id, name, title);
		request.setAttribute("name", name);
		request.setAttribute("title", title);
		RequestDispatcher dis = request.getRequestDispatcher("book_rent.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
