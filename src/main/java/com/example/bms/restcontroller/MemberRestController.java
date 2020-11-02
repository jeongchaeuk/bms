package com.example.bms.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.bms.entity.Member;
import com.example.bms.repository.MemberRepository;

@RestController
@CrossOrigin("*")
@RequestMapping(value = { "/rest" })
public class MemberRestController {

	@Autowired
	MemberRepository repo;

	// http://localhost:8089/rest/member_userid_check.json?userid=abcd
	@RequestMapping(
			value = { "checkUserId.json" }, 
			method = { RequestMethod.GET, RequestMethod.POST }, 
			produces = { MediaType.APPLICATION_JSON_VALUE }, 
			consumes = { MediaType.ALL_VALUE, MediaType.APPLICATION_JSON_VALUE })
	public Map<String, Object> getMember(@RequestParam(value = "userid", defaultValue = "") String userid) {
		if ("".equals(userid))
			return null;

		int ret = 0;

		Member member = repo.findByUserid(userid);
		if (member != null)
			ret = 1;

		Map<String, Object> map = new HashMap<>();
		map.put("dup", ret);

		return map;
	}

}
