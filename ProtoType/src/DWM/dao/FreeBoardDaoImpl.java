package DWM.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import DWM.vo.FreeBoardVO;
import DWM.vo.PhotoBoardVO;

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
		List<FreeBoardVO> list = super.getJdbcTemplate().query(freeviewbody, new Object[] {count}, rowMapper);
		
		FreeBoardVO vo = list.get(0);
		//System.out.println("증가 전 추천수 : "+vo.getPb_count());
		int pbcountint = vo.getView_count();
		pbcountint++;
		vo.setView_count(pbcountint);
		//System.out.println("증가 후 추천수 : "+Integer.toString(pbcountint));
		int res = super.getJdbcTemplate().update(raiseviewcount,new Object[] {pbcountint,count});
		list.set(0, vo);
		
		return list;
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

	@Override
	public List<FreeBoardVO> searchlist(String type, String search) {
		RowMapper<FreeBoardVO> rowMapper= new FreeBoardRowMapper();
		List<FreeBoardVO> list = null;
		switch(type) {
		case "제목" : list = super.getJdbcTemplate().query(searchlist1+"where title like ?"+searchlist2,
								new Object[] {"%"+search+"%"},rowMapper);
			break;
		case "내용" : list = super.getJdbcTemplate().query(searchlist1+"where body like ?"+searchlist2,
				new Object[] {"%"+search+"%"},rowMapper);
			break;
		case "작성자" : list = super.getJdbcTemplate().query(searchlist1+"where free_board.id like ?"+searchlist2,
				new Object[] {"%"+search+"%"},rowMapper);
			break;
		case "제목/내용" : list = super.getJdbcTemplate().query(searchlist1+"where title like ? or body like ?"+searchlist2,
				new Object[] {"%"+search+"%","%"+search+"%"},rowMapper);
			break;
		default : 
		}
		return list;
	}


}
