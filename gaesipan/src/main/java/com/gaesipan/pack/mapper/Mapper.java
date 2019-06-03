package com.gaesipan.pack.mapper;

import java.util.List;

import com.gaesipan.pack.DTO.Criteria;
import com.gaesipan.pack.DTO.LoginVO;
import com.gaesipan.pack.DTO.BoardDTO;
import com.gaesipan.pack.DTO.bdtoCri;
import com.gaesipan.pack.DTO.UserDTO;

public interface Mapper {
	
	public List<BoardDTO> list(Criteria cri);

	public List<BoardDTO> searchList(Criteria cri);
	
	public List<BoardDTO> NoticeList(Criteria cri);

	public List<BoardDTO> searchNoticeList(Criteria cri);
	
	public int listTotalCount();
	
	public int NoticeListTotalCount();
	
	public BoardDTO content(String seq);
	
	public void upHit(String seq);
	
	public void write(BoardDTO dto);
	
	public void modify(BoardDTO dto);
	
	public void delete(bdtoCri bdtoCri);

	public List<BoardDTO> nextPrev(String seq);

	public List<BoardDTO> NoticeNextPrev(String seq);

	public void applyMTtime(bdtoCri bdtoCri);

	public UserDTO authenticate(LoginVO loginVO);
	
}
