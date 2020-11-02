package com.example.bms.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@Entity
@EntityListeners(AuditingEntityListener.class) // date
public class Notice {
	
	@Id
	@SequenceGenerator(name = "NOTICE_SEQ", sequenceName = "NOTICE_SEQ", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "NOTICE_SEQ")
	private Long id;
	
	private String title;
	private String content;
	private char yn;
	
	@CreatedDate
	private LocalDateTime createdAt;
	private String createdBy;

	@LastModifiedDate
	private LocalDateTime modifiedAt;
	private String modifiedBy;

}
