package DWM.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DWM.dao.BoardDao;
import DWM.dao.MemberDao;
import DWM.vo.MemberVO;

@Service
public class MasterBiz {
	@Autowired
	private MemberDao memberdao;

	public List<MemberVO> memberlist() {
		return memberdao.memberlist();
	}

	public MemberVO membersearch(String id) {
		return memberdao.search(id);
	}

}
