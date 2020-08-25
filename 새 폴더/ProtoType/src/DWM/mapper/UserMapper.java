package DWM.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import DWM.vo.MemberVO;

@Repository
public interface UserMapper {
	
	@Insert("insert into member	values(#{id},#{password},#{name},#{tel},#{email})")
	public int insertMember(MemberVO vo);
	
	@Insert("insert into member_info(id) values(#{id})")
	public int insertMemberInfo(String id);
	
	@Update("update member_info " + 
			"set nickname = #{nickname}, gender = #{gender}, age = #{age}, " + 
			"locale = #{locale}, job = #{job}, job_locale = #{locale}" + 
			"where id = #{id}")
	public int updateMemberInfo(MemberVO vo);
	
	@Select("select * from member_info where id = #{id}")
	public MemberVO selectMemberInfo(String id);
	
	@Select("select * from member where password= #{password} and id = #{id}")
	public MemberVO loginMember(MemberVO vo);
	
	@Select("select * from member right outer join member_info using(id)")
	public List<MemberVO> selectMemberList();
	
	@Delete("delete from member where id = #{id}")
	public int deleteMember(String id);
	
	@Select("select * from member right outer join member_info using(id) where id = #{id}")
	public MemberVO memberSearch(String id);
	
}
