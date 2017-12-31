package com.admin.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import com.admin.service.AdminService;
import com.opensymphony.xwork2.ActionSupport;
import com.student.service.UserService;

/*
 * 验证学号的类，用来ajax检测用户是否存在
 */
public class VerificationTeacherIDAction extends ActionSupport {
	private String teacherId; // 学号
	@Resource(name = "adminService")
	private AdminService adminService;
	private InputStream inputStream; // 输入流，用来响应ajax

	public String getTeacherId() {
		return teacherId;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	@Override
	public String execute() throws Exception {

		System.out.println(teacherId + "--------------------->");
		// 如果不存在，那么就可以返回可以添加
		if (!adminService.verificationTeacherID(teacherId)) {
			inputStream = new ByteArrayInputStream(
					"该教工号不存在，可以添加".getBytes("UTF-8"));
		} else {
			inputStream = new ByteArrayInputStream(
					"该教工号已经存在，不可以添加".getBytes("UTF-8"));
		}
		return SUCCESS;
	}
}
