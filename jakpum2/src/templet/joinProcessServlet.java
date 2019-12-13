package templet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import templet.joinDAO;
import templet.joinDTO;

@WebServlet("/joinProcess")
public class joinProcessServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		joinDTO user = new joinDTO();
		user.setId(request.getParameter("id"));
		user.setName(request.getParameter("name"));
		user.setPassword(request.getParameter("pass"));
		String tel = request.getParameter("first");
		String mid = request.getParameter("mid");
		String last = request.getParameter("last");
		user.setTel(tel+"-"+mid+"-"+last);
		user.setJob(request.getParameter("job"));
		String gender = request.getParameter("gender");
		if(gender.equals("³²")) {
			user.setGender(1);
		}
		else {
			user.setGender(2);
		}
		String[] hobbylist = request.getParameterValues("hobby");
		String hobby="";
		for(int i=0;i<hobbylist.length;i++) {
			hobby+=hobbylist[i]+" ";
		}
		user.setHobby(hobby);
		user.setIntro(request.getParameter("intro"));
		joinDAO.insertDB(user);
		request.setAttribute("user", user);
		RequestDispatcher dis = request.getRequestDispatcher("mainpage.jsp");
		dis.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
