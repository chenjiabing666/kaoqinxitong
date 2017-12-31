package com.tools.interceptor;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/*
 * 拦截器类，主要的功能就是实现一些在没有登录的情况下限制访问
 */
public class AutoStudentInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		//String teacher_value = (String) session.getAttribute("auto_teacher"); // 获取session的值
		String student_value=(String) session.getAttribute("auto_student");
		if (student_value == null) {
			return "input"; // 返回到登录界面
		}

		String result = arg0.invoke(); // 继续调用下一个拦截器

		return result;
	}

}
