package com.example.bms.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@Entity
public class Member {
	@Id
	@SequenceGenerator(name = "MEMBER_SEQ", sequenceName = "MEMBER_SEQ", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEMBER_SEQ")
	private Long id;
	
	private String userid;
	private String username;
	private String userpw;
	private String userphone;
	
	// spring이 DB의 created_at 로 매핑 시켜준다. camel <-> snake
	private LocalDateTime createdAt; 
	private String createdBy;
}
