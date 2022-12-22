package cs.dit.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration //Test for Controller 
@ContextConfiguration({
  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
  "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTests {

	@Autowired
	private WebApplicationContext wts;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wts).build();
	}
	
	@Test
	public void testList() throws Exception{
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	@Test
	public void testRegister() throws Exception{
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.post("/board/register")
				.param("title", "테스트")
				.param("content", "content")
				.param("writer", "작성자")
					)
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	@Test
	public void testRemove() throws Exception{
		log.info("test remove...........................");
		
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "102")
					)
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}	
	@Test
	public void testModify() throws Exception{
		log.info("test modify...........................");
		
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.post("/board/modify")
				.param("bno", "4")
				.param("title", "수정합니다.")
				.param("content", "수정완료")
				.param("writer", "홍길순")
					)
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}		
}
