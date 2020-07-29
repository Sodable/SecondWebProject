package DWM.vo;

public class CalendarVO {
	private String c_date;
	private int f_ranked;
	private int s_ranked;
	private int t_ranked;
	private String c_weather;

	public CalendarVO(String c_date, int f_ranked, int s_ranked, int t_ranked, String c_weather) {
		super();
		this.c_date = c_date;
		this.f_ranked = f_ranked;
		this.s_ranked = s_ranked;
		this.t_ranked = t_ranked;
		this.c_weather = c_weather;
	}

	public String getC_date() {
		return c_date;
	}

	public void setC_date(String c_date) {
		this.c_date = c_date;
	}

	public int getF_ranked() {
		return f_ranked;
	}

	public void setF_ranked(int f_ranked) {
		this.f_ranked = f_ranked;
	}

	public int getS_ranked() {
		return s_ranked;
	}

	public void setS_ranked(int s_ranked) {
		this.s_ranked = s_ranked;
	}

	public int getT_ranked() {
		return t_ranked;
	}

	public void setT_ranked(int t_ranked) {
		this.t_ranked = t_ranked;
	}

	public String getC_weather() {
		return c_weather;
	}

	public void setC_weather(String c_weather) {
		this.c_weather = c_weather;
	}

}
