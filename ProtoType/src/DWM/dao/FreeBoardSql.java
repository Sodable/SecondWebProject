package DWM.dao;

public interface FreeBoardSql {
	final String writeboard = "insert into board values(BOARD_count_seq.NEXTVAL,?,?,?,0,to_char(sysdate, 'YYYY-MM-DD HH:MI:SS'))"
	+	"insert into free_board values(BOARD_count_seq.CURRVAL,?,?,?)";
	
	final String freelist = "select free_board.count COUNT, free_board.id ID, fb_weather, title, write_date, view_count , body, fb_file,fb_weather\r\n" + 
			"from free_board inner join board \r\n" + 
			"on board.count = free_board.count \r\n" + 
			"order by free_board.count desc";
	
	final String freeviewbody = "select free_board.count COUNT, free_board.id ID, title, write_date, view_count , body, fb_file,fb_weather\r\n" + 
			"from free_board inner join board \r\n" + 
			"on board.count = free_board.count \r\n" + 
			"where board.count = ?\r\n" + 
			"order by free_board.count desc";
}
