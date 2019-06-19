package com.spring.bbs.dao;

import com.spring.bbs.dto.UDto;

public interface UDao {
	public void join(UDto dto);
	public String login(String id);
}
