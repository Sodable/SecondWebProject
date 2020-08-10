package DWM.validate;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import DWM.vo.MemberVO;

//spring ���� �������ִ� ��ȿ�� �˻� Ŭ������ implements
@Service("memberValidator")
public class MemberValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		//��ȿ�� ��� Ŭ����
		return false;
	}

	@Override
	public void validate(Object member, Errors errors) {
		MemberVO member02 = (MemberVO) member;
		System.out.println(member02.getId()+"   id");
		System.out.println(member02.getPassword()+"   pw");
		
		if(member02!=null) {
			if(member02.getId().isEmpty()) {
				errors.rejectValue("id", "no id", "ID�� �Է��ϼ���");
			}
		}
		if(member02.getPassword().isEmpty()) {
				errors.rejectValue("password", "no password", "Password�� �Է��ϼ���");
		}
	}

	
}
