package DWM.dao;

public interface FreeBoardSql {
	final String writeboard = "insert into board values(BOARD_count_seq.NEXTVAL,?,?,?,0,to_char(sysdate, 'YYYY-MM-DD HH:MI:SS'))"
	+	"insert into free_board values(BOARD_count_seq.CURRVAL,?,?,?)";
	
	final String freelist = "select board.count count, board.id id, fb_weather, title, write_date, view_count from board inner join free_board on board.count = free_board.count order by board.count desc";
}
