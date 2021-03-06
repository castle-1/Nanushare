package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.share.nanu.service.NoticeBoardService;
import com.share.nanu.controller.NoticeBoardController;
import com.share.nanu.paging.Criteria;
import com.share.nanu.paging.PageVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.VO.BoardVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService ntService;

	// 공지사항 리스트
	@GetMapping("/board/notice")
	public String noticeBoardPaging(Criteria cri, Model model, @AuthenticationPrincipal MemberDetails md)
			throws Exception {
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			model.addAttribute("username", md.getmember().getName());
		}

		model.addAttribute("list", ntService.getlist(cri));

		int total = ntService.getTotal(cri);
		model.addAttribute("pageMaker", new PageVO(cri, total));

		return "noticeBoard/notice_list";
	}

	// 컨텐트뷰
	@GetMapping("/board/notice/{b_index}")
	public String boardShowContent(BoardVO boardVO, Model model, @AuthenticationPrincipal MemberDetails md)
			throws Exception {

		if (md != null) { 
			model.addAttribute("username", md.getmember().getName());
		}

		ntService.uphit(boardVO);
		model.addAttribute("content_view", ntService.getBoard(boardVO.getB_index()));

		return "noticeBoard/content_view";
	}

	//수정뷰	
	@GetMapping("/board/notice/modify/{b_index}")
	public 	String bsModi(BoardVO boardVO, Model model, @AuthenticationPrincipal MemberDetails md){
		if (md != null) { 
			model.addAttribute("username", md.getmember().getName());
		}
		
		model.addAttribute("modify_view", ntService.getBoard(boardVO.getB_index()));

		boardVO.setMember_id(md.getUsername());
		
		return "noticeBoard/modify_view";
	}
	
	//수정
	@PostMapping("/board/notice/modify")
	public String bsModiview(BoardVO boardVO, Model model, @AuthenticationPrincipal MemberDetails md) {
		System.out.println("공지 게시판 수정");
		if (md != null) { 
			model.addAttribute("username", md.getmember().getName());
		}
		 ntService.writeInsert(boardVO);
		return "redirect:/board/notice";
	}
	
	// 글 삭제
	@GetMapping("/board/notice/delete/{b_index}")
	public String noticeDelete(BoardVO boardVO) throws Exception {
		log.info("공지 게시판 delete");
		ntService.deleteBoard(boardVO.getB_index());
		return "redirect:/board/notice";
	}

	
	// 글작성뷰
	@GetMapping("/board/notice/write_view")
	public String noticeWrite_view(Model model, @AuthenticationPrincipal MemberDetails md) {
		log.info("공지게시판 write_view");
		return "noticeBoard/write_view";
	}
	
	// 글작성
	@PostMapping("/board/notice/write")
	public String noticeWrite(BoardVO boardVO, Model model, @AuthenticationPrincipal MemberDetails md) {

		if (md != null) { 
			model.addAttribute("username", md.getmember().getName());
		}
		
		boardVO.setMember_id(md.getUsername());
		ntService.writeBoard(boardVO);
		log.info("공지게시판 write_view");
		
		return "redirect:";
	}
}
