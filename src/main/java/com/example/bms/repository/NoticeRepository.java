package com.example.bms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.bms.entity.Notice;

@Repository
public interface NoticeRepository extends JpaRepository<Notice, Long> {
	List<Notice> findByTitleContaining(String search);
}
