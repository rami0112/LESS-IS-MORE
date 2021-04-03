package common;

//@ControllerAdvice(basePackages = {"rest"})
//public class CommonExceptionHandler {
//	
//	@ExceptionHandler(IdCheckException.class)
//	public Map<String, Object> idCheckException(MemberVO memberVO) {
//		Map<String, Object> rs = new HashMap<String, Object>();
//		
//		Pattern p = Pattern.compile("(^[a-z]{4-16}$)");
//		
//		if (memberVO.getId() == null || memberVO.getId().trim().isEmpty()) {
//			rs.put("msg", "아이디를 입력해주세요.");
//		} else {
//			Matcher matcher = p.matcher(memberVO.getId());
//			if (!matcher.matches()) {
//				rs.put("msg", "영문 소문자/숫자, 4~16자로 입력해주세요.");
//			}
//		}
//		return rs;
//	}
//}
