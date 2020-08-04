package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import DWM.vo.MemberVO;

@Repository
public interface UserMapper {
	@Select("SELECT user_name AS userNAME FROM member")
	List<MemberVO> listMembers();
	
	@Insert("insert into member \r\n" + 
			"		values(#{id},#{password},#{name},#{tel},#{email})")
	
	@Select("select * from member where password= #{password} and id = #{id}")
	public MemberVO getMemberVO(String id, String password);
}
