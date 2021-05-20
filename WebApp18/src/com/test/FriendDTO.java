/*======================
   FriendDTO.java
======================*/
package com.test;

public class FriendDTO
{
	// 주요 속성 구성 
	private String userName;	//-- 이름
	private String userAge;		//-- 나이
	private String userGender;	//-- 성별(라디오버튼)
	private String[] userIdeal;	//-- 이상형(체크박스) 
	//-- 이상형은 여러 개의 데이터가 동시에 전달되므로
	//   즉, 다중 선택이 가능하도록 구성된 컨트롤이기 때문에
	//   배열로 처리해야한다. 
	
	// getter / setter 구성
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getUserAge()
	{
		return userAge;
	}
	public void setUserAge(String userAge)
	{
		this.userAge = userAge;
	}
	public String getUserGender()
	{
		return userGender;
	}
	public void setUserGender(String userGender)
	{
		this.userGender = userGender;
	}
	public String[] getUserIdeal()
	{
		return userIdeal;
	}
	public void setUserIdeal(String[] userIdeal)
	{
		this.userIdeal = userIdeal;
	}
	
}
