package book;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/book_title_check")
public class book_title_check extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String readtitle = bookDAO.titlecheck(title);
		int price = bookDAO.pricecheck(title);
		if(readtitle!=null) {
			request.setAttribute("title", readtitle);
			request.setAttribute("price", price);
		}
		else{
			request.setAttribute("result", "false");
		}
		RequestDispatcher dis = request.getRequestDispatcher("book_title_check.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
