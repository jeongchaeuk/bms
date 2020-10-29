package com.example.bms.controller;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.bms.entity.Member;
import com.example.bms.repository.MemberRepository;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	MemberRepository repo;

	@RequestMapping(value = "/join", method=RequestMethod.GET)
	public String join() {
		System.out.println("JOIN Page - GET");
		return "join";
	}
	
	@RequestMapping(value = "/join", method=RequestMethod.POST)
	public String join(HttpServletRequest request, @ModelAttribute Member member) {
		member.setCreatedAt(LocalDateTime.now());
		member.setCreatedBy("SYSTEM");
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
	public String login(HttpServletRequest request) {
		return "redirect:"+ request.getContextPath() +"/board/home";
	}
	
}
