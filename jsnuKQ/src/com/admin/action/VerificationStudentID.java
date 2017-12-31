package com.admin.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionSupport;
import com.student.service.UserService;

/*
 * 验证学号的类，用来ajax检测用户是否存在
 */
public class VerificationStudentID extends ActionSupport {
	private String studentID; // 学号
	@Resource(name = "userService")
	private UserService userService; // UserService的类，用来处理逻辑
	private InputStream inputStream; // 输入流，用来响应ajax

	public String getStudentID() {
		return studentID;
	}

	public UserService getUserService() {
		return userService;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	@Override
	public String execute() throws Exception {

		System.out.println(studentID + "--------------------->");
		// 如果不存在，那么就可以返回可以添加
		if (!userService.verificationStudentID(studentID)) {
			inputStream = new ByteArrayInputStream("该学号不存在，可以添加".getBytes("UTF-8"));
		}else {
			inputStream = new ByteArrayInputStream("该学号已经存在，不可以添加".getBytes("UTF-8"));
		}
		return SUCCESS;
	}
}
