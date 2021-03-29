// 혜선_ 물품기부 서비스 작성 03.18

package com.share.nanu.service;

import java.util.List;

import com.share.nanu.VO.ItemdonationVO;
import com.share.nanu.VO.MemberPointVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.PointVO;

public interface NanuDonationService {
	
	/* 물품 기부 */
	public MemberVO getMember(String member_id); // 물품신청서 회원 정보 불러오기
	public void saveForm(ItemdonationVO idvo); // 물품신청서 -> 테이블에 저장
	public void countItemDonation(MemberVO mvo); // 멤버 테이블에 -> 물품기부횟수 카운트 +1
	
	/* 포인트 기부 */
	public List<MemberPointVO> getMemberPoint(MemberPointVO mvo); // 포인트 나눔 페이지 (포인트+멤버 테이블 조인_ resultMap: point + member) // 포인트정보불러오기
	public void countPointDonation(MemberVO mvo); // 멤버 테이블에 -> 포인트(후원) 기부횟수 카운트 +1
	public void donatePoint(PointVO pvo);// 포인트 테이블에 포인트 기부내역 업데이트

	
}