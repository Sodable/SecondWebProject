package DWM.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import DWM.vo.MemberInfoVO;
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
	public int updateMemberInfo(MemberInfoVO vo);
	
	@Select("select * from member_info where id = #{id}")
	public MemberInfoVO selectMemberInfo(String id);
	
	@Select("select * from member where password= #{password} and id = #{id}")
	public MemberVO loginMember(MemberVO vo);
}
