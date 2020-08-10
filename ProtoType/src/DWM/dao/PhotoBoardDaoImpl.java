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
			try {
			vo.setPb_count(rs.getString("pb_count"));
			vo.setPb_file(rs.getString("pb_file"));
			vo.setPb_weather(rs.getString("pb_weather"));
			}catch(Exception e) {
			}
			try {
			vo.setWrite_date(rs.getString("write_date"));
			vo.setTitle(rs.getString("title"));
			}catch(Exception e) {
			}
			return vo;
		}

	}

	@Override
	public List<PhotoBoardVO> list(String date,int pagenum) {
		RowMapper<PhotoBoardVO> rowMapper= new PhotoBoardRowMapper();
//		System.out.println(date);
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

	@Override
	public int recommand(int count) {
		RowMapper<PhotoBoardVO> rowMapper= new PhotoBoardRowMapper();
		int res = 0;
		try {
			List<PhotoBoardVO> list = super.getJdbcTemplate().query(getpbcount,new Object[] {count}, rowMapper);
			PhotoBoardVO vo = list.get(0);
			System.out.println("증가 전 추천수 : "+vo.getPb_count());
			int pbcountint = Integer.parseInt(vo.getPb_count());
			pbcountint++;
			System.out.println("증가 후 추천수 : "+Integer.toString(pbcountint));
			res = super.getJdbcTemplate().update(raisepbcount,new Object[] {Integer.toString(pbcountint),count});
		}catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}
