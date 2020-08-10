package DWM.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DWM.dao.PhotoBoardDao;
import DWM.dao.PhotoBoardDaoImpl;
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

	public int recommand(int count) {
		return photoboarddao.recommand(count);
	}

}
