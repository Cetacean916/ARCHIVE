package dto;

import java.sql.Date;
import java.sql.Timestamp;
import lombok.*;

@Getter @Setter
public class BoardVO {
	private int num;
	private String title;
	private String writer;
	private Date regdate;
	private int cnt;
	private String content;
}
