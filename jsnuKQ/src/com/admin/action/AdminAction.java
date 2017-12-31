package com.admin.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.admin.entity.Admin;
import com.admin.service.AdminService;
import com.opensymphony.xwork2.ActionSupport;
import com.student.entity.User;
import com.student.service.UserService;
import com.tools.function.Tools;

public class AdminAction extends ActionSupport {
	@Resource(name = "adminService")
	private AdminService adminService; // Admin的serive类
	@Resource(name="userService")
	private UserService userService;  
	private Admin admin; // Admin实体类的对象
	

	public AdminService getAdminService() {
		return adminService;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	// 登录的action
	public String execute() throws Exception {

		// 获取session对象，便于自动登录
		HttpSession session = ServletActionContext.getRequest().getSession();
		Object value = session.getAttribute("auto_teacher");
		// 表示之前没有登录过，或者会话过期了
		if (value == null) {
			// 如果admin是空的表示直接访问当前页面，并没有通过login.jsp跳转过来的
			if (Tools.isNULL(admin)) {
				return INPUT; // 返回登录界面
			}
			// 如果admin不为空，表示登录过来的,此时需要验证用户名和密码
			else {
				// 根据教工号获取对象，如果存在那么返回对象，否则返回的是null
				Admin a = adminService.getAdminObject(admin.getTeacherId());
				// 教工号存在，那么验证密码
				if (a != null) {
					// 如果密码正确，就可以登录了
					if (a.getPassword().equals(admin.getPassword())) {
						session.setAttribute("admin", a); // 将对象数据添加到session中
						session.setAttribute("auto_teacher", "true"); // 设置属性，便于后面的自动登录
						return SUCCESS;
					} else {
						this.addFieldError("pwError", "密码错误，请重新输入"); // 密码错误提示信息
						return INPUT; // 返回登录界面
					}
				} else {
					this.addFieldError("IdError", "教工号不存在，请重新输入"); // 添加错误提示信息
					return INPUT; // 返回重新登录
				}

			}

		}
		// 如果value不为空，表示之前登录过的
		else {
			return SUCCESS; // 跳转到首页
		}

	}

	/*
	 * 跳抓到首页的action
	 */
	public String home() {
		HttpServletRequest request = ServletActionContext.getRequest(); // 获取request对象
		HttpSession session = request.getSession(); // 获取session
		Admin admin = (Admin) session.getAttribute("admin"); // 获取登录时传过来的admin对象
		System.out.println(admin.getRole());
		// 如果是管理员，跳转到管理员的界面
		if (Tools.ADMIN.equals(admin.getRole())) {
			List<String> coolegelist = adminService.getcoolege(); // 查询所有的学院
			List<String> clsList = adminService.getcls(); // 查询所有的班级
			if (coolegelist != null && clsList != null) {
				List<User> userlist = adminService.getUserList("大一",
						coolegelist.get(0), clsList.get(0)); // 默认获取大一的对象
				request.setAttribute("coolege", coolegelist); // 学院添加到request属性中
				request.setAttribute("cls", clsList); // 班级添加到session中
				request.setAttribute("userList", userlist);// 将获取的对象绑定到request属性中
			}
			// request.setAttribute("coolege", coolegelist); // 学院添加到request属性中
			// request.setAttribute("cls", clsList); // 班级添加到request中
			return "admin";
		}
		// 如果是老师，跳转到老师的界面
		else {
			
			List<String> coolegelist = adminService.getcoolege(); // 查询所有的学院
			List<String> clsList = adminService.getcls(); // 查询所有的班级
			if (coolegelist != null && clsList != null) {
				List<User> userlist = adminService.getUserList("大一",
						coolegelist.get(0), clsList.get(0)); // 默认获取大一的对象
				request.setAttribute("coolege", coolegelist); // 学院添加到request属性中
				request.setAttribute("cls", clsList); // 班级添加到session中
				request.setAttribute("userList", userlist);// 将获取的对象绑定到request属性中
			}
			return "teacher"; // 跳转到老师的界面
		}

	}

	// 注册的方法
	public String regist() {
		System.out.println("执行。。。。。。。。。。。");
		// 如果admin为空，意味着没有注册，那么就要跳转到注册的页面
		if (Tools.isNULL(admin)) {
			return "regist"; // 重新注册
		}

		// 验证用户是否存在，如果studentID已经存在，返回重新注册
		if (adminService.VerificationID(admin)) {
			this.addFieldError("stIdExist", "用户名已经存在"); // 添加提示信息，将会在学号的下面显示出来
			return "regist"; // 返回重新注册
		}

		adminService.add(admin); // 调用add方法向其中添加数据
		// 设置session的值，保证之后可以自动登录
		ServletActionContext.getRequest().getSession()
				.setAttribute("auto_teacher", "true");
		return SUCCESS; // 添加成功后跳转到首页即可，不需要再次登录
	}

	// 退出系统
	public String exit() {
		// 获取session对象
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("auto_teacher"); // 删除session中的自动登录
		return INPUT; // 返回登录界面
	}

	// 添加学生
	public String addStudent() {

		return SUCCESS;
	}
	
	
	// 添加教师
	public String addTeacher() {

		return SUCCESS;
	}


	public String ManageTeacher() {
		HttpServletRequest request = ServletActionContext.getRequest(); // 获取request对象
		List<String> coolegelist = adminService.getTeacherCoolege(); // 查询教师中所有的学院信息
		// 如果不为空
		if (coolegelist != null) {
			List<Admin> admins = adminService.getTeacherList("大一",
					coolegelist.get(0)); // 默认获取大一的并且学院是第一个的信息

			request.setAttribute("adminList", admins);// 将获取的对象绑定到request属性中
			request.setAttribute("coolege", coolegelist); // 学院添加到request属性中

		}

		return SUCCESS;
	}
}
