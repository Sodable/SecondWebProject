package DWM.dao;

import java.util.List;

import DWM.vo.FreeBoardVO;
import DWM.vo.PhotoBoardVO;

public interface PhotoBoardDao {

	public List<PhotoBoardVO> list(String date, int pagenum);
	public int writeDo(PhotoBoardVO vo);
	public int recommand(int count,String id);
	public List<PhotoBoardVO> top3list(String date);
	public PhotoBoardVO viewbody(int count);
	public List<PhotoBoardVO> likelist(String id);
	public int recommandcancel(int count, String id);
	public int delete(int count);
	public List<PhotoBoardVO> list();

}
