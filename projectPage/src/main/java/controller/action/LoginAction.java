package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BaseDAO;
import dto.LoginVO;

public class LoginAction implements Action {

	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url  = null;
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		BaseDAO dao = BaseDAO.getInst();
		LoginVO login = dao.login(id, pw);
		
		if(login != null) {
			HttpSession session = request.getSession();
			session.setAttribute("login", login);
			url = "Main?command=home";
			request.setAttribute("pop", "1");
		}else if(login == null) {
			url = "Main?command=loginForm";
			request.setAttribute("chk", "1");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
