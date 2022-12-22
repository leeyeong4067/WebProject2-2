package cs.dit.persistency;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)  //현재 테스트 코드가 스프링 실행 역할을 할 것이라고 알림
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") //설정파일 읽어내기
@Log4j //lombok을 이용해 로그를 기록하는 Logger를 변수로 생성
public class JDBCTests {
	
	@Autowired
	private DataSource ds;
	
	
	@Test
	public void testCP() {
		
		try(Connection con = ds.getConnection();)
		{		
			log.info("testCP..............................");
			log.info(con);
			
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
		}
	}
	
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testMybatis() {
		SqlSession session = sqlSessionFactory.openSession();
		Connection connection = session.getConnection();
		
		log.info("testMybatis.......................................");
		log.info(session);
		log.info(connection);
		
	}
	
	
	@Test
	public void testConnection() {
		try {
			Class class1 = Class.forName("org.mariadb.jdbc.Driver");
			log.info("test Connection ...................................");
			log.info(class1);
			
			Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/jinsookdb", "jinsook", "1111");
			
			log.info(conn);
			conn.close();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
