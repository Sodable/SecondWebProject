package DWM.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DWM.mapper.UserMapper;
import DWM.vo.MemberVO;
import DWM.vo.OnlineMemberVO;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionFactory factory;

	public SqlSessionFactory getFactory() {
		return factory;
	}

	public void setFactory(SqlSessionFactory factory) {
		this.factory = factory;
	}

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

	public String insert_loc(MemberVO vo) {
		String result = null;

		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);

			int n = mapper.insertMemberLoc(vo);
			if (n > 0) {
				result = vo.getId();

				n = mapper.updateMemberlocflag1(vo);
				n = mapper.updateMemberlocflag2(vo);
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

			res = mapper.selectMemberLoc(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public String getNickname(String id) {
		MemberVO res = null;
		String result = null;

		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);

			res = mapper.selectMemberInfo(id);
			if (res != null) {
				result = res.getNickname();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
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

	public List<OnlineMemberVO> memberanaly(String date) {
		List<OnlineMemberVO> memberlist = null;
		date = "%" + date + "%";

		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			memberlist = mapper.selectOnlineMember(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberlist;
	}

	public int todaytotalnum(String date) {
		List<OnlineMemberVO> memberlist = null;
		int todaytotalnum = 0;
		date = "%" + date + "%";

		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			memberlist = mapper.selectTodayMember(date);
			todaytotalnum = memberlist.size();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return todaytotalnum;
	}

	public List<MemberVO> getLocaleList(String id) {
		List<MemberVO> list = null;

		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			list = mapper.selectLocaleList(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int updateFlag(MemberVO vo) {
		int n = 0;
		try (SqlSession session = factory.openSession();) {
			UserMapper mapper = session.getMapper(UserMapper.class);
			System.out.println(vo.getId() + " : " + vo.getLocale());

			n = mapper.updateMemberlocflag1(vo);
			if (n > 0) {
				n = mapper.updateMemberlocflag2(vo);
				if (n > 0) {
					session.commit();
				} else {
					session.rollback();
				}
			}else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return n;
	}

}
