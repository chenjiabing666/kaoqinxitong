package com.admin.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.admin.entity.Admin;
import com.admin.service.AdminService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

/*
 * 管理教师的刷新action，用于ajax调用
 */
public class RefreshTeacher extends ActionSupport {
	@Resource(name = "adminService")
	private AdminService adminService;// 注入属性
	private String result; // 返回的结果

	public AdminService getAdminService() {
		return adminService;
	}

	public String getResult() {
		return result;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest(); // 获取request
		// 下面获取传过来的参数
		String grade = request.getParameter("grade");
		String coolege = request.getParameter("coolege");
		List<Admin> list=adminService.getTeacherList(grade, coolege);  //获取对象
		this.result=new Gson().toJson(list);  //转换为json数据
		return SUCCESS;
	}
}
