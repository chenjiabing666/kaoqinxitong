package com.admin.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import com.admin.service.AdminService;
import com.opensymphony.xwork2.ActionSupport;
import com.student.entity.User;

/*
 * 修改学生的信息，ajax调用的action
 */
public class ChangeAction extends ActionSupport {
	private int id; // 学生id
	@Resource(name = "adminService")
	private AdminService adminService;
	private InputStream inputStream; // 输入流
	private User user; // User对象

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public int getId() {
		return id;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@Override
	public String execute() throws Exception {
		//调用方法更改，如果成功，那么返回修改成功
		if (adminService.changeUser(id, user)) {
			this.inputStream = new ByteArrayInputStream(
					"修改成功".getBytes("UTF-8"));
		} else {
			this.inputStream = new ByteArrayInputStream(
					"修改失败".getBytes("UTF-8"));
		}
		return SUCCESS;
	}

}
