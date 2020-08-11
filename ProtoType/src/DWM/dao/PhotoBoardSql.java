package DWM.dao;

public interface PhotoBoardSql {
	final String selectall = "select photo_board.count COUNT, photo_board.id ID, title, pb_count, write_date, pb_file, pb_weather " + 
			"from photo_board inner join board " + 
			"on board.count = photo_board.count " + 
			"where write_date like ?  " + 
			"order by photo_board.count desc";
	final String selecttop3 = "select photo_board.count COUNT, photo_board.id ID, title, pb_count, write_date, pb_file, pb_weather " + 
			"from photo_board inner join board " + 
			"on board.count = photo_board.count " + 
			"where write_date like ?  " + 
			"order by pb_count desc";
	final String selectone = "select photo_board.count COUNT, photo_board.id ID, title, pb_count, write_date, pb_file, pb_weather " + 
			"from photo_board inner join board " + 
			"on board.count = photo_board.count " + 
			"where photo_board.count = ?";
	final String getpbcount = "select * from photo_board where count = ?";
	final String raisepbcount = "update photo_board set pb_count = ? where count = ?";
	final String insertlike = "insert into photo_board_like values(?,?)";
	final String deletelike = "delete from photo_board_like where count = ? and id = ?";
	final String selectlike = "select * from photo_board_like where id = ?";
	final String delete = "delete from board where count=?";
}
