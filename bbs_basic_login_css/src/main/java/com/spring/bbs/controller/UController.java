package com.spring.bbs.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bbs.dao.UDao;
import com.spring.bbs.dto.UDto;

@Controller
public class UController {
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(UController.class);
	
	@RequestMapping(value="/loginForm")
	public String loginForm() {
		logger.info("loginForm()");
		return "login";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request) {
		logger.info("login()");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UDao dao = sqlSession.getMapper(UDao.class);
		String pwChk = dao.login(id);
		
		HttpSession session = request.getSession();
		
		if (pwChk != null) {
			if(pw.equals(pwChk)) { 
				session.setAttribute("id", id);
				session.setAttribute("msgType", "성공");
				session.setAttribute("msgContent", "로그인에 성공하셨습니다.");
				
				return "redirect:list";
			} else {
				session.setAttribute("msgType", "실패");
				session.setAttribute("msgContent", "비밀번호가 일치하지 않습니다.");
				
				return "redirect:loginForm";
			}
		} else {
			session.setAttribute("msgType", "실패");
			session.setAttribute("msgContent", "아이디가 존재하지 않습니다.");
			
			return "redirect:loginForm";
		}
	}
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request) {
		logger.info("logout()");
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:list";
	}
	@RequestMapping(value="/joinForm")
	public String joinForm() {
		logger.info("joinForm()");
		return "join";
	}
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(@ModelAttribute("dto") UDto dto) {
		logger.info("join()");
		UDao dao = sqlSession.getMapper(UDao.class);
		dao.join(dto);
		
		return "redirect:list";
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	public int idCheck(HttpServletRequest request) {
		logger.info("idCheck()");
		
		String id = request.getParameter("id");
		UDao dao = sqlSession.getMapper(UDao.class);
		int result = dao.idCheck(id);

		
		return result;
	}
}
