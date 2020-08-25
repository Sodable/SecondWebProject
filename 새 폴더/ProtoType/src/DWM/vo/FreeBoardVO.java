package DWM.vo;

public class FreeBoardVO {
	private int count;
	private String id;
	private String title;
	private String body;
	private int view_count;
	private String write_date;
	private String fb_file;
	private String fb_weather;

	public FreeBoardVO() {
		super();
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
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
