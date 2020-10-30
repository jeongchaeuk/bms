package com.example.bms.controller;

import java.time.LocalDateTime;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bms.entity.Member;
import com.example.bms.repository.MemberRepository;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	MemberRepository repo;

	@RequestMapping(value = "/join", method=RequestMethod.GET)
	public String join() {
		return "join";
	}
	
	@RequestMapping(value = "/join", method=RequestMethod.POST)
	public String join(HttpServletRequest request, @ModelAttribute Member member) {
		System.out.println(member);
		member.setCreatedAt(LocalDateTime.now()).setCreatedBy("SYSTEM");
		System.out.println(member);
		
		Member savedMember = repo.save(member);
		System.out.println(savedMember);
		
		if (savedMember == null)
			return "redirect:"+ request.getContextPath() +"/member/join";
		
		return "redirect:"+ request.getContextPath() +"/member/login";	
	}
	
	@GetMapping(value="/login")
	public String login() {
		return "login";
	}
	
	@PostMapping(value="/login")
	public String login(HttpServletRequest request, HttpSession session, @ModelAttribute Member member) {
		System.out.println("login-POST");
		Member foundMember = repo.findByUserid(member.getUserid());
		if (foundMember == null || !foundMember.getUserpw().equals(member.getUserpw())) {
			System.out.println("[ERROR] No member :" + member);
			return "redirect:"+ request.getContextPath() +"/member/login";
		}
		
		System.out.println(foundMember);
		session.setAttribute("USERID_SESSION", foundMember.getUserid());
		return "redirect:"+ request.getContextPath() +"/home";
		
//		Optional<Member> foundMember = repo.findByUseridAndUserpw(member.getUserid(), member.getUserpw());
//		if (!foundMember.isPresent()) {
//			System.out.println("ERROR : no member :" + member);
//			return "redirect:"+ request.getContextPath() +"/member/login";
//		}
//		
//		System.out.println(foundMember.get());
//		session.setAttribute("USERID_SESSION", foundMember.get().getUserid());
//		return "redirect:"+ request.getContextPath() +"/home";
	}
	
	@GetMapping(value="/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:"+ request.getContextPath() +"/home";
	}
	
}
