package com.example.bms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.bms.entity.Board;

@Mapper
public interface BoardMapper {

	@Select({ "SELECT * FROM BOARD" })
	public List<Board> getList();

	@Select({ "SELECT * FROM BOARD WHERE BRD_ID = #{id}" })
	public Board getBoard(@Param("id") Long id);

	@Insert({ " INSERT INTO BOARD " 
			+ " (BRD_ID, BRD_TITLE, BRD_CONTENT, REG_DATE, REG_USERID, BRD_HIT) " 
			+ " VALUES "
			+ " (BOARD_SEQ.NEXTVAL, #{board.brd_title}, #{board.brd_content}, SYSDATE, #{board.reg_userid}, 0) " })
	public int setBoard(@Param("board") Board board);
	
	@Update({ " UPDATE BOARD SET " 
	+ " BRD_TITLE = #{board.brd_title}, BRD_CONTENT = #{board.brd_content} " 
	+ " WHERE BRD_ID = #{board.brd_id} " })
	public int updateBoard(@Param("board") Board board);
	
	@Delete({ " DELETE FROM BOARD WHERE BRD_ID = #{id} " })
	public int deleteBoard(@Param("id") Long id);

	@Update({" UPDATE BOARD SET BRD_HIT = (BRD_HIT + 1) WHERE BRD_ID = #{id} "})
	public int updateHit(@Param("id") Long id);
}
