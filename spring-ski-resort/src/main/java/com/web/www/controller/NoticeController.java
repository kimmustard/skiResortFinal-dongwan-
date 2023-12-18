package com.web.www.controller;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.web.www.domain.FileVO;
import com.web.www.domain.board.NoticeDTO;
import com.web.www.domain.board.NoticeVO;
import com.web.www.domain.board.PagingVO;
import com.web.www.handler.FileHandler;
import com.web.www.handler.PagingHandler;
import com.web.www.service.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
@RequestMapping("/notice/*")
@RequiredArgsConstructor
public class NoticeController {
	
	private final NoticeService nsv;
	
	private final FileHandler fh;
	
	
	


	
	@GetMapping("/register")
	public String noticeRegister(HttpSession ses) {
		String memberId = (String) ses.getAttribute("memberId");	
		log.info("@@@@@ = {}", memberId);
		return "/notice/register";
	}
	

	
	//파일업로드 추가
	@PostMapping("/register")
	public String noticeRegister(NoticeVO nvo, RedirectAttributes re,
			@RequestParam(name="files", required = false)MultipartFile[] files) {
		log.info(" >>>>> register "+nvo+" "+files);
		List<FileVO> flist = null;
		if(files[0].getSize() > 0) {
			String category ="notice";
			flist = fh.uploadFiles(files,category);
		}
		int isOk = nsv.noticeRegister(new NoticeDTO(nvo, flist));
		log.info(">>>>> notice register >> "+(isOk > 0? "OK" : "Fail"));
		return "redirect:/notice/list";
	}
	
	
	
