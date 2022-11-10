package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommonService {
	
}
// service는 정형화된 구조가 아니기 때문에 구조를 갖춰준다 그래서 인터페이스로 구현 서비스 클래스 마다 코먼서비스를 implement해줌 그리고 참조 받으니까 각 클래스마다 이름 뒤에 impl를 붙여줌 그리고 모든 컨트롤러가 서비스를 참조 받기 때문에 HelloService service = HelloService.getInstance()를 HelloService service = 커먼 서비스로 바꿔준다 
