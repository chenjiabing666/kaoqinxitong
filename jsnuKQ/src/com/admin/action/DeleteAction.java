package com.admin.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import com.admin.service.AdminService;
import com.opensymphony.xwork2.ActionSupport;

/*
 * 删除学生信息的类，ajax调用的action
 */
public class DeleteAction extends ActionSupport {
	@Resource(name = "adminService")
	// 注入属性
	private AdminService adminService;
	private int id; // id
	private InputStream inputStream; // 输入流

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public int getId() {
		return id;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String execute() throws Exception {
		//调用删除的方法，删除，如果删除成功 返回删除成功  
		if (adminService.delete(id)) {
			inputStream = new ByteArrayInputStream("删除成功".getBytes("UTF-8"));
		}else {
			inputStream = new ByteArrayInputStream("删除失败".getBytes("UTF-8"));
		}
		return SUCCESS;
	}

}
