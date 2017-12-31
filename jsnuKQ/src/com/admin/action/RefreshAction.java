package com.admin.action;

import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.admin.service.AdminService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.student.entity.User;

/*
 * 点击刷新按钮调用的action，这个是用来ajax加载数据
 */
public class RefreshAction extends ActionSupport {
	@Resource(name = "adminService")
	// 注入属性
	private AdminService adminService;
	private String result;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String execute() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest(); // 获取request
		// 下面获取传过来的参数
		String grade = request.getParameter("grade");
		String coolege = request.getParameter("coolege");
		String cls = request.getParameter("cls");
		// 根据参数获取对象集合
		List<User> list = adminService.getUserList(grade, coolege, cls);
		this.result = new Gson().toJson(list); // 转换为json数据

		return SUCCESS;
	}
}
