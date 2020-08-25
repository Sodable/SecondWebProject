package DWM.vo;

public class BoardVO {
	private int count;
	private MemberVO id;
	private String title;
	private String body;
	private int view_count;
	private String write_date;

	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardVO(int count, MemberVO id, String title, String body, int view_count, String write_date) {
		super();
		this.count = count;
		this.id = id;
		this.title = title;
		this.body = body;
		this.view_count = view_count;
		this.write_date = write_date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public MemberVO getId() {
		return id;
	}

	public void setId(MemberVO id) {
		this.id = id;
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

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

}
