package book;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/booksearch")
public class booksearch extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String type = request.getParameter("type");
		String value = request.getParameter("value");
		if(type.equals("책번호")) {
			type = "bcd";
		}
		else if(type.equals("책이름")) {
			type = "title";
		}
		else {
			type = null;
		}
		bookDTO book = bookDAO.readDB(type, value);
		request.setAttribute("book", book);
		RequestDispatcher dis = request.getRequestDispatcher("searchone.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
