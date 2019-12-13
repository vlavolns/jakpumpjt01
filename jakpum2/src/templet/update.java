package templet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class update extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		joinDTO user = new joinDTO(); 
		user.setId(request.getParameter("id"));
		user.setName(request.getParameter("name"));
		user.setPassword(request.getParameter("password"));
		user.setTel(request.getParameter("tel"));
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
		joinDAO.updateDB(user);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
