package DWM.validate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import DWM.dao.PhotoBoardDao;
import DWM.vo.PhotoBoardVO;

//spring ���� �������ִ� ��ȿ�� �˻� Ŭ������ implements
@Service("photoBoardValidator")
public class PhotoBoardValidator implements Validator {
	@Autowired
	private PhotoBoardDao photopoarddao;

	@Override
	public boolean supports(Class<?> clazz) {
		// ��ȿ�� ��� Ŭ����
		return false;
	}

	@Override
	public void validate(Object member, Errors errors) {
		PhotoBoardVO member02 = (PhotoBoardVO) member;
		System.out.println(member02.getTitle() + "   title");
		System.out.println(member02.getImagefile() + "    imagefile");

		if (member02 != null) {
			if (member02.getTitle().isEmpty()) {
				errors.rejectValue("title", "no title", "Title�� �Է��ϼ���");
			}
		}
		if (member02.getImagefile().isEmpty()) {
			errors.rejectValue("imagefile", "no file", "File�� �����ϼ���");
		}
	}
}
