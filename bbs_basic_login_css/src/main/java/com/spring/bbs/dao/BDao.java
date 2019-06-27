package com.spring.bbs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.bbs.dto.BDto;

public interface BDao {
	public ArrayList<BDto> list(int start, int end);
	public int bbsCnt();
	/* org.apache.ibatis.binding.BindingException: Parameter 'name' not found. Available parameters are [0, 1, 2, param3, param1, param2] ���� �߻�
	 *  /sqlmap/BBS_SQL.xml ���̹�Ƽ�� ���ۿ��� �Ű������� #{name} ������ �ƴ� ������ ��� ������, �� ����� ���� �̸��� ���� �����մϴ�. 
	 *  ������ �ش� �޼ҵ忡 parameterType="map" �� �߰����ݴϴ�. */
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
