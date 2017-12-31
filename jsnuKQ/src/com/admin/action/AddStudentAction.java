package com.admin.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;

import javax.annotation.Resource;

import com.admin.service.AdminService;
import com.opensymphony.xwork2.ActionSupport;
import com.student.entity.User;
import com.student.service.UserService;

/*
 * 添加学生调用的类，这个是用来ajax调用的
 */
public class AddStudentAction extends ActionSupport {
	private InputStream inputStream;   //输入流
	@Resource(name = "adminService")
	private AdminService adminService;// 注入对象
	@Resource(name = "userService")
	private UserService userService;   //UserService对象
	private User user;   //User对象，用于接收表单传过来的数据
	public InputStream getInputStream() {
		return inputStream;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public User getUser() {
		return user;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public void setUser(User user) {
		this.user = user;
	}

	/*
	 * 提交添加之后调用的action
	 */
	public String execute() throws Exception {
		if (user.getStudentId().equals("") || user.getName().equals("")
				|| user.getPassword().equals("")
				|| user.getCoolege().equals("") || user.getCls().equals("")) {
			inputStream = new ByteArrayInputStream(
					"添加失败，所有内容必须要填！！！".getBytes("UTF-8"));
			return SUCCESS;
		} else {
			// 如果学号存在
			if (userService.VerificationID(user)) {
				inputStream = new ByteArrayInputStream(
						"添加失败，该学号已经存在！！".getBytes("UTF-8"));
				return SUCCESS;
			} else {
				userService.add(user); // 添加
				inputStream = new ByteArrayInputStream("添加成功".getBytes("UTF-8"));
				return SUCCESS;
			}
		}

	}
}
