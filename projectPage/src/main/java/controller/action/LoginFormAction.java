package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFormAction implements Action {

	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="login.jsp";
		String ms = request.getParameter("ms");
		
		if(ms != null) {
			request.setAttribute("ms", ms);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
