package rest.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import rest.member.exception.NotFoundException;
import rest.member.service.MemberService;
import rest.member.validator.MemberValidator;
import rest.member.vo.MemberVO;

@Controller
@RequestMapping("/")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@GetMapping("home")
	public String homeGet() {
		return "home";
	}

	// 로그인
	@GetMapping("member/login")
	public String loginGet() {
		return "member/login";
	}

	@PostMapping("member/login")
	public String login(MemberVO memberVO, Errors errors, Model model, HttpSession session,
			HttpServletRequest request) {
		new MemberValidator().validate(memberVO, errors);
		if (errors.hasErrors()) {
			model.addAttribute("member", memberVO);
			return "member/login";
		}

		try {
			MemberVO memberDB = memberService.selectMember(memberVO);
			if (memberDB != null) {
				session.setAttribute("member", memberDB);
				return "redirect:/home";
			}
		} catch (NotFoundException e) {
			errors.rejectValue("notFoundMember", "notFoundMember");
		}
		return "member/login";
	}

	// 회원가입
	@GetMapping("member/join")
	public String joinGet() {
		return "member/join";
	}

	@PostMapping("member/join")
	public String join(MemberVO memberVO, Errors errors, Model model, HttpSession session) {
		new MemberValidator().joinValidate(memberVO, errors);
		if (errors.hasErrors()) {
			model.addAttribute("member", memberVO);
			return "member/join";
		}
		try {
			int result = memberService.insertMember(memberVO);
			if (result == 1) {
				session.setAttribute("member", memberVO);
				return "redirect:/home";
			}
		} catch (DuplicateKeyException e) {
			errors.rejectValue("id", "duplicate.id");
			return "member/join";
		}
		return "member/join";
	}
	
	// 회원가입 폼 검증 ajax
	@PostMapping(value="member/joinId", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> joinId(MemberVO memberVO) {
		Map<String, Object> rs = new HashMap<String, Object>();
		try {
			MemberVO memberDB = memberService.selectMember(memberVO);
			if (memberDB != null) {
				rs.put("msg", memberDB.getId() + "는 사용중인 아이디입니다.");
			}
		} catch (NotFoundException e) {
			if (memberVO.getId() == null || memberVO.getId().trim().isEmpty()) {
				rs.put("msg", "아이디를 입력해주세요. (영문 소문자/숫자, 4~16자)");
			} else if (!Pattern.matches("^[^\\s][a-z0-9]{3,15}$", memberVO.getId())) {
				rs.put("msg", "영문 소문자/숫자, 4~16자로 입력해주세요. (공백/특수문자/영문 대문자 불가)");
			} else {
				rs.put("msg", "사용가능한 아이디입니다.");
			}
		}
		return rs;
	}
	
	@PostMapping(value="member/joinPassword", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> joinPassword(MemberVO memberVO) {
		Map<String, Object> rs = new HashMap<String, Object>();
			if (memberVO.getPassword() == null || memberVO.getPassword().trim().isEmpty()) {
				rs.put("msg", "비밀번호를 입력해주세요. (영문 대소문자/숫자/특수문자, 10~16자)");
			} else if (!Pattern.matches("^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{10,16}$", memberVO.getPassword())) {
				rs.put("msg", "영문 대소문자/숫자/특수문자, 10~16자로 입력해주세요.");
			} else {
				rs.put("msg", "");
			}
		return rs;
	}
	
	@PostMapping(value="member/joinPasswordCheck", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> joinPasswordCheck(MemberVO memberVO) {
		Map<String, Object> rs = new HashMap<String, Object>();
		if (memberVO.getPasswordCheck() == null || memberVO.getPasswordCheck().trim().isEmpty()) {
			rs.put("msg", "비밀번호 확인을 입력해주세요.");
		} else if (!memberVO.getPasswordCheck().equals(memberVO.getPassword())) {
			rs.put("msg", "비밀번호가 일치하지 않습니다.");
		} else {
			rs.put("msg", "");
		}
		return rs;
	}
	
	@PostMapping(value="member/joinName", produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> joinName(MemberVO memberVO) {
		Map<String, Object> rs = new HashMap<String, Object>();
		if (memberVO.getName() == null || memberVO.getName().trim().isEmpty()) {
			rs.put("msg", "이름을 입력해주세요.");
		} else if (!Pattern.matches("[가-힣a-zA-Z]+", memberVO.getName())) {
			rs.put("msg", "한글/영문 대소문자로 입력해주세요. (특수문자, 공백 사용 불가)");
		} else {
			rs.put("msg", "");
		}
		return rs;
	}
	
	// 로그아웃
	@GetMapping("member/logout")
	public String logoutGet(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
	
	// 프로필-수정하기
	@GetMapping("member/profile")
	public String profileGet() {
		return "member/profile";
	}
	
	@PostMapping("member/profile")
	public String profile(MemberVO memberVO, Errors errors, Model model, HttpSession session, HttpServletRequest request) {
		new MemberValidator().joinValidate(memberVO, errors);
		if (errors.hasErrors()) {
			return "member/profile";
		} else {
			int result = memberService.updateMember(memberVO);
			if (result == 1) {
				session.invalidate();
				model.addAttribute("msg", "수정되었습니다. 다시 로그인해주세요.");
				model.addAttribute("uri", request.getContextPath() + "/home");
				return "common/alert";
			}
		}
		return null;
	}
	
	// 프로필-탈퇴하기
	@PostMapping("member/delete")
	public String delete(MemberVO memberVO, Model model, HttpSession session, HttpServletRequest request) {
		int result = memberService.deleteMember(memberVO);
		if (result == 1) {
			session.invalidate();
			model.addAttribute("msg", "탈퇴되었습니다.");
			model.addAttribute("uri", request.getContextPath() + "/home");
			return "common/alert";
		} else {
			System.out.println("탈퇴실패");
			return "member/profile";
	
		}
	}

}