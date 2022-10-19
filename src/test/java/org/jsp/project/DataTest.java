package org.jsp.project;

import javax.inject.Inject;

import org.jsp.project.dao.MemberDAO;
import org.jsp.project.vo.Member;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DataTest {

	
//	datasource 작동 테스트
	
//	@Inject
//	private DataSource ds;
//	
//	@Test
//	public void testConection()throws Exception{
//		
//		try(Connection con = ds.getConnection()) {
//			System.out.println(con);
//			System.out.println(con);
//			System.out.println(con);
//			System.out.println(con);
//			System.out.println(con);
//			System.out.println(con);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	
//	sqlsessionfactory 작동 테스트
	
//	@Inject
//	private SqlSessionFactory factory;
//	
//	@Test
//	public void testFactory() {
//		SqlSession session = factory.openSession();
//		System.out.println(session);
//		System.out.println(session);
//		System.out.println(session);
//		System.out.println(session);
//		System.out.println(session);
//	}
	
	
//	dao 테스트
	
//	@Inject
//	TestDAO dao;
//	
//	@Test
//	public void DAOtest() {
//		dao.insert(new TestVO("a", "b", "c"));
//	}
	
}
