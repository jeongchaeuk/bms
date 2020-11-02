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
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bms.entity.Board;
import com.example.bms.mapper.BoardMapper;

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

		System.out.println("board count=" + list.size());
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());

		return "/board/list";
	}

	// 상세 내용 보기
	@GetMapping(value = "/content")
	public String content(HttpServletRequest request, @RequestParam(value = "id", defaultValue = "0") Long id,
			Model model) {
		if (id == 0)
			return "redirect:" + request.getContextPath() + "/board/list";

		mapper.updateHit(id);

		Board item = mapper.getBoard(id);
		model.addAttribute("item", item);

		return "/board/content";
	}

	@GetMapping(value = "/write")
	public String write() {
		return "/board/write";
	}

	@PostMapping(value = "/write")
	public String write(HttpServletRequest request, @ModelAttribute Board board) {
		System.out.println("before write:" + board);
//		repo.save(board);
		mapper.setBoard(board);

		return "redirect:" + request.getContextPath() + "/board/list";
	}

	@PostMapping(value = "/update")
	public String update(HttpServletRequest request, @ModelAttribute Board board) {
		try {
			mapper.updateBoard(board);
			return "redirect:" + request.getContextPath() + "/board/list";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@GetMapping(value = "/delete")
	public String content(HttpServletRequest request, @RequestParam(value = "id", defaultValue = "0") Long id) {
		if (id != 0)
			if (1 != mapper.deleteBoard(id))
				return null;

		return "redirect:" + request.getContextPath() + "/board/list";
	}

}
