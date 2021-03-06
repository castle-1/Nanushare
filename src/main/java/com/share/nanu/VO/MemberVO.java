package com.share.nanu.VO;

import java.sql.Date;
import java.util.List;

import lombok.ToString;

@ToString
public class MemberVO {

	private String member_id; // 아이디
	private String pw; // 비밀번호
	private String name; // 이름
	private String gender; // 성별
	private Date birth; // 생일
	private String signuppath; // 가입경로
	private int pntnum; // 포인트번호
	private String authname; // 등급이름
	private String bklist; // 블랙리스트
	private int dntcnt; // 후원금기부횟수
	private int itemdntcnt; // 물품기부횟수
	private String phone; // 핸드폰번호
	private char enable;// 스프링 시큐리티
	private List<AuthVO> authList; // 권한 리스트
	private String subemail;

	public MemberVO() {
		super();
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getSignuppath() {
		return signuppath;
	}

	public void setSignuppath(String signuppath) {
		this.signuppath = signuppath;
	}

	public int getPntnum() {
		return pntnum;
	}

	public void setPntnum(int pntnum) {
		this.pntnum = pntnum;
	}

	public String getAuthname() {
		return authname;
	}

	public void setAuthname(String authname) {
		this.authname = authname;
	}

	public String getBklist() {
		return bklist;
	}

	public void setBklist(String bklist) {
		this.bklist = bklist;
	}

	public int getDntcnt() {
		return dntcnt;
	}

	public void setDntcnt(int dntcnt) {
		this.dntcnt = dntcnt;
	}

	public int getItemdntcnt() {
		return itemdntcnt;
	}

	public void setItemdntcnt(int itemdntcnt) {
		this.itemdntcnt = itemdntcnt;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public char getEnable() {
		return enable;
	}

	public void setEnable(char enable) {
		this.enable = enable;
	}

	public List<AuthVO> getAuthList() {
		return authList;
	}

	public void setAuthList(List<AuthVO> authList) {
		this.authList = authList;
	}

	public String getSubemail() {
		return subemail;
	}

	public void setSubemail(String subemail) {
		this.subemail = subemail;
	}

	public MemberVO(String member_id, String pw, String name, String gender, Date birth, String signuppath, int pntnum,
			String authname, String bklist, int dntcnt, int itemdntcnt, String phone, char enable,
			List<AuthVO> authList, String subemail) {
		super();
		this.member_id = member_id;
		this.pw = pw;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.signuppath = signuppath;
		this.pntnum = pntnum;
		this.authname = authname;
		this.bklist = bklist;
		this.dntcnt = dntcnt;
		this.itemdntcnt = itemdntcnt;
		this.phone = phone;
		this.enable = enable;
		this.authList = authList;
		this.subemail = subemail;
	}

	

}