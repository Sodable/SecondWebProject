package DWM.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DWM.mapper.UserMapper;
import DWM.vo.MemberInfoVO;
import DWM.vo.MemberVO;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionFactory factory;

	public String insert(MemberVO vo) {
		String result = null;

		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			
			int n = mapper.insertMember(vo);
			int n2 = mapper.insertMemberInfo(vo.getId());
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
			UserMapper mapper = session.getMapper(UserMapper.class);
			res = mapper.loginMember(vo);
			if (res != null) {
				result = res.getId();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String insert_more(MemberInfoVO vo) {
		String result = null;

		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			
			int n = mapper.updateMemberInfo(vo);
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
		MemberInfoVO res = null;
		
		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			
			res = mapper.selectMemberInfo(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	public String getNickname(String id) {
		MemberInfoVO res = null;
		
		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			
			res = mapper.selectMemberInfo(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res.getNickname();
	}

}
