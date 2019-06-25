package com.spring.bbs.dto;

public class UDto {
	private int pid;
	private String id;
	private String pw;
	private String name;
	private int age;
	private String Email;
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
	
}

/*

create table spring_user (
pid number(10) primary key,
id varchar2(20) not null,
pw varchar2(20) not null,
name varchar2(20) not null,
age number(4) not null,
email varchar2(50)
);

create SEQUENCE spring_user_seq;

insert into spring_user values (spring_user_seq.nextval, 'aaa', '1111', 'aaa', 10, 'aaa@naver.com');

*/