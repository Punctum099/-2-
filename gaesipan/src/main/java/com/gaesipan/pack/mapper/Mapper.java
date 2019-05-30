package com.gaesipan.pack.mapper;

import java.util.List;

import com.gaesipan.pack.DTO.Criteria;
import com.gaesipan.pack.DTO.bDTO;
import com.gaesipan.pack.DTO.bdtoCri;

public interface Mapper {
	
	public List<bDTO> list(Criteria cri);

	public List<bDTO> searchList(Criteria cri);
	
	public List<bDTO> NoticeList(Criteria cri);

	public List<bDTO> searchNoticeList(Criteria cri);
	
	public int listTotalCount();
	
	public int NoticeListTotalCount();
	
	public bDTO content(String seq);
	
	public void upHit(String seq);
	
	public void write(bDTO dto);
	
	public void modify(bDTO dto);
	
	public void delete(bdtoCri bdtoCri);

	public List<bDTO> nextPrev(String seq);

	public List<bDTO> NoticeNextPrev(String seq);

	public void applyMTtime(bdtoCri bdtoCri);
	
}
