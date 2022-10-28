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
											  	+ "`file`=?,"
											  	+ "`uid`=?,"
											  	+ "`regip`=?,"
											  	+ "`rdate`= NOW()";
	
	public static final String SELECT_FILE = "select * from `board_file` where `parent`=?";
	
	public static final String INSERT_FILE = "insert into `board_file` set"
											+ "`parent`=?,"
											+ "`newName`=?,"
											+ "`oriName`=?";
	
	public static final String SELECT_MAX_NO = "SELECT MAX(`no`) FROM `board_article`";
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`no`) FROM `board_article`;";
	
	public static final String SELECT_ARTICLES = "SELECT a.*, b.nick FROM `board_article` AS a "
												+ "JOIN `board_user` AS b "
												+ "ON a.uid = b.uid "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";
	public static final String SELECT_ARTICLE = " SELECT a.*, b.fno, b.parent AS pno, b.newName, b.oriName, b.download "
												+ "FROM `board_article` AS a "
												+ "LEFT JOIN `board_file` AS b "
												+ "ON a.`no` = b.`parent` "
												+ "WHERE `no`=? ";
	
	public static final String UPDATE_ARTICLE_HIT = " UPDATE `board_article` SET `hit` = `hit` + 1 WHERE `no`=?";
	
	public static final String UPDATE_FILE_DOWNLOAD = "update `board_file` set `download` = `download` +1 where `fno`=?";
}
