package DWM.dao;

public interface PhotoBoardSql {
	final String selectall = "select photo_board.count COUNT, photo_board.id ID, title, pb_count, write_date, pb_file, pb_weather " + 
			"from photo_board inner join board " + 
			"on board.count = photo_board.count " + 
			"where write_date like ?  " + 
			"order by photo_board.count desc";
	final String getpbcount = "select * from photo_board where count = ?";
	final String raisepbcount = "update photo_board set pb_count = ? where count = ?";
}
