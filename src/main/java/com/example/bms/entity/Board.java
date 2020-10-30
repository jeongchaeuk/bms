package com.example.bms.entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@Entity
public class Board {
	@Id
	@SequenceGenerator(name = "BOARD_SEQ", sequenceName = "BOARD_SEQ", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "BOARD_SEQ")
	private Long brd_id;
	
	private String brd_title;
	private String brd_content;
	private Long brd_hit = 0L;
	private byte[] brd_img;
	
	// ibatis용 (use mapper)
	// ibatis는 DB 컬럼이름과 일치해야 한다.
	@CreationTimestamp
	private Timestamp reg_date; 
	
	private String reg_userid;
	
//	private LocalDateTime created_at; 
//	private String created_by;
	
	// JPA용 (use repository)
	// Spring JPA만 DB의 created_at로 자동으로 매핑 시켜준다. camel <-> snake
//	private LocalDateTime createdAt;
//	private String createdBy;

}


