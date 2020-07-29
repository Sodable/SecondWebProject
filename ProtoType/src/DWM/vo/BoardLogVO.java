package DWM.vo;

public class BoardLogVO {
	private BoardVO board;
	private String update_date;
	private String title;
	private String body;

	public BoardLogVO(BoardVO board, String update_date, String title, String body) {
		super();
		this.board = board;
		this.update_date = update_date;
		this.title = title;
		this.body = body;
	}

	public BoardVO getBoard() {
		return board;
	}

	public void setBoard(BoardVO board) {
		this.board = board;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

}
