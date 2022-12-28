package controller.user5;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.user5dao;
import vo.user5vo;

@WebServlet("/user5/register.do")
public class RegisterController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user5/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String addr = req.getParameter("addr");
		String hp = req.getParameter("hp");
		
		user5vo vo = new user5vo();
		vo.setUid(uid);
		vo.setName(name);
		vo.setBirth(birth);
		vo.setGender(gender);
		vo.setAge(age);
		vo.setAddr(addr);
		vo.setHp(hp);
		
		user5dao.getInstance().insertUser5(vo);
		
		resp.sendRedirect("/User/user5/list.do");
	}
}
