package DWM.dao;

import java.util.List;

import DWM.vo.PhotoBoardVO;

public interface PhotoBoardDao {

	public List<PhotoBoardVO> list(String date, int pagenum);
	public int writeDo(PhotoBoardVO vo);

}
