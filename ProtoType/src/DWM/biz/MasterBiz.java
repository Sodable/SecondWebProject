package DWM.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DWM.dao.MemberDao;
import DWM.vo.MemberVO;
import DWM.vo.OnlineMemberVO;

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

	public List<OnlineMemberVO> memberanaly(String date) {
		return memberdao.memberanaly(date);
	}

	public int todaytotalnum(String date) {
		return memberdao.todaytotalnum(date);
	}

}
