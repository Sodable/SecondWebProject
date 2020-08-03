package DWM.dao;

import java.util.List;

import DWM.vo.FreeBoardVO;

public interface FreeBoardDao {
	
	public int write(FreeBoardVO vo);
	public List<FreeBoardVO> list();
	public List<FreeBoardVO> viewbody(int count);
	public int reWriteDo(FreeBoardVO vo);
	public int deleteView(int count);
	
}
