package com.example.bms.entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@Entity
public class Notice {
	
	@Id
	@SequenceGenerator(name = "NOTICE_SEQ", sequenceName = "NOTICE_SEQ", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "NOTICE_SEQ")
	private Long id;
	
	private String title;
	private String content;
	private char yn;
	
//	private LocalDateTime createdAt;
	private Timestamp createdAt;
	private String createdBy;
	
	private Timestamp modifiedAt;
//	private LocalDateTime modifiedAt;
	private String modifiedBy;

}
