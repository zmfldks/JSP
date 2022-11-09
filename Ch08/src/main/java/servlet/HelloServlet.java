package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;// 클래스의 식별번호
	
	@Override
	public void init() throws ServletException {
		// 해당 서블릿이 최초 실행될때 한번 호출
		System.out.println("HelloServlet init...");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트의 요청방식이 GET일 경우 호출되는 메서드
		System.out.println("HelloServlet doGet...");
		
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("<title>HelloServlet</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>HelloServlet</h3>");
		writer.println("<p>");
		writer.println("<a href='./1_서블릿.jsp'>서블릿 메인</a><br/>");
		writer.println("<a href='./hello.do'>HelloServlet</a><br/>");
		writer.println("<a href='./welcome.do'>WelcomeServlet</a><br/>");
		writer.println("<a href='./greeting.do'>GreetingServlet</a><br/>");
		writer.println("</p>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트의 요청방식이 POST일 경우 호출되는 메서드
		System.out.println("HelloServlet doPost...");
	}
	
	@Override
	public void destroy() {
		// 서블릿이 종료될 때 호출되는 메서드(was가 종료될때)
		System.out.println("HelloServlet destroy...");
	}
	
}
