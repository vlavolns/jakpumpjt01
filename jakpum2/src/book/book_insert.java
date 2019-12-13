package book;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/book_insert")
public class book_insert extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bookDTO book = new bookDTO();
		book.setBCD(request.getParameter("bcd"));
		book.setFCD(Integer.parseInt(request.getParameter("fcd")));
		book.setTITLE(request.getParameter("title"));
		book.setWRITER(request.getParameter("writer"));
		book.setPUBLISH(request.getParameter("publish"));
		book.setPRICE(Integer.parseInt(request.getParameter("price")));
		book.setBCNT(Integer.parseInt(request.getParameter("bcnt")));
		int result = bookDAO.insertDB(book);
		if(result>0) {
			request.setAttribute("in_rs", "true");
		}
		else {
			request.setAttribute("in_fal", "false");
		}
		RequestDispatcher dis = request.getRequestDispatcher("bookinsert.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
