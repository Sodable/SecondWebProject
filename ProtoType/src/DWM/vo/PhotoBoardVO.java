package DWM.vo;

public class PhotoBoardVO {
	private BoardVO board;
	private String pb_file;
	private String pb_count;
	private String pb_weather;

	public PhotoBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PhotoBoardVO(BoardVO board, String pb_file, String pb_count, String pb_weather) {
		super();
		this.board = board;
		this.pb_file = pb_file;
		this.pb_count = pb_count;
		this.pb_weather = pb_weather;
	}

	public BoardVO getBoard() {
		return board;
	}

	public void setBoard(BoardVO board) {
		this.board = board;
	}

	public String getPb_file() {
		return pb_file;
	}

	public void setPb_file(String pb_file) {
		this.pb_file = pb_file;
	}

	public String getPb_count() {
		return pb_count;
	}

	public void setPb_count(String pb_count) {
		this.pb_count = pb_count;
	}

	public String getPb_weather() {
		return pb_weather;
	}

	public void setPb_weather(String pb_weather) {
		this.pb_weather = pb_weather;
	}

}
