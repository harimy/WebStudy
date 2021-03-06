/*====================
   BoardDTO.java
====================*/

/*
이름       널?       유형             
-------- -------- -------------- 
NUM      NOT NULL NUMBER(9)      
NAME     NOT NULL VARCHAR2(30)   
PWD      NOT NULL VARCHAR2(20)   
EMAIL             VARCHAR2(50)   
SUBJECT  NOT NULL VARCHAR2(100)  
CONTENT  NOT NULL VARCHAR2(4000) 
IPADDR            VARCHAR2(20)   
HITCOUNT NOT NULL NUMBER         
CREATED  NOT NULL DATE   
*/

package com.test;

public class BoardDTO
{
	// TBL_BOARD 테이블의 레코드 구조와 동일한 속성 구성
	private int num;
	private String name, pwd, email, subject, content, idAddr, created;
	private int hitCount;
	
	// 사용자 정의 생성자를 정의하지 않음 
	// → default 생성자가 자동으로 삽입될 예정
	
	// getter / setter 구성 
	public int getNum()
	{
		return num;
	}
	public void setNum(int num)
	{
		this.num = num;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getPwd()
	{
		return pwd;
	}
	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getIdAddr()
	{
		return idAddr;
	}
	public void setIdAddr(String idAddr)
	{
		this.idAddr = idAddr;
	}
	public String getCreated()
	{
		return created;
	}
	public void setCreated(String created)
	{
		this.created = created;
	}
	public int getHitCount()
	{
		return hitCount;
	}
	public void setHitCount(int hitCount)
	{
		this.hitCount = hitCount;
	}
	
}
