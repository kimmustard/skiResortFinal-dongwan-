package com.web.www;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.web.www.domain.board.NoticeVO;
import com.web.www.repository.NoticeDAO;


@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.web.www.config.RootConfig.class})
public class BoardTest {
	
	@Inject
	private NoticeDAO ndao;
	
	@Test
	public void insertBoard() {
		for(int i=0; i<300; i++) {
			NoticeVO nvo = new NoticeVO();
			nvo.setNoticeTitle("테스트 게시글 "+i);
			nvo.setNoticeWriter("운영자");
			switch((int)(Math.random()*6+1)) {
			case 1: nvo.setNoticeCategory("공지사항"); break;
			case 2: nvo.setNoticeCategory("이벤트"); break;
			case 3: nvo.setNoticeCategory("보도자료"); break;
			case 4: nvo.setNoticeCategory("쇼핑몰"); break;
			case 5: nvo.setNoticeCategory("채용정보"); break;
			case 6: nvo.setNoticeCategory("기타"); break;
			default: nvo.setNoticeCategory("기타"); break;
			}
			nvo.setNoticeContent("공지 게시글 테스트 중입니다.  NO: "+i);
			ndao.insert(nvo);
		}
	}
	
}
