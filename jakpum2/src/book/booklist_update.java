package book;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/booklist_update")
public class booklist_update extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bookDTO book = new bookDTO();
		book.setBCD(request.getParameter("bcd"));
		book.setFCD(Integer.parseInt(request.getParameter("fcd")));
		book.setTITLE(request.getParameter("title"));
		book.setWRITER(request.getParameter("writer"));
		book.setPUBLISH(request.getParameter("publish"));
		book.setPRICE(Integer.parseInt(request.getParameter("price")));
		book.setBCNT(Integer.parseInt(request.getParameter("bcnt")));
		int result = bookDAO.updateDB(book);
		if(result>0) {
			request.setAttribute("updatedbook", book);
		}
		else {
			request.setAttribute("result", "false");
		}
		RequestDispatcher dis = request.getRequestDispatcher("updatebook.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
