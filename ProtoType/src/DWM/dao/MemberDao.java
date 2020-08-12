package DWM.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DWM.mapper.UserMapper;
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

	public String insert_more(MemberVO vo) {
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

	public MemberVO getLocale(String id) {
		MemberVO res = null;
		
		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			
			res = mapper.selectMemberInfo(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	public String getNickname(String id) {
		MemberVO res = null;
		
		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			
			res = mapper.selectMemberInfo(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res.getNickname();
	}

	public List<MemberVO> memberlist() {
		List<MemberVO> memberlist = null;
		
		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			memberlist = mapper.selectMemberList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberlist;
	}

	public int delete(String id) {
		int n = 0;
		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			
			n = mapper.deleteMember(id);
			if (n > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public MemberVO search(String id) {
		MemberVO res = null;

		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			res = mapper.memberSearch(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}
