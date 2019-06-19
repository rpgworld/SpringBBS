package com.spring.bbs.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bbs.dao.BDao;

@Controller
public class BController {
	
	public static final int WRITING_PER_PAGE = 10;
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(BController.class);
	
	@RequestMapping(value="/list")
	public String list(HttpServletRequest request, Model model) {
		logger.info("list()");
		
		BDao dao= sqlSession.getMapper(BDao.class);
		
		int curPage = 1;
		if (request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		int start = WRITING_PER_PAGE * (curPage - 1) + 1;
		int end = WRITING_PER_PAGE * curPage;
		model.addAttribute("list", dao.list(start, end));
		
		
		int pageCnt = (dao.pageCnt() - 1) / WRITING_PER_PAGE + 1;
		model.addAttribute("pageCnt", pageCnt);
		
		return "list";
	}
	@RequestMapping(value="/writeForm")
	public String writeForm() {
		logger.info("writeForm()");

		return "write";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String write(HttpServletRequest request, Model model) {
		logger.info("write()");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BDao dao= sqlSession.getMapper(BDao.class);
		dao.write(name, title, content);
		
		return "redirect:list";
	}
	
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public String read(HttpServletRequest request, Model model) {
		logger.info("read()");
		
		String num = request.getParameter("num");
		
		BDao dao = sqlSession.getMapper(BDao.class);
		dao.updateCnt(num);
		model.addAttribute("dto", dao.read(num));
		
		return "read";
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request) {
		logger.info("delete()");
		
		String num = request.getParameter("num");
		
		BDao dao= sqlSession.getMapper(BDao.class);
		dao.delete(num);
		
		return "redirect:list";
	}
	
}