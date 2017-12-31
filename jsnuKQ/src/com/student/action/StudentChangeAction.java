package com.student.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionSupport;
import com.student.entity.User;
import com.student.service.UserService;

/*
 *  这个类是用于响应学生信息修改的类，用于实现ajax的请求
 */
public class StudentChangeAction extends ActionSupport {
	@Resource(name="userService")  //注入属性
	private UserService userService;
	private User user; // 学生对象
	private InputStream inputStream; // 输入流对象

	public User getUser() {
		return user;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
	public String execute() throws Exception {
		userService.changeStudent(user);    //修改学生信息
		inputStream=new ByteArrayInputStream("成功修改".getBytes("UTF-8"));  //返回数据
		return SUCCESS;
	}
}
