package DWM.dao;

import java.sql.SQLIntegrityConstraintViolationException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DWM.vo.MemberInfoVO;
import DWM.vo.MemberVO;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionFactory factory;

	public String insert(MemberVO vo) {
		String result = null;

		try (SqlSession session = factory.openSession();) {
			int n = session.insert("member.insertMember", vo);
			int n2 = session.insert("member.insertMemberInfo", vo);
			if (n > 0) {
				if (!vo.getName().equals(null)) {
					result = vo.getName();
				} else {
					result = vo.getId();
				}
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

	public String insert_more(MemberInfoVO vo) {
		String result = null;

		try (SqlSession session = factory.openSession();) {
			int n = session.update("member.updateMemberInfo", vo);
			if (n > 0) {
				if (!vo.getNickname().equals(null)) {
					result = vo.getNickname();
				} else {
					result = vo.getId();
				}
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public MemberInfoVO getLocale(String id) {
		MemberInfoVO vo = new MemberInfoVO();
		vo.setId(id);
		MemberInfoVO res = null;
		
		try (SqlSession session = factory.openSession();) {
			res = session.selectOne("member.selectMemberInfo", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
