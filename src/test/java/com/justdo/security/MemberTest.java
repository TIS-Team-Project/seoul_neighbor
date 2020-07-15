package com.justdo.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class MemberTest {
	@Autowired
	private PasswordEncoder pwencoder;

	@Autowired
	private DataSource ds;
	
	// test용 계정 비밀번호 인코딩용
	@Test
	public void testInsertMember() {
		String sql = "insert into tbl_member(userid, nickname, userpw, email, member_location) values(?, ?, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "bomi123");
			pstmt.setString(2, "새봄");
			pstmt.setString(3, pwencoder.encode("1234"));
			pstmt.setString(4, "spring@nate.com");
			pstmt.setString(5, "양천구");
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}


