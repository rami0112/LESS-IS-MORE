package rest.member.vo;

import java.time.LocalDateTime;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class MemberVO {
	private Long member_code;
//	@NotEmpty (message="아이디를 입력해주세요.")
	private String id;
//	@NotEmpty (message="비밀번호를 입력해주세요.")
	private String password;
//	@NotEmpty (message="이름을 입력해주세요.")
	private String name;
	private LocalDateTime reg_date;

	private String passwordCheck;
	private String notFoundMember;
}
