package kr.co.mvc.dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import kr.co.mvc.db.DBHelper;
import kr.co.mvc.vo.MVCBoardVO;

public class MVCBoardDAO extends DBHelper{
	public MVCBoardDAO() {
		super();
	}
	
	public int selectCount(Map<String, Object>map) {
		int totalCount = 0;
		
		String query = "select count(*) from mvcboard";
		
		if(map.get("searchWord") != null) {
			query += "where" + map.get("searchField") + " "
					+ "like '%" + map.get("searchWord") + "%'";
		}
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public void selectListPage(Map<String, Object> map) {
		List<MVCBoardVO> board = new Vector<MVCBoardVO>();
		
		String query = "SELECT a.*, b.nick FROM `mvcboard` AS a "
				+ "JOIN `board_user` AS b "
				+ "ON a.uid = b.uid "
				+ "WHERE `parent` = 0 "
				+ "ORDER BY `no` DESC "
				+ "LIMIT ?, 10";
	}
}
