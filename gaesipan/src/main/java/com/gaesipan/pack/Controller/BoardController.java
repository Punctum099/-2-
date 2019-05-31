package com.gaesipan.pack.Controller;

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

import com.gaesipan.pack.DTO.BoardDTO;
import com.gaesipan.pack.DTO.Criteria;
import com.gaesipan.pack.DTO.PageMaker;
import com.gaesipan.pack.DTO.bdtoCri;
import com.gaesipan.pack.Service.Service;

@Controller
public class BoardController {
	
	private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
    private Service service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@ModelAttribute("cri") Criteria cri, Model model){
			
        logger.info(cri.toString());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listTotalCount());
		
		if(cri.getOption() != null && cri.getSearch() != null) {
			model.addAttribute("list", service.searchList(cri));
		}else {
			model.addAttribute("list", service.list(cri));
		}
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
			
        logger.info(pageMaker.toString());
		
		return "list";
	}

	@RequestMapping(value = "/NoticeList", method = RequestMethod.GET)
	public String NoticeList(@ModelAttribute("cri") Criteria cri, Model model){
			
        logger.info(cri.toString());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.NoticeListTotalCount());
		
		if(cri.getOption() != null && cri.getSearch() != null) {
			model.addAttribute("list", service.searchNoticeList(cri));
		}else {
			model.addAttribute("list", service.NoticeList(cri));
		}
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
			
        logger.info(pageMaker.toString());
		
		return "NoticeList";
	}

	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(@ModelAttribute("cri") Criteria cri, @RequestParam String seq, Model model){
			
        logger.info(cri.toString());
        logger.info("content seq : " + seq);
		
        service.upHit(seq);
        
        BoardDTO dto = service.content(seq);
        
		model.addAttribute("content", dto);
		if(dto.getListType().equals("Notice")) {
			model.addAttribute("nextPrev", service.NoticeNextPrev(seq));
		}else if(dto.getListType().equals("Normal")){
			model.addAttribute("nextPrev", service.nextPrev(seq));
		}
		model.addAttribute("cri", cri);
		
		return "content";
	}

	@RequestMapping(value = "/write_view", method = RequestMethod.GET)
	public String write_view(@RequestParam String listType, Model model){

		model.addAttribute("listType", listType);
		
		return "write_view";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@RequestBody @ModelAttribute("dto") BoardDTO dto, Model model){

        logger.info("write author : " + dto.getAuthor());
        logger.info("write title : " + dto.getTitle());
        
        service.write(dto);
        
        Criteria cri = new Criteria();
        
        model.addAttribute("content", service.content(dto.getSeq()));
		model.addAttribute("cri", cri);
        
		return "content";
	}

	@RequestMapping(value = "/modify_view", method = RequestMethod.POST)
	public String modify_view(@ModelAttribute("cri") Criteria cri, @RequestParam String seq, Model model){

        logger.info("modify_view seq : " + seq);
        
        //service.modify(dto);
        
        model.addAttribute("content", service.content(seq));
		model.addAttribute("cri", cri);
        
		return "modify_view";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute("dto") BoardDTO dto, @RequestParam int page, @RequestParam int perPageNum, Model model){

        logger.info("modify seq : " + dto.getSeq());
        logger.info("modify author : " + dto.getAuthor());
        
        Criteria cri = new Criteria();
        cri.setPage(page);
        cri.setPerPageNum(perPageNum);
        
        service.modify(dto);
        model.addAttribute("content", service.content(dto.getSeq()));
		model.addAttribute("cri", cri);
        
		return "content";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@RequestBody @ModelAttribute("bdtoCri") bdtoCri bdtoCri, Model model){

        logger.info("delete seq : " + bdtoCri.getSeq());
        
        service.delete(bdtoCri);
        
        Criteria cri = new Criteria();

        cri.setPage(bdtoCri.getPage());
        cri.setPerPageNum(bdtoCri.getPerPageNum());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listTotalCount());

		model.addAttribute("list", service.list(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
        
		return "list";
	}

	@RequestMapping(value = "/applyMTtime", method = RequestMethod.POST)
	public String applyMTtime(@RequestBody @ModelAttribute("bdtoCri") bdtoCri bdtoCri, Model model){

		String seq = bdtoCri.getSeq();
		String see = bdtoCri.getSee();
		String arrSeq[] = seq.split(",");
		String arrSee[] = see.split(",");
        
        bdtoCri[] dto = new bdtoCri[(see.length() + 1)/2];
        logger.info("apply size : " + dto.length);
        logger.info("apply seq : " + seq);
        logger.info("apply see : " + see);
        
        for(int i = 0; i < dto.length; i++) {
        	dto[i] = new bdtoCri();
        	dto[i].setSeq(arrSeq[i]);
        	dto[i].setSee(arrSee[i]);
            service.applyMTtime(dto[i]);
        }
        
        Criteria cri = new Criteria();

        cri.setPage(bdtoCri.getPage());
        cri.setPerPageNum(bdtoCri.getPerPageNum());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.NoticeListTotalCount());

		model.addAttribute("list", service.NoticeList(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
        
		return "NoticeList";
	}
	
}