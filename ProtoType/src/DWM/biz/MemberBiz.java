package DWM.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DWM.dao.MemberDao;
import DWM.vo.MemberVO;

@Service
public class MemberBiz {
	@Autowired
	private MemberDao memberdao;
	
	public String insert(MemberVO vo) {
		return memberdao.insert(vo);
	}

	public String login(MemberVO vo) {
		return memberdao.login(vo);
	}
	

}
