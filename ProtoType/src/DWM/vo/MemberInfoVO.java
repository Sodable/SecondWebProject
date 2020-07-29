package DWM.vo;

public class MemberInfoVO {
	private MemberVO id;
	private String nickname;
	private String gender;
	private int age;
	private String locale;
	private String job;
	private String job_locale;

	public MemberInfoVO(MemberVO id, String nickname, String gender, int age, String locale, String job,
			String job_locale) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.gender = gender;
		this.age = age;
		this.locale = locale;
		this.job = job;
		this.job_locale = job_locale;
	}

	public MemberVO getId() {
		return id;
	}

	public void setId(MemberVO id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getLocale() {
		return locale;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getJob_locale() {
		return job_locale;
	}

	public void setJob_locale(String job_locale) {
		this.job_locale = job_locale;
	}

}
