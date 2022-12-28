package controller.user4;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.user4dao;
import vo.user4vo;

@WebServlet("/user4/modify.do")
public class ModifyController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String seq = req.getParameter("seq");
		
		user4vo vo = user4dao.getInstance().selectUser4(seq);
		req.setAttribute("vo", vo);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user4/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String seq = req.getParameter("seq");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String addr = req.getParameter("addr");
		
		user4vo vo = new user4vo();
		vo.setSeq(seq);
		vo.setName(name);
		vo.setGender(gender);
		vo.setAge(age);
		vo.setAddr(addr);
		
		user4dao.getInstance().updateUser4(vo);
		
		resp.sendRedirect("/User/user4/list.do");
		
	}
}
