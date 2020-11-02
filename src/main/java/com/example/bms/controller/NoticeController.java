package com.example.bms.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bms.entity.Notice;
import com.example.bms.repository.NoticeRepository;

@Controller
@RequestMapping(value = { "/notice" })
public class NoticeController {

	@Autowired
	NoticeRepository repo;

	@GetMapping(value = { "/list" })
	public String list(Model model) {
		System.out.println("notice-list-get");

		List<Notice> list = repo.findAll();

		model.addAttribute("list", list);
		model.addAttribute("count", list.size());

		return "/notice/list";
	}
	
	@PostMapping(value = { "/list" })
	public String list(HttpServletRequest request ,@RequestParam(value = "search", defaultValue = "") String search ,Model model) {
		System.out.println("notice-list-post");
		if ("".equals(search))
			return "redirect:"+request.getContextPath()+"/notice/list";
		
		List<Notice> list = repo.findByTitleContaining(search);
		
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		
		return "/notice/list";
	}

	@GetMapping(value = { "/write" })
	public String write() {
		System.out.println("notice-write-get");
		return "/notice/write";
	}

	@PostMapping(value = { "/write" })
	public String write(HttpServletRequest request, @ModelAttribute Notice notice) {
		System.out.println("notice-write-post");
		System.out.println(notice);
		
		notice.setCreatedAt(Timestamp.valueOf(LocalDateTime.now())).setModifiedAt(Timestamp.valueOf(LocalDateTime.now()));
		
		repo.save(notice);

		return "redirect:" + request.getContextPath() + "/notice/list";
	}

	@GetMapping(value = { "/content" })
	public String content(HttpServletRequest request, 
			@RequestParam(value = "id", defaultValue = "0") Long id, Model model) {
		System.out.println("notice-content-get");

		if (id != 0) {
			Optional<Notice> notice = repo.findById(id);
			if (notice.isPresent()) {
				System.out.println(notice.get());
				
				model.addAttribute("notice", notice.get());
				return "/notice/content";
			}
		}

		return "redirect:" + request.getContextPath() + "/notice/list";
	}
	
	@PostMapping(value = { "/content" })
	public String content(HttpServletRequest request, @ModelAttribute Notice notice) {
		System.out.println("notice-content-post");
		System.out.println(notice);
		
		notice.setModifiedAt(Timestamp.valueOf(LocalDateTime.now()));
		
		System.out.println(notice);
		
		repo.save(notice);

		return "redirect:" + request.getContextPath() + "/notice/list";
	}
	

}
