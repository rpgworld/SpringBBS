package com.spring.bbs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.bbs.dto.BDto;

public interface BDao {
	public ArrayList<BDto> list(int start, int end);
	public int pageCnt();
	/* org.apache.ibatis.binding.BindingException: Parameter 'name' not found. Available parameters are [0, 1, 2, param3, param1, param2] 에러 발생
	 *  /sqlmap/BBS_SQL.xml 마이바티스 매퍼에서 매개변수는 #{name} 같은게 아닌 저렇게 써야 되지만, 이 방법을 쓰면 이름을 지정 가능합니다. 
	 *  매퍼의 해당 메소드에 parameterType="map" 를 추가해줍니다. */
	public void write(@Param("name") String name, @Param("title") String title, @Param("content") String content);
	public BDto read(String num);
	public void updateCnt(String num);
	public void delete(String num);
}
