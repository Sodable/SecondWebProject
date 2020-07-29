package DWM.vo;

public class FreeBoardVO {
	private BoardVO board;
	private String fb_file;
	private String fb_weather;

	public FreeBoardVO(BoardVO board, String fb_file, String fb_weather) {
		super();
		this.board = board;
		this.fb_file = fb_file;
		this.fb_weather = fb_weather;
	}

	public BoardVO getBoard() {
		return board;
	}

	public void setBoard(BoardVO board) {
		this.board = board;
	}

	public String getFb_file() {
		return fb_file;
	}

	public void setFb_file(String fb_file) {
		this.fb_file = fb_file;
	}

	public String getFb_weather() {
		return fb_weather;
	}

	public void setFb_weather(String fb_weather) {
		this.fb_weather = fb_weather;
	}

}
