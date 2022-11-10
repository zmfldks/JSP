package service;

public class WelcomeService {

	private static WelcomeService instance = new WelcomeService();

	public static WelcomeService getInstance() {
		return instance;
	}
	
	private WelcomeService() {}
	
	
	
	

}