	//페이징 추가
	@GetMapping("/list")
	public void noticeList(Model m, PagingVO pgvo) {
		m.addAttribute("list", nsv.noticeList(pgvo));
		m.addAttribute("plist", nsv.noticePointList(pgvo)); //중요공지 목록 가져오기
		int totalCount = nsv.getTotalCount(pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		m.addAttribute("ph",ph);
		List<FileVO> Ifvo = nsv.noticeImpactFileList(); //noticeImpact 파일 목록 가져오기
		m.addAttribute("Ifvo", Ifvo);
		List<FileVO> fvo = nsv.noticeListFile(); //리스트 썸네일 파일 가져오기
		m.addAttribute("fvo",fvo);
	}
	
	
	

	
	//파일업로드 추가
	@GetMapping({"/detail","/modify"})
	public void noticeDetail(Model m, @RequestParam("noticeNum")long noticeNum) {
		NoticeDTO ndto = nsv.noticeDetail(noticeNum);
		m.addAttribute("ndto",ndto);
	}
	
	
	//파일업로드 추가
	@PostMapping("/modify")
	public String noticeModify(NoticeVO nvo, RedirectAttributes re,
			@RequestParam(name="files", required = false)MultipartFile[] files) {
	
		List<FileVO> flist = null;
		if(files[0].getSize() > 0) {
			String category ="notice";
			flist = fh.uploadFiles(files,category);
		}
		NoticeDTO ndto = new NoticeDTO(nvo, flist);
		int isOk = nsv.noticeFileModify(ndto);
		re.addFlashAttribute("isOk",isOk);
		return "redirect:/notice/detail?noticeNum="+nvo.getNoticeNum();
	}
	
	
	@GetMapping("/remove")
	public String noticeRemove(@RequestParam("noticeNum")long noticeNum, RedirectAttributes re) {
		int isOk = nsv.noticeRemove(noticeNum);
		log.info(">>>>> notice remove >> "+(isOk > 0? "OK" : "Fail"));
		re.addFlashAttribute("isOk", isOk);
		return "redirect:/notice/list";
	}
	
	@DeleteMapping(value = "/file/{uuid}")
	public ResponseEntity<String> noticeRemoveFile(@PathVariable("uuid") String uuid){
		log.info(">>>>파일삭제확인 uuid >>"+uuid);
		int isOk = nsv.noticeRemoveFile(uuid);
		return isOk > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//공지 두 개 비동기로 보내기
	@GetMapping(value="/getTwoNotice", produces = {MediaType.APPLICATION_JSON_VALUE} )
	public ResponseEntity<List<NoticeVO>> getTwoNotice() {
		List<NoticeVO> list  = nsv.getTwoNotice();
		int isOk=0;
		if(list != null && !list.isEmpty()) {
			isOk=1;			
		}
		return isOk > 0 ? new ResponseEntity<List<NoticeVO>>(list, HttpStatus.OK)
				: new ResponseEntity<List<NoticeVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//이벤트 5개 비동기로 보내기
	@GetMapping(value = "/getFiveEvent", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<NoticeVO>> getFiveEvent() {
		List<NoticeVO> list  = nsv.getFiveEvent();
		log.info("lsit>>>>>>>>>>"+list);
		int isOk=0;
		if(list != null && !list.isEmpty()) {
			isOk=1;
		}
		log.info(isOk+"isOk<<<<<<<<");
		return isOk > 0 ? new ResponseEntity<List<NoticeVO>>(list, HttpStatus.OK)
				: new ResponseEntity<List<NoticeVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	
	//notice 테이블에 아무 값도 없을때 값 추가
	@PostConstruct
	public void addRoomList() {
		int eventCnt = nsv.selectEventCnt();
		if (eventCnt == 0) {
			List<NoticeVO> EventList = new ArrayList<NoticeVO>();
			EventList.add(new NoticeVO(0, "ADMIN", "이벤트", "스키맨 챌린지, 눈 위의 영웅 찾기!","스키장에서 열리는 스키맨 챌린지에 참여하여 뛰어난 스키 실력과 독특한 의상으로 눈에 띄는 참가자가 될 수 있는 기회를 놓치지 마세요. 스키맨 중에서 가장 독창적이고 특색 있는 참가자에게는 특별한 상품이 수여됩니다. 1등 상품: 스키 액세서리 세트와 VIP 스키 트립\r\n"
					+ "\r\n"
					+ "스키맨 챌린지 최우수 참가자에게는 고품질의 스키 장비 세트 (스키, 양말, 장갑 등)가 포함된 액세서리 세트를 드립니다.\r\n"
					+ "또한, VIP 스키 트립을 선물로 드려 여러 유명 스키 장소에서 특별한 스키 체험을 즐길 수 있는 기회를 제공합니다.\r\n"
					+ "2등 상품: 스포츠 용품 상점 상품권과 다이스키 액세서리\r\n"
					+ "\r\n"
					+ "2등 수상자에게는 다양한 스포츠 용품 상점에서 사용 가능한 상품권을 제공합니다.\r\n"
					+ "스키 액세서리도 함께 증정하여 스키 활동을 더욱 즐겁게 즐길 수 있도록 돕습니다.\r\n"
					+ "3등 상품: 다이스키 액세서리 및 스키 리조트 할인 쿠폰\r\n"
					+ "\r\n"
					+ "3등으로 선정된 참가자에게는 스키 액세서리와 함께, 다음 스키 여행에 활용할 수 있는 다이스키 리조트 할인 쿠폰을 제공합니다.", "N", "https://i.imgur.com/iW6UB0k.jpg"));
			EventList.add(new NoticeVO(0, "ADMIN", "이벤트", "신선한 눈, 신규 스키어를 위한 환영 이벤트!","신규가입 쿠폰 혜택:새로 가입한 회원들에게는 스키장 내 스포츠 용품 상점에서 사용 가능한 할인 쿠폰을 제공합니다. 스키를 처음 시도하시거나 스키장에 처음 방문하시는 분들을 위한 특별한 혜택으로, 훌륭한 스키 첫 경험을 선물해드립니다. 신선한 눈과 함께 즐거운 스키 시즌을 시작하세요!", "N", "https://i.imgur.com/zeNUx3q.jpg"));
			EventList.add(new NoticeVO(0, "ADMIN", "이벤트", "불꽃놀이 페스타, 하늘에 별을 불러오다!","스키장에서는 화려한 불꽃놀이 이벤트를 개최하여 차가운 겨울 밤을 따뜻하고 화려하게 물들입니다. 이 특별한 불꽃놀이 페스타에서는 다양한 활동과 함께 눈 위에서 불꽃놀이를 즐기실 수 있습니다.\r\n"
					+ "\r\n"
					+ "불꽃놀이 쇼:\r\n"
					+ "\r\n"
					+ "하늘을 가득 채우는 아름다운 불꽃놀이 쇼를 즐겨보세요. 다양한 색상과 모양의 불꽃놀이가 스키장을 환상적인 공간으로 변화시킵니다.\r\n"
					+ "불꽃놀이 참여 이벤트:\r\n"
					+ "\r\n"
					+ "참여자들은 불꽃놀이에 참여하여 자체적으로 소형 불꽃놀이를 즐길 수 있는 이벤트도 진행됩니다. 창의적이고 독특한 불꽃놀이로 분위기를 더욱 물들여보세요.\r\n"
					+ "불꽃놀이 후 특별 이벤트:\r\n"
					+ "\r\n"
					+ "불꽃놀이 이후에는 온갖 따뜻한 음료와 간식을 즐길 수 있는 특별 이벤트가 펼쳐집니다. 불꽃놀이의 감동을 나누며 따스한 분위기 속에서 특별한 시간을 보내보세요.\r\n"
					+ "불꽃놀이 음악 페스티벌:\r\n"
					+ "\r\n"
					+ "불꽃놀이와 함께 다양한 음악 퍼포먼스를 즐기실 수 있는 음악 페스티벌도 개최됩니다. 불꽃놀이와 음악이 어우러져 즐거운 밤을 만들어냅니다.\r\n"
					+ "눈 위에서의 불꽃놀이 페스타로 스키장을 환상의 세계로 초대합니다. 함께 따뜻하고 화려한 순간을 만들어보세요!", "N", "https://i.imgur.com/nqc8vgy.jpg"));
			EventList.add(new NoticeVO(0, "ADMIN", "이벤트", "송년 카운트다운 파티!","개최 장소\r\n"
					+ "다이스키4F 파티장\r\n"
					+ "\r\n"
					+ "개최일시\r\n"
					+ "2023/12/31(일)\r\n"
					+ "・회장 오픈 23:00～\r\n"
					+ "・빙고 대회 23:30～\r\n"
					+ "・카운트다운 23:59～\r\n"
					+ "\r\n"
					+ "빙고 카드는 수량 한정으로 사전 판매 !\r\n"
					+ "수량 한정의 음료 한잔 포함 빙고카드를 아래 스케줄로 사전 판매하오니 꼭 구입하시기 바랍니다.\r\n"
					+ "\r\n"
					+ "[판매 시간]\r\n"
					+ "2023/12/31(일)\r\n"
					+ "・16:30～ 150매만 판매\r\n"
					+ "・22:30～ 150매만 판매\r\n"
					+ "\r\n"
					+ "[판매 장소]\r\n"
					+ "사우스윙 1F 크리켓 앞\r\n"
					+ "\r\n"
					+ "[요금]\r\n"
					+ "음료 한잔 포함 빙고카드 1인 1매 : 6000원 (세금포함)\r\n"
					+ "※음료 한잔 포함의 메뉴는 레드와인, 화이트와인, 오렌지쥬스에 한합니다.", "N", "https://i.imgur.com/mBIhqPH.jpg"));
			EventList.add(new NoticeVO(0, "ADMIN", "이벤트", "눈부신 음악의 날, 특별 공연 이벤트!",
					"스키장에서는 특별한 날을 맞아 눈부신 음악의 향연을 선사하는 공연 이벤트를 개최합니다. 이 특별한 날을 함께 즐겨보세요!\r\n"
					+ "\r\n"
					+ "- 공연 일시 및 장소:\r\n"
					+ "  - 날짜: [날짜 입력]\r\n"
					+ "  - 시간: [시간 입력]\r\n"
					+ "  - 장소: 스키장 메인 스테이지\r\n"
					+ "\r\n"
					+ "- 이벤트 내용:\r\n"
					+ "  - 다양한 장르의 음악 공연\r\n"
					+ "  - 실력 있는 아티스트들의 라이브 공연\r\n"
					+ "  - 초청 가수는 추후에 공지될 예정입니다.\r\n"
					+ "  - 음악 이벤트를 더욱 특별하게 만드는 다양한 서프라이즈 이벤트\r\n"
					+ "\r\n"
					+ "- 참여 방법:\r\n"
					+ "  - 해당 날짜에 스키장을 방문하여 무료로 즐길 수 있습니다.\r\n"
					+ "  - 모든 스키어와 비스키어들이 환영합니다.\r\n"
					+ "\r\n"
					+ "눈부신 음악과 함께 스키장에서 특별한 순간을 만들어보세요!", "N", "https://i.imgur.com/8DHUnP5.jpg"));
			for (int i = 0; i < EventList.size(); i++) {
				nsv.addEvent(EventList.get(i));
			}
		}

	}
	
	
	
	
//	@PostMapping("/register")
//	public String noticeRegister(NoticeVO nvo, Model m) {
//		int isOk = nsv.noticeRegister(nvo);
//		log.info(">>>>> notice register >> "+(isOk > 0? "OK" : "Fail"));
//		return "redirect:/notice/list";
//	}

	
//	@GetMapping("/list")
//	public String noticeList(Model m) {
//		List<NoticeVO> list = nsv.noticeList();
//		m.addAttribute("list", list);
//		return "/notice/list";
//	}
	
	
//	@GetMapping("/list")
//	public void noticeList(Model m) {
//		List<NoticeVO> list = nsv.noticeList();
//		m.addAttribute("list", list);	
//	}
	
	
//	@GetMapping({"/detail","/modify"})
//	public void noticeDetail(Model m, @RequestParam("noticeNum")long noticeNum) {
//		NoticeVO nvo = nsv.noticeDetail(noticeNum);
//		m.addAttribute("nvo",nvo);
//	}
	
	
//	@PostMapping("/modify")
//	public String noticeModify(NoticeVO nvo) {
//		int isOk = nsv.noticeModify(nvo);
//		log.info(">>>>> notice modify >> "+(isOk > 0? "OK" : "Fail"));
//		return "redirect:/notice/list";
//	}
	
	
}
