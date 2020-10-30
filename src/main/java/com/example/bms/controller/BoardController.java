package com.example.bms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.bms.entity.Board;
import com.example.bms.mapper.BoardMapper;
//import com.example.bms.repository.BoardRepository;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
//	@Autowired
//	BoardRepository repo;
	
	@Autowired
	BoardMapper mapper;
	
	@GetMapping(value = "/list")
	public String list(Model model) {
//		List<Board> list = repo.findAll();
		List<Board> list = mapper.getList();
		
		Board test = list.get(0);
		System.out.println(test);
		
		System.out.println("board count="+list.size());
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		
		return "/board/list";
	}
	
	@GetMapping(value="/write")
	public String write() {
		return "/board/write";
	}
	
	@PostMapping(value="/write")
	public String write(HttpServletRequest request, @ModelAttribute Board board) {
		System.out.println("before write:"+board);
//		repo.save(board);
		mapper.setBoard(board);
		
		return "redirect:"+ request.getContextPath() +"/board/list";
	}
}
