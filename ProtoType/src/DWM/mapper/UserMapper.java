package DWM.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import DWM.vo.MemberVO;
import DWM.vo.OnlineMemberVO;

@Repository
public interface UserMapper {
	
	@Insert("insert into member	values(#{id},#{password},#{name},#{tel},#{email})")
	public int insertMember(MemberVO vo);
	
	@Insert("insert into member_info(id) values(#{id})")
	public int insertMemberInfo(String id);
	
	@Update("update member_info " + 
			"set nickname = #{nickname}, gender = #{gender}, age = #{age}, job = #{job} " + 
			"where id = #{id}")
	public int updateMemberInfo(MemberVO vo);
	
	@Insert("insert into member_loc values(#{id},#{locale},#{locale},1)")
	public int insertMemberLoc(MemberVO vo);
	
	@Select("select * from member_info where id = #{id}")
	public MemberVO selectMemberInfo(String id);

	@Select("select * from member_loc where id = #{id} and loc_flag = 1")
	public MemberVO selectMemberLoc(String id);
	
	@Select("select * from member where password= #{password} and id = #{id}")
	public MemberVO loginMember(MemberVO vo);
	
	@Select("select * from member right outer join member_info using(id)")
	public List<MemberVO> selectMemberList();
	
	@Delete("delete from member where id = #{id}")
	public int deleteMember(String id);
	
	@Select("select * from member right outer join member_info using(id) where id = #{id}")
	public MemberVO memberSearch(String id);

	@Select("select * from online_member where online_flag = 1 and login_date like #{date}")
	public List<OnlineMemberVO> selectOnlineMember(String date);

	@Select("select * from online_member where login_date like #{date}")
	public List<OnlineMemberVO> selectTodayMember(String date);
	
	@Update("update member_loc set loc_flag = 0 where id = #{id}")
	public int updateMemberlocflag1(MemberVO vo);

	@Update("update member_loc set loc_flag = 1 where id = #{id} and locale = #{locale}")
	public int updateMemberlocflag2(MemberVO vo);

}
