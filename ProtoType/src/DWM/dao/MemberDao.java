package DWM.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DWM.vo.MemberVO;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionFactory factory;

	public String insert(MemberVO vo) {
		String result = null;

		try (SqlSession session = factory.openSession();) {
			int n = session.insert("member.insertMember", vo);
			if (n > 0) {
				result = vo.getName();
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}

	public String login(MemberVO vo) {
		String result = null;
		MemberVO res = null;

		try (SqlSession session = factory.openSession();) {
			res = session.selectOne("member.loginMember", vo);
			if (res != null) {
				result = res.getName();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}

}
