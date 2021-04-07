package com.share.nanu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.mapper.MyPageMapper;
import com.share.nanu.mapper.NanuMapper;
import com.share.nanu.page.Criteria;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper mgmapper;

	@Autowired
	private NanuMapper nmapper;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// 마이페이지-나의문의
	@Override
	public List<MemberVO> myList1() {
		return mgmapper.mygetlist1();
	}

	@Override
	public List<MemberVO> myList1(Criteria cri) {
		return mgmapper.getPaging1(cri);
	}

	@Override
	public int getTotalCount1(Criteria cri) {
		return mgmapper.getTotalCnt1(cri);
	}

	// 마이페이지-나의인증
	@Override
	public List<MemberVO> myList2() {
		return mgmapper.mygetlist2();
	}

	@Override
	public List<MemberVO> myList2(Criteria cri) {
		return mgmapper.getPaging2(cri);
	}

	@Override
	public int getTotalCount2(Criteria cri) {
		return mgmapper.getTotalCnt2(cri);
	}

	// 마이페이지-나의나눔
	@Override
	public List<IteminvenVO> myList3() {
		return mgmapper.mygetlist3();
	}

	@Override
	public List<IteminvenVO> myList3(Criteria cri) {
		return mgmapper.getPaging3(cri);
	}

	@Override
	public int getTotalCount3(Criteria cri) {
		return mgmapper.getTotalCnt3(cri);
	}

	// 마이페이지-나의댓글
	@Override
	public List<BoardreplyVO> myList4() {

		return mgmapper.mygetlist4();
	}

	@Override
	public List<BoardreplyVO> myList4(Criteria cri) {

		return mgmapper.getPaging4(cri);
	}

	@Override
	public int getTotalCount4(Criteria cri) {

		return mgmapper.getTotalCnt4(cri);
	}

	//회원수정
	@Override
	public void memberModifyPOST(MemberVO mvo) {

		MemberVO member = nmapper.getMember(mvo.getMember_id());
		if (mvo.getMember_id() != null) {
			member.setMember_id(mvo.getMember_id());
		}
		
		if (mvo.getName() != null) {
			member.setName(mvo.getName());
		}
		if (mvo.getSubemail() != null) {
			member.setSubemail(mvo.getSubemail());
		}
		if (mvo.getPw() != null) {
			member.setPw(bCryptPasswordEncoder.encode(mvo.getPw()));
		}

		mgmapper.memberModify(member);
	}
	

	// 회원탈퇴페이지
	@Override
	public MemberVO memberDelete(MemberVO mvo) {
		mvo = nmapper.getMember(mvo.getMember_id());
		return mgmapper.memberDelete(mvo);
	}

	
}
