package DWM.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DWM.dao.PhotoBoardDao;
import DWM.dao.PhotoBoardDaoImpl;
import DWM.vo.FreeBoardVO;
import DWM.vo.PhotoBoardVO;

@Service("photoBoardBiz")
public class PhotoBoardBiz {
	
	@Autowired
	private PhotoBoardDao photoboarddao;

	public List<PhotoBoardVO> list(String date, int pagenum) {
		return photoboarddao.list(date,pagenum);
	}

	public int writeDo(PhotoBoardVO vo) {
		return photoboarddao.writeDo(vo);
	}

	public int recommand(int count,String id) {
		return photoboarddao.recommand(count,id);
	}

	public List<PhotoBoardVO> top3list(String date) {
		return photoboarddao.top3list(date);
	}

	public PhotoBoardVO viewbody(int count) {
		return photoboarddao.viewbody(count);
	}

	public List<PhotoBoardVO> likelist(String id) {
		return photoboarddao.likelist(id);
	}

	public int recommandcancel(int count, String id) {
		return photoboarddao.recommandcancel(count,id);
	}

	public int delete(int count) {
		return photoboarddao.delete(count);
	}

	public List<PhotoBoardVO> list() {
		return photoboarddao.list();
	}

}
