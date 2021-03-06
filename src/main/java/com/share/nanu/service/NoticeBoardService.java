package com.share.nanu.service;

import java.util.List;

import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.paging.Criteria;

public interface NoticeBoardService {
		
		// 기본 리스트,페이징
		public List<BoardVO> getlist(); // 인증게시판 리스트 불러오기
		public List<BoardVO> getlist(Criteria cri); // 인증게시판 페이징 리스트 
		public int getTotal(Criteria cri); // 게시글 수 count
		
		// 콘텐트뷰
		public BoardVO getBoard(int b_index); // content view, modify view
		public void uphit(BoardVO boardVO); // 조회수
		
		// 글 삭제
		public void deleteBoard(int b_index);
				
		
		// 글쓰기 - 디비 저장
		public void writeBoard(BoardVO boardVO); // 글 비 저장
			
		//글수정
		public void writeInsert(BoardVO boardVO);
		
		//이미지 첨부
		public void fileUpload(AttachmentVO attachmentVO);
		
		//게시판 글번호 가져오기
		public int getBindex(BoardVO boardVO);
		
		// aside에 뿌려줄 최신 공지사항
		public List<BoardVO> asideNlist();
		
		
		
		
}
