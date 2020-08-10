package DWM.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import DWM.vo.FreeBoardVO;

@Repository
public class FreeBoardDaoImpl extends JdbcDaoSupport implements FreeBoardDao, FreeBoardSql {

	public class FreeBoardRowMapper implements RowMapper<FreeBoardVO> {

		@Override
		public FreeBoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			FreeBoardVO vo = new FreeBoardVO();
			vo.setCount(rs.getInt("count"));
			vo.setId(rs.getString("id"));
			vo.setTitle(rs.getString("title"));
			vo.setView_count(rs.getInt("view_count"));
			vo.setWrite_date(rs.getString("write_date"));
			try {//select 시 null값 문제 해결법 생각해보자
			vo.setBody(rs.getString("body"));
			vo.setFb_file(rs.getString("fb_file"));
			vo.setFb_weather(rs.getString("fb_weather"));
			}catch(Exception e ) {
				e.printStackTrace();
			}
			return vo;
		}

	}
	
	@Override
	public int write(FreeBoardVO vo) {
		int res1 = 1;
		try{
			super.getJdbcTemplate().update("call FREEBOARD_write_pr(?,?,?,?,?)", 
				new Object[] {vo.getId(),vo.getTitle(),vo.getBody(),vo.getFb_file(),vo.getFb_weather()});
		}catch(Exception e) {
			res1=0;
		}
		
		return res1;
	}

	@Override
	public List<FreeBoardVO> list() {
		RowMapper<FreeBoardVO> rowMapper= new FreeBoardRowMapper();
		return super.getJdbcTemplate().query(freelist, rowMapper);
	}

	@Override
	public List<FreeBoardVO> viewbody(int count) {
		RowMapper<FreeBoardVO> rowMapper= new FreeBoardRowMapper();
		return super.getJdbcTemplate().query(freeviewbody, new Object[] {count}, rowMapper);
	}

	@Override
	public int reWriteDo(FreeBoardVO vo) {
		int res1 = 1;
		try{
			super.getJdbcTemplate().update("call FREEBOARD_rewrite_pr(?,?,?,?,?,?)", 
				new Object[] {vo.getId(),vo.getTitle(),vo.getBody(),vo.getFb_file(),vo.getFb_weather(),vo.getCount()});
		}catch(Exception e) {
			e.printStackTrace();
			res1=0;
		}
		
		return res1;
	}

	@Override
	public int deleteView(int count) {
		return super.getJdbcTemplate().update(deleteview, new Object[] {count});
	}


}
