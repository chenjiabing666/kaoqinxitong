package com.admin.action;

import java.io.InputStream;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import com.admin.service.AdminService;
import com.opensymphony.xwork2.ActionSupport;
import com.student.entity.Situation;
import com.student.service.UserService;

/*
 * 教师考勤提交调用的action，主要是为了ajax响应
 */
public class TeacherCheckAction extends ActionSupport {

	@Resource(name = "adminService")
	private AdminService adminService;
	@Resource(name="userService")
	private UserService userService;
	private List<Integer> id; // 学生的id
	private List<Situation> situation; // 学生的考核状态
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	

	public AdminService getAdminService() {
		return adminService;
	}

	public List<Integer> getId() {
		return id;
	}

	public void setId(List<Integer> id) {
		this.id = id;
	}

	public List<Situation> getSituation() {
		return situation;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public void setSituation( List<Situation> situation) {
		this.situation = situation;
	}

	@Override
	public String execute() throws Exception {
		userService.addSituation(id, situation);  //添加
		return SUCCESS;
	}

}
