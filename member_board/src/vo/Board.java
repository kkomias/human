package vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {

	private Long bno;
	private String title;
	private String content;
	private Date regDate;
	private String id;
	private Long categoty;
	
	private List<Attach> attaches;
	private Integer replyCnt;

	public Board(String title, String content, String id, Long categoty) {
		super();
		this.title = title;
		this.content = content;
		this.id = id;
		this.categoty = categoty;
	}
	
	public Board(Long bno, String title, Date regDate, String id, Long categoty) {
		super();
		this.bno = bno;
		this.title = title;
		this.regDate = regDate;
		this.id = id;
		this.categoty = categoty;
	}
	
	public Board(Long bno, String title, String content, Date regDate, String id, Long categoty) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.id = id;
		this.categoty = categoty;
	}

	public Board(Long bno, String title, String content) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
	}

	public Board(Long bno, String title, String content, String id, Long categoty) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.id = id;
		this.categoty = categoty;
	}

}
