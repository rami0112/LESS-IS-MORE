package rest.board.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class BoardVO {
	private Long board_no;
	@NotEmpty
	private String title;
	@NotEmpty
	private String content;
	private LocalDate reg_date;
	private String m_id;
}
