package com.student.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;
import com.student.entity.User;
import com.student.service.UserService;
import com.tools.function.Tools;

public class RegistAction extends ActionSupport {
	private User user;
	@Resource(name = "userService")
	private UserService userService;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String execute() throws Exception {
		System.out.println("这个是一个注册界面");
		return NONE;
	}
	
	
	
}
