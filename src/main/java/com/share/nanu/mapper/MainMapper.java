package com.share.nanu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.DonationVO;
import com.share.nanu.VO.VmVO;
import com.share.nanu.VO.Vmam;

@Mapper
public interface MainMapper {

	public List<DonationVO> dayMoney();

	public List<DonationVO> weekMoney();

	public List<VmVO> getvm();

	public List<VmVO> getvmcat();

	public List<Vmam> getvmiven();

	public List<VmVO> getoffvm(Vmam vmamvo);

	public void outAmount(String vm_num, String iname);

}
