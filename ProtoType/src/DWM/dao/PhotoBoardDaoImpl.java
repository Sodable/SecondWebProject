package DWM.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import DWM.dao.FreeBoardDaoImpl.FreeBoardRowMapper;
import DWM.vo.PhotoBoardVO;


@Repository
public class PhotoBoardDaoImpl extends JdbcDaoSupport implements PhotoBoardDao, PhotoBoardSql{

	public class PhotoBoardRowMapper implements RowMapper<PhotoBoardVO> {

		@Override
		public PhotoBoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			PhotoBoardVO vo = new PhotoBoardVO();
			vo.setCount(rs.getInt("count"));
			vo.setId(rs.getString("id"));
			vo.setTitle(rs.getString("title"));
			vo.setPb_count(rs.getString("pb_count"));
			vo.setWrite_date(rs.getString("write_date"));
			vo.setPb_file(rs.getString("pb_file"));
			vo.setPb_weather(rs.getString("pb_weather"));
			return vo;
		}

	}

	@Override
	public List<PhotoBoardVO> list(String date,int pagenum) {
		RowMapper<PhotoBoardVO> rowMapper= new PhotoBoardRowMapper();
		System.out.println(date);
		return super.getJdbcTemplate().query(selectall,new Object[] {String.valueOf(date+"%")}, rowMapper);
	}

	@Override
	public int writeDo(PhotoBoardVO vo) {
		int res1 = 1;
		try{
			super.getJdbcTemplate().update("call PHOTOBOARD_write_pr(?,?,?,?)", 
				new Object[] {vo.getId(),vo.getTitle(),vo.getPb_file(),vo.getPb_weather()});
		}catch(Exception e) {
			res1=0;
			e.printStackTrace();
		}
		
		return res1;
	}

}
