package com.spring.bbs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.bbs.dto.BDto;

public interface BDao {
	public ArrayList<BDto> list(int start, int end);
	public int bbsCnt();
	/* org.apache.ibatis.binding.BindingException: Parameter 'name' not found. Available parameters are [0, 1, 2, param3, param1, param2] 에러 발생
	 *  /sqlmap/BBS_SQL.xml 마이바티스 매퍼에서 매개변수는 #{name} 같은게 아닌 저렇게 써야 되지만, 이 방법을 쓰면 이름을 지정 가능합니다. 
	 *  매퍼의 해당 메소드에 parameterType="map" 를 추가해줍니다. */
	public void write(@Param("name") String name, @Param("title") String title, @Param("content") String content);
	public BDto read(String num);
	public void updateCntUp(String num);
	public int replyCheck(String num);
	public void delete(String num);
	public void deleteReplyCntUpdate(@Param("ref") String ref, @Param("step") String step, @Param("lev") int lev);
	public void update(@Param("title") String title, @Param("content") String content, @Param("num") String num);
	public ArrayList<BDto> search(@Param("searchOption") String searchOption, @Param("searchWord") String searchWord, @Param("start") int start, @Param("end") int end);
	public int replySearchStep(@Param("ref") String ref, @Param("step") String step, @Param("lev") String lev);
	public void replyStepUp(@Param("ref") String ref, @Param("replyStep") int replyStep);
	public int replyMaxStep(String ref);
	public void reply(@Param("name") String name, @Param("title") String title, @Param("content") String content, @Param("ref") String ref,@Param("replyStep") int replyStep, @Param("lev") String lev);
	public void replyCntUpdate(@Param("ref") String ref, @Param("step") int step, @Param("lev") int lev);
}
