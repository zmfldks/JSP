package kr.co.jboard1.db;

public class Sql {
	
	// user
	public static final String INSERT_USER = "INSERT INTO `board_user` set "
											+ "`uid` =?,"
											+ "`pass` =SHA2(?,256),"
											+ "`name` =?,"
											+ "`nick` =?,"
											+ "`email` =?,"
											+ "`hp` =?,"
											+ "`zip` =?,"
											+ "`addr1` =?,"
											+ "`addr2` =?,"
											+ "`regip` =?,"
											+ "`rdate` =NOW()";
	
	public static final String SELECT_TERMS= "select * from `board_terms`";
	public static final String SELECT_USER= "select * from `board_user` where `uid`=? and `pass`=SHA2(?, 256)";
	public static final String SELECT_COUNT_UID= "select count(`uid`) from `board_user` where `uid`=?";
	public static final String SELECT_COUNT_NICK= "select count(`nick`) from `board_user` where `nick`=?";
	
	// board
	public static final String INSERT_ARTICLE = "insert into `board_article` set "
											  	+ "`title`=?,"
											  	+ "`content`=?,"
											  	+ "`uid`=?,"
											  	+ "`regip`=?,"
											  	+ "`rdate`= NOW()";
}
