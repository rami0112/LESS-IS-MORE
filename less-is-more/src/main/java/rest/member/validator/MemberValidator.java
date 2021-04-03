package rest.member.validator;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import rest.member.vo.MemberVO;

public class MemberValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberVO memberVO = (MemberVO) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required.id");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required.password");
	}
	
	public void joinValidate(Object target, Errors errors) {
		MemberVO memberVO = (MemberVO) target;
		
		
		if (memberVO.getId() == null || memberVO.getId().trim().isEmpty()) {
			errors.rejectValue("id", "join.required.id");
		} else if (!Pattern.matches("^[^\\s][a-z0-9]{3,15}$", memberVO.getId())) {
			errors.rejectValue("id", "join.false.id");
		} 
		
		if (memberVO.getPassword() == null || memberVO.getPassword().trim().isEmpty()) {
			errors.rejectValue("password", "join.required.password");
		} else if (!Pattern.matches("^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{10,16}$", memberVO.getPassword())) {
			errors.rejectValue("password", "join.false.password");
		} else if (!memberVO.getPasswordCheck().equals(memberVO.getPassword())) {
			errors.rejectValue("passwordCheck", "join.false.passwordCheck");
		}
		
		if (memberVO.getName() == null || memberVO.getName().trim().isEmpty()) {
			errors.rejectValue("name", "join.required.name");
		} else if (!Pattern.matches("[가-힣a-zA-Z]+", memberVO.getName())) {
			errors.rejectValue("name", "join.false.name");
		}
	}

}
