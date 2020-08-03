package DWM.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DWM.dao.FreeBoardDao;
import DWM.dao.FreeBoardDaoImpl;
import DWM.vo.FreeBoardVO;

@Service
public class FreeBoardBiz {
	
	@Autowired
	private FreeBoardDao freeboarddao;

	public int write(FreeBoardVO vo) {
		return freeboarddao.write(vo);
	}

	public List<FreeBoardVO> list() {
		return freeboarddao.list();
	}

	public List<FreeBoardVO> viewbody(int count) {
		return freeboarddao.viewbody(count);
	}

	public int reWriteDo(FreeBoardVO vo) {
		return freeboarddao.reWriteDo(vo);
	}

	public int deleteView(int count) {
		return freeboarddao.deleteView(count);
	}

}
