package com.example.bms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.bms.entity.Board;

@Repository
public interface BoardRepository extends JpaRepository<Board, Long> {
	List<Board> findAll();
}
