<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// multipart 폼 데이터 수신
	String savePath = application.getRealPath("/file"); //파일 저장 경로
	int maxSize = 1024 * 1024 * 10; // 파일 최대 허용량(10메가) 
	MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	

	String title 	= mr.getParameter("title"); 
	String content 	= mr.getParameter("content");
	String uid		= mr.getParameter("uid");
	String fname	= mr.getFilesystemName("fname");
	String regip	= request.getRemoteAddr();
	
	ArticleBean article = new ArticleBean();
	article.setTitle(title);
	article.setContent(content);
	article.setUid(uid);
	article.setFname(fname);
	article.setRegip(regip);
	
	
	
	ArticleDAO dao = ArticleDAO.getInstance();
	//  글 등록
	int parent = dao.insertArticle(article);
	// 파일을 첨부했으면
	if(fname != null){// 파일을 첨부 안하면 null로 표시되기 때문에 null이 아니면 파일을 첨부한게 됨
		
		// 파일명 수정
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i); //파일 확장자

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext; // 202210260417_dkakeh1234.txt
		
		File f1 = new File(savePath+"/"+fname);
		File f2 = new File(savePath+"/"+newName);
		
		f1.renameTo(f2);
		
		// 파일 테이블 Insert 
		dao.insertFile(parent, newName, fname);
	}
	
	
	response.sendRedirect("/Jboard1/list.jsp");
	
	// System.out.println("fname : "+ fname);
%>