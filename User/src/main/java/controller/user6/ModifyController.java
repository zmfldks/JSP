package controller.user6;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.user6dao;
import vo.user6vo;

@WebServlet("/user6/modify.do")
public class ModifyController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		
		user6vo vo = user6dao.getInstance().selectUser6(uid);
		req.setAttribute("vo", vo);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user6/modify.jsp");
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
		
		user6vo vo = new user6vo();
		vo.setUid(uid);
		vo.setName(name);
		vo.setBirth(birth);
		vo.setGender(gender);
		vo.setAge(age);
		vo.setAddr(addr);
		vo.setHp(hp);
		
		user6dao.getInstance().updateUser6(vo);
		
		resp.sendRedirect("/User/user6/list.do");
	}
}
