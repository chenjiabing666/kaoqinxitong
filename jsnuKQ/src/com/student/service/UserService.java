package com.student.service;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.student.dao.UserDao;
import com.student.entity.Situation;
import com.student.entity.User;

@Transactional
public class UserService {

	@Resource(name = "userDaoImpl")
	// 注入属性
	private UserDao userDao;

	// 添加用户
	public void add(User user) {
		userDao.add(user);
	}

	// 验证学生密码
	public Boolean VerificationPssword(User user) {
		return userDao.VerificationPssword(user);
	}

	// 验证studentID
	public Boolean VerificationID(User user) {
		return userDao.VerificationID(user);
	}

	// 根据学生的学号查询学生的状态
	public Set<Situation> getSituations(User user) {
		return userDao.getSituations(user);
	}

	// 根据学生的学号查询学生的信息
	public User getStudentUser(String studentId) {
		return userDao.getStudentUser(studentId);
	}

	// 根据对象改变学生的信息
	public void changeStudent(User user) {
		userDao.changeStudent(user);
	}

	// 根据学生的学号验证该用户是否存在
	public Boolean verificationStudentID(String studentID) {
		return userDao.verificationStudentID(studentID);
	}
	
	//根据学生的id存储Situation
		public void addSituation(List<Integer> id,List<Situation> situation){
			userDao.addSituation(id, situation);
		}
}
