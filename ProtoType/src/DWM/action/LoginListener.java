package DWM.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class LoginListener implements HttpSessionBindingListener{
	String id;
	String nickname;

    public LoginListener() {
	}
    
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
    public void valueBound(HttpSessionBindingEvent event) {
        System.out.println(event.getName()+" : "+ nickname +"(" + id + ") 로그인 완료");
        DriverManagerDataSource dataSource = new DriverManagerDataSource("jdbc:oracle:thin:@192.168.0.172:1521:xe", "DWM", "admin1234");

		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn = dataSource.getConnection();
			pst = conn.prepareStatement("insert into online_member(id,nickname) values(?,?)");
			pst.setString(1, id);
			pst.setString(2, nickname);
			int n = pst.executeUpdate();
			if(n>0) {
				conn.commit();
			}else {
				conn.rollback();
			}
			pst.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent event) {
        System.out.println(event.getName()+" : "+ nickname +"(" + id + ") 로그아웃 완료");
        DriverManagerDataSource dataSource = new DriverManagerDataSource("jdbc:oracle:thin:@192.168.0.172:1521:xe", "DWM", "admin1234");

		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn = dataSource.getConnection();
			pst = conn.prepareStatement("update online_member set online_flag = 0, logout_date = to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') where id = ?");
			pst.setString(1, id);
			int n = pst.executeUpdate();
			if(n>0) {
				conn.commit();
			}else {
				conn.rollback();
			}
			pst.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
    }
    
}