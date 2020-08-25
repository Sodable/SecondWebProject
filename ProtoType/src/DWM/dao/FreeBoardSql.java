package DWM.dao;

public interface FreeBoardSql {
	final String freelist = "select free_board.count COUNT, free_board.id ID, fb_weather, title, write_date, view_count , body, fb_file,fb_weather " + 
			"from free_board inner join board " + 
			"on board.count = free_board.count " + 
			"order by free_board.count desc";
	
	final String freeviewbody = "select free_board.count COUNT, free_board.id ID, title, write_date, view_count , body, fb_file,fb_weather " + 
			"from free_board inner join board " + 
			"on board.count = free_board.count " + 
			"where board.count = ? " + 
			"order by free_board.count desc";
	
	final String deleteview = "delete from board where count=?";

	final String raiseviewcount = "update board set view_count = ? where count = ?";

	final String searchlist1 = "select free_board.count COUNT, free_board.id ID, fb_weather, title, write_date, view_count , body, fb_file,fb_weather " + 
			"from free_board inner join board " + 
			"on board.count = free_board.count ";
	
	final String searchlist2 = " order by free_board.count desc";
}
