package com.gaesipan.pack.Controller;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gaesipan.pack.DTO.CommentDTO;
import com.gaesipan.pack.DTO.Criteria;
import com.gaesipan.pack.DTO.PageMaker;
import com.gaesipan.pack.DTO.bdtoCri;
import com.gaesipan.pack.mapper.Mapper;

@Controller
public class CommentController {

	private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
    private Mapper mapper;

	@RequestMapping(value = "/normal/commentWrite", method = RequestMethod.POST)
	public String write(@RequestBody @ModelAttribute("dto") CommentDTO dto, Model model) throws IOException{
		
        logger.info("comment board_seq : " + dto.getBoard_seq());
        logger.info("comment group_seq : " + dto.getgroup_seq());
        logger.info("comment level : " + dto.getLevel());
        logger.info("comment contents : " + dto.getContents());
        logger.info("comment author : " + dto.getAuthor());
        
        mapper.commentWrite(dto);
        
        model.addAttribute("content", mapper.content(dto.getBoard_seq()));
        
        Criteria cri = new Criteria();
        
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(mapper.listTotalCount());
		
		if(cri.getOption() != null && cri.getSearch() != null) {
			model.addAttribute("list", mapper.searchList(cri));
		}else {
			model.addAttribute("list", mapper.list(cri));
		}
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
        
		return "list";
	}

	@RequestMapping(value = "/normal/commentDelete", method = RequestMethod.GET)
	public String commentDelete(@RequestParam String seq, Model model) throws IOException{

        logger.info("commentDelete seq : " + seq);
        
        mapper.commentDelete(seq);
        
        Criteria cri = new Criteria();
        
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(mapper.listTotalCount());
		
		if(cri.getOption() != null && cri.getSearch() != null) {
			model.addAttribute("list", mapper.searchList(cri));
		}else {
			model.addAttribute("list", mapper.list(cri));
		}
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
        
		return "list";
	}
}
