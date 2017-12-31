package com.admin.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import com.admin.entity.Admin;
import com.admin.service.AdminService;
import com.opensymphony.xwork2.ActionSupport;
import com.student.entity.User;
import com.student.service.UserService;

/*
 * 添加学生调用的类，这个是用来ajax调用的
 */
public class AddTeacherAction extends ActionSupport {
	private InputStream inputStream;
	@Resource(name = "adminService")
	private AdminService adminService;// 注入对象
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

	public AdminService getAdminService() {
		return adminService;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	/*
	 * 提交添加之后调用的action
	 */
	public String execute() throws Exception {
		System.out.println(admin.getTeacherId());
		if (admin.getTeacherId().equals("") || admin.getName().equals("")
				|| admin.getPassword().equals("")
				|| admin.getCoolege().equals("")||admin.getRole().equals("")) {
			inputStream = new ByteArrayInputStream(
					"添加失败，所有内容必须要填！！！".getBytes("UTF-8"));
			return SUCCESS;
		} else {
			// 如果教工号存在
			if (adminService.VerificationID(admin)) {
				inputStream = new ByteArrayInputStream(
						"添加失败，该教工号已经存在！！".getBytes("UTF-8"));
				return SUCCESS;
			} else {
				adminService.add(admin); // 添加
				inputStream = new ByteArrayInputStream("添加成功".getBytes("UTF-8"));
				return SUCCESS;
			}
		}

	}
}
