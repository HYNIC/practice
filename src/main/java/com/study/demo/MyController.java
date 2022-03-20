package com.study.demo;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.demo.dao.IBbsDao;
import com.study.demo.dao.IMemberDao;
import com.study.demo.dao.IReplyDao;
import com.study.demo.dto.MemberDto;;
@Controller
public class MyController {
	
	@Autowired
	IMemberDao mdao;
	
	@Autowired
	IBbsDao bdao;
	
	@Autowired
	IReplyDao rdao;
	
	
	@RequestMapping("/")
	public String root(Model model) {
		return "redirect:loginForm";
	}
 	
	@RequestMapping("/registForm")
	public String regiForm() {
		return "registForm";
	}
	
	@RequestMapping("/checkId")
	public @ResponseBody int checkId(HttpServletRequest request) {
		String id = request.getParameter("id");
		int result = mdao.checkId(id);
		return result;
	}
	
	@RequestMapping("/regist")
	public String regist(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		mdao.registMember(id, pw, name);
		
		return "redirect:loginForm";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		int result = mdao.checkPw(id, pw);
		
		if (result == 1) {
			session.setAttribute("loginUser", mdao.getMember(id));
			return "redirect:board";
		} else {
			return "redirect:loginForm";
		}		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm";
	}
	
	@RequestMapping("/board")
	public String memberBoard(Model model, HttpServletRequest request) {
		int page = 0;
		
		// 페이지 번호
		String page_ = request.getParameter("page");
		if (page_ == null || page_.length() == 0) {
			page = 1;
		} else {
			page = Integer.parseInt(page_);
		}
		
		// 마지막 페이지
		int lastPageNum = 0;
		int page_result = bdao.countRows() % 10;
		if (page_result == 0) {
			lastPageNum = bdao.countRows() / 10;
		} else {
			lastPageNum = (bdao.countRows() / 10) + 1;
		}
		
		System.out.println(bdao.countRows());
		System.out.println(lastPageNum);
		//System.out.println(bdao.listDao(page).get(0).getTitle());
		model.addAttribute("list", bdao.listDao(page));
		model.addAttribute("pageNum", page);
		model.addAttribute("lastPage", lastPageNum);
		
		
		return "board";
	}
	
	@RequestMapping("/writeForm")
	public String writeForm(HttpSession session) {
		if (session.getAttribute("loginUser") != null) {
			return "writeForm";
		} else {
			return "loginForm";
		}
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, HttpSession session) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		MemberDto member = (MemberDto)session.getAttribute("loginUser");
		String writer = member.getName();
		String regdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		bdao.writeDao(title, writer, content, regdate);
		
		return "redirect:board";
	}
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));		
		model.addAttribute("bbsDto", bdao.viewDao(num));
		model.addAttribute("replyDto", rdao.listDao(num));
		
		return "view";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));		
		model.addAttribute("bbsDto", bdao.viewDao(num));
		return "updateForm";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int num = Integer.parseInt(request.getParameter("num"));
		bdao.updateDao(title, content, num);
		
		return "redirect:board";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		bdao.deleteDao(num);
		
		return "redirect:board";
	}
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request, Model model) {
		String searchOption = request.getParameter("search_opt");
		String keyword = request.getParameter("search_keyword");
		
		model.addAttribute("searchList", bdao.searchDao(searchOption, keyword));

		return "board";
	}
	
	// 댓글등록
	@RequestMapping("/insertReply")
	public String insertReply(HttpServletRequest request, HttpSession session) {
		
		int bbs_num = Integer.parseInt(request.getParameter("bbs_num")); 
		String comments = request.getParameter("comments");
		
		MemberDto member = (MemberDto)session.getAttribute("loginUser");
		String writer = member.getName();
		rdao.insertDao(bbs_num, comments, writer);
		bdao.replyCountDao(bbs_num);
		
		return "redirect:view?num=" + bbs_num;
	}
	
	
	
	
}
