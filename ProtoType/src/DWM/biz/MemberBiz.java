package DWM.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DWM.dao.MemberDao;
import DWM.vo.MemberInfoVO;
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

	public String insert_more(MemberInfoVO vo) {
		return memberdao.insert_more(vo);
	}

	public MemberInfoVO getLocale(String id) {
		return memberdao.getLocale(id);
	}

	public String getNickname(String id) {
		return memberdao.getNickname(id);
	}
	

}
