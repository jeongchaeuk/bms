package com.example.bms.repository;

//import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.bms.entity.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long>{
//	Optional<Member> findByUseridAndUserpw(String userid, String userpw);
//	Optional<Member> findByUserid(String userid);
//	Optional<Member> findByUserpw(String userpw);
	
	Member findByUseridAndUserpw(String userid, String userpw);
	Member findByUserid(String userid);
	
}
