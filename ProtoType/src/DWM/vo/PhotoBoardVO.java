package DWM.vo;

import org.springframework.web.multipart.MultipartFile;

public class PhotoBoardVO {
	private int count;
	private String id;
	private String title;
	private String body;
	private int view_count;
	private String write_date;
	private String pb_file;
	private String pb_count;
	private String pb_weather;
	private MultipartFile imagefile;

	public PhotoBoardVO() {
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

	public MultipartFile getImagefile() {
		return imagefile;
	}

	public void setImagefile(MultipartFile imagefile) {
		this.imagefile = imagefile;
	}

}
