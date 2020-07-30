package DWM.dao;

import java.util.List;

import DWM.vo.FreeBoardVO;

public interface FreeBoardDao {
	
	public int write(FreeBoardVO vo);
	public List<FreeBoardVO> list();
	
}
