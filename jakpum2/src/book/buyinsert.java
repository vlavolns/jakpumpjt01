package book;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/buyinsert")
public class buyinsert extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type= "title";
		String value = request.getParameter("title");
		int sqno = bookDAO.maxsqno()+1;
		bookDTO bookinfo= bookDAO.readDB(type, value);
		bookDTO book = new bookDTO();
		book.setTradeno(bookinfo.getBCD()+request.getParameter("id")+"."+sqno);
		book.setSqno(sqno);
		book.setBCD(bookinfo.getBCD());
		book.setId(request.getParameter("id"));
		book.setPRICE(Integer.parseInt(request.getParameter("price")));
		book.setBCNT(Integer.parseInt(request.getParameter("bcnt")));
		book.setSumprice(Integer.parseInt(request.getParameter("sumprice")));
		
		
		if(request.getParameter("tg").equals("현금")) {
			book.setTg("1");
		}
		else if(request.getParameter("tg").equals("카드")) {
			book.setTg("2");
		}
		int result = bookDAO.insertbuy(book);
		if(result>0) {
			request.setAttribute("true", "true");
		}else {
			request.setAttribute("false", "false");
		}
		RequestDispatcher dis = request.getRequestDispatcher("buy.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
