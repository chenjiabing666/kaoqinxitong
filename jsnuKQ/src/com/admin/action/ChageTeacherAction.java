package com.admin.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import com.admin.entity.Admin;
import com.admin.service.AdminService;
import com.opensymphony.xwork2.ActionSupport;
import com.student.entity.User;

/*
 * 修改教师的信息，ajax调用的action
 */
public class ChageTeacherAction extends ActionSupport {
	private int id; // 学生id
	@Resource(name = "adminService")
	private AdminService adminService;
	private InputStream inputStream; // 输入流
	private Admin admin;


	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
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
		if (adminService.chageTeacher(id, admin)) {
			this.inputStream = new ByteArrayInputStream(
					"修改成功".getBytes("UTF-8"));
		} else {
			this.inputStream = new ByteArrayInputStream(
					"修改失败".getBytes("UTF-8"));
		}
		return SUCCESS;
	}

}
