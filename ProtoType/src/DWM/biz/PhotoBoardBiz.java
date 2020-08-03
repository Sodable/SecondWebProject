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

	public List<PhotoBoardVO> list(String date) {
		return photoboarddao.list(date);
	}

	public int writeDo(PhotoBoardVO vo) {
		return photoboarddao.writeDo(vo);
	}

}
