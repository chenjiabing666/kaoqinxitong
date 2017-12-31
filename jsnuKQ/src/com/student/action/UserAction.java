package com.student.action;

import java.util.Iterator;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.springframework.http.HttpRequest;

import com.opensymphony.xwork2.ActionSupport;
import com.student.entity.Situation;
import com.student.entity.User;
import com.student.service.UserService;
import com.tools.function.Tools;

public class UserAction extends ActionSupport {
	private User user; // User实体类的对象
	@Resource(name = "userService")
	// 注入UserService对象
	private UserService userService;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	// 这个是验证登录的方法
	public String execute() throws Exception {
		// 获取session对象
		HttpSession session = ServletActionContext.getRequest().getSession();
		// 如果已经登录过了，那么直接跳转到首页即可
		if (session.getAttribute("auto_student") != null) {
			return SUCCESS;
		} 
		if (Tools.isNULL(user)) {
			return INPUT;
		}
		// 如果用户存在,那么开始验证密码
		if (userService.VerificationPssword(this.getUser())) {
			session.setAttribute("auto_student", "true"); // 设置属性，便于后面的自动登录
			session.setMaxInactiveInterval(1800); // 设置sssion的保存时间为半小时
			session.setAttribute("studentId", user.getStudentId()); // 将用户的学号存在session中
			return SUCCESS;
		} else {
			// 添加错误提示信息
			this.addFieldError("stIdNotExist", "学号或者密码错误，请重新输入");
			return INPUT; // 用户不存在重新登录
		}
	}

	// 注册的方法
	public String regist() {
		// 如果uesr为空，意味着没有注册，那么就要跳转到注册的页面
		if (Tools.isNULL(user)) {
			return "regist"; // 重新注册
		}
		// 验证用户是否存在，如果studentID已经存在，返回重新注册
		if (userService.VerificationID(user)) {
			this.addFieldError("stIdExist", "用户名已经存在"); // 添加提示信息，将会在学号的下面显示出来
			return "regist"; // 返回重新注册
		}

		userService.add(user); // 调用add方法向其中添加数据
		// 设置session的值，保证之后可以自动登录
		ServletActionContext.getRequest().getSession()
				.setAttribute("auto_student", "true");
		ServletActionContext.getRequest().getSession()
				.setMaxInactiveInterval(1800); // 设置sssion的保存时间为半小时
		return SUCCESS; // 添加成功后跳转到首页即可，不需要再次登录
	}

	// 跳转到首页的Action，主要就是提取数据库中的信息
	public String HomePage() {
		HttpSession session = ServletActionContext.getRequest().getSession(); // 获取session
		HttpServletRequest request = ServletActionContext.getRequest(); // 获取request
		String studentId = (String) session.getAttribute("studentId"); // 获取前面的登录的学生学号
		User user = userService.getStudentUser(studentId); // 根据学生学号查询学生的个人信息
		Set<Situation> set = userService.getSituations(user); // 获取学生考勤信息
		request.setAttribute("set", set); // 传递set信息
		request.setAttribute("user", user); // 传递学生的个人信息
		return SUCCESS;
	}
	
	
	//退出登录的action
	public String Exit(){
		HttpSession session=ServletActionContext.getRequest().getSession();
		session.removeAttribute("auto_student");  //删除这个属性，以免自动登录
		return SUCCESS;
	}
}
