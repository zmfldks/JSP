package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.HelloService;

@WebServlet("/hello.do")
public class HelloController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req,resp);
	}
	
	public void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HelloService service = HelloService.getInstance();
		String view = service.requestProc(req, resp);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);// hello.jsp를 포워드
		dispatcher.forward(req, resp);
		
	}// 컨트롤러가 포워드 해줘야함 받
	
}
// 
