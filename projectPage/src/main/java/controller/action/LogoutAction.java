package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action {

	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "Main?command=loginForm";
		
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
