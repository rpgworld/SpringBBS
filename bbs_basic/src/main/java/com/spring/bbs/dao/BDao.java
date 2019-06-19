package com.spring.bbs.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.bbs.dto.BDto;

public interface BDao {
	public ArrayList<BDto> list(int start, int end);
	public int pageCnt();
	/* org.apache.ibatis.binding.BindingException: Parameter 'name' not found. Available parameters are [0, 1, 2, param3, param1, param2] ���� �߻�
	 *  /sqlmap/BBS_SQL.xml ���̹�Ƽ�� ���ۿ��� �Ű������� #{name} ������ �ƴ� ������ ��� ������, �� ����� ���� �̸��� ���� �����մϴ�. 
	 *  ������ �ش� �޼ҵ忡 parameterType="map" �� �߰����ݴϴ�. */
	public void write(@Param("name") String name, @Param("title") String title, @Param("content") String content);
	public BDto read(String num);
	public void updateCnt(String num);
	public void delete(String num);
}
