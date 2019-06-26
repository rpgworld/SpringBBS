package com.spring.bbs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bbs.PageMaker;
import com.spring.bbs.dao.BDao;

@Controller
public class BController {
	
	public static final int WRITING_PER_PAGE = 10;
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(BController.class);
	
	// �Խñ� ���
	@RequestMapping(value="/list")
	public String list(HttpServletRequest request, Model model) {
		logger.info("list()");
		
		BDao dao= sqlSession.getMapper(BDao.class);
		
		int curPage = 1;
		if (request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		/*int startPage = 0;
		if(curPage >= 10 && curPage % 10 == 0) {
			startPage = curPage - 9;
		} else {
			startPage = (curPage / 10) * 10 + 1;
		}
		int endPage = startPage + 9;
		
		int start = WRITING_PER_PAGE * (curPage - 1) + 1;
		int end = WRITING_PER_PAGE * curPage;
		model.addAttribute("list", dao.list(start, end));
		
		int pageCnt = (dao.bbsCnt() - 1) / WRITING_PER_PAGE + 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("curPage", curPage);*/
		
		PageMaker pageMaker = new PageMaker(curPage, dao.bbsCnt());
		model.addAttribute("list", dao.list(pageMaker.getStartIndex(), pageMaker.getEndIndex()));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("curPage", curPage);
		
		return "list";
	}
	
	// �۾�����
	@RequestMapping(value="/writeForm")
	public String writeForm(HttpServletRequest request) {
		logger.info("writeForm()");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("id") == null) {
			session.setAttribute("msgType", "���â");
			session.setAttribute("msgContent", "�α����� �ʿ��մϴ�.");
			return "redirect:loginForm";
		}
		return "write";
	}
	
	// �۾���
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String write(HttpServletRequest request, Model model) {
		logger.info("write()");
		
		String name = null;
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null) {
			name = (String) session.getAttribute("id");
		}
		
		BDao dao= sqlSession.getMapper(BDao.class);
		dao.write(name, title, content);
		
		return "redirect:list";
	}
	
	// ���б�
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public String read(HttpServletRequest request, Model model) {
		logger.info("read()");
		
		String num = request.getParameter("num");
		
		BDao dao = sqlSession.getMapper(BDao.class);
		dao.updateCntUp(num);
		model.addAttribute("dto", dao.read(num));
		
		return "read";
	}
	
	// �ۻ���
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request) {
		logger.info("delete()");
		
		String id = null;
		String num = request.getParameter("num");
		String name = request.getParameter("name");
		String ref = request.getParameter("ref");
		String step = request.getParameter("step");
		String lev = request.getParameter("lev");
		
		BDao dao = sqlSession.getMapper(BDao.class);
		
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			session.setAttribute("msgType", "���â");
			session.setAttribute("msgContent", "�α����� �ʿ��մϴ�.");
			return "redirect:loginForm";
		} else {
			id = (String) session.getAttribute("id");
			if(!name.equals(id)) {
				session.setAttribute("msgType", "���â");
				session.setAttribute("msgContent", "���� ������ �����ϴ�.");
				return "redirect:list";
			}
			
			int replyChk = dao.replyCheck(num);
			if (replyChk > 0) {
				session.setAttribute("msgType", "���â");
				session.setAttribute("msgContent", "����� �־� ������ �Ұ����մϴ�.");
				return "redirect:list";
			} else {
				dao.delete(num);
				for(int updateLev = Integer.parseInt(lev) - 1; updateLev >= 0; updateLev--) {
					dao.deleteReplyCntUpdate(ref, step, updateLev);
				}	
			}
			
			return "redirect:list";
		}
	}
	
	// �ۼ�����
	@RequestMapping(value="/updateForm", method = RequestMethod.GET)
	public String updateForm(HttpServletRequest request, Model model) {
		logger.info("updateForm()");
		
		String id = null;
		String num = request.getParameter("num");
		String name = request.getParameter("name");
		HttpSession session = request.getSession();
		if(session.getAttribute("id") == null) {
			session.setAttribute("msgType", "���â");
			session.setAttribute("msgContent", "�α����� �ʿ��մϴ�.");
			return "redirect:loginForm";
		} else {
			id = (String) session.getAttribute("id");
			if(!name.equals(id)) {
				session.setAttribute("msgType", "���â");
				session.setAttribute("msgContent", "���� ������ �����ϴ�.");
				return "redirect:list";
			}
			BDao dao= sqlSession.getMapper(BDao.class);
			model.addAttribute("dto", dao.read(num));
			
			return "update";
		}
	}
	
	// �ۼ���
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request) {
		logger.info("update()");
		
		String num = request.getParameter("num");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BDao dao = sqlSession.getMapper(BDao.class);
		dao.update(title, content, num);
		
		return "redirect:list";
	}
	
	// �˻�
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String search(HttpServletRequest request, Model model) {
		logger.info("search()");
		
		String searchOption = "title";
		String searchWord = request.getParameter("searchWord");
		
		BDao dao= sqlSession.getMapper(BDao.class);
		
		int curPage = 1;
		if (request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		
		/*int start = WRITING_PER_PAGE * (curPage - 1) + 1;
		int end = WRITING_PER_PAGE * curPage;
		model.addAttribute("list", dao.search(searchOption, searchWord, start, end));
		
		
		int pageCnt = (dao.bbsCnt() - 1) / WRITING_PER_PAGE + 1;
		model.addAttribute("pageCnt", pageCnt);*/
		
		PageMaker pageMaker = new PageMaker(curPage, dao.searchCnt(searchOption, searchWord));
		model.addAttribute("list", dao.search(searchOption, searchWord, pageMaker.getStartIndex(), pageMaker.getEndIndex()));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("curPage", curPage);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchWord", searchWord);
		
		System.out.println("�����°�:" + searchWord);
		
		return "searchList";
	}
	
	// ��� ��
	@RequestMapping(value="/replyForm", method = RequestMethod.GET)
	public String replyForm(HttpServletRequest request, Model model) {
		logger.info("replyForm()");
		
		String num = request.getParameter("num");
		HttpSession session = request.getSession();
		if(session.getAttribute("id") == null) {
			session.setAttribute("msgType", "���â");
			session.setAttribute("msgContent", "�α����� �ʿ��մϴ�.");
			return "redirect:loginForm";
		} else {
			BDao dao= sqlSession.getMapper(BDao.class);
			model.addAttribute("dto", dao.read(num));
		
			return "reply";
		}
	}
	
	// ��۾���
	@RequestMapping(value="/reply", method = RequestMethod.GET)
	public String reply(HttpServletRequest request) {
		logger.info("reply()");
		
		String name = null;
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null) {
			name = (String) session.getAttribute("id");
		}
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String ref = request.getParameter("ref");
		String step = request.getParameter("step");
		String lev = request.getParameter("lev");
		
		BDao dao = sqlSession.getMapper(BDao.class);
		
		int replyStep = dao.replySearchStep(ref, step, lev);
		if (replyStep > 0) {
			dao.replyStepUp(ref, replyStep);
		} else {
			replyStep = dao.replyMaxStep(ref);
		}
		dao.reply(name, title, content, ref, replyStep, lev);
		
		for(int updateLev = Integer.parseInt(lev); updateLev >= 0; updateLev--) {
			dao.replyCntUpdate(ref, replyStep, updateLev);
		}
		
		return "redirect:list";
	}
	
}
