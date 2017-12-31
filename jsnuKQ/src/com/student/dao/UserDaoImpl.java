package com.student.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.student.entity.Situation;
import com.student.entity.User;

public class UserDaoImpl implements UserDao {

	@Resource(name = "hibernateTemplate")
	// 注入属性
	private HibernateTemplate hibernateTemplate;

	/*
	 * 向数据库中添加新的用户， user表示请求传过来的User对象
	 */
	public void add(User user) {
		hibernateTemplate.save(user); // 存储数据

	}

	/*
	 * 根据传送过来的数据验证用户是否存在，如果存在验证该用户的密码是否正确 user是User的对象，请求发送过来的
	 */
	public Boolean VerificationPssword(User user) {

		User u = this.getStudentUser(user.getStudentId()); // 查询对象
		// 如果长度为0表示没有查到
		if (u == null) {
			return false; // 返回false，用户不存在
		} else { // 如果长度不为0，表示存在这个用户
			// 如果用户输入的密码和数据库中的密码相同，那么返回true，否则返回false
			if (user.getPassword().equals(u.getPassword())) {
				return true;
			}
			return false;
		}

	}

	@Override
	public Boolean VerificationID(User user) {
		String hql = "from User user where user.studentId=?";
		// 根据studentId查询对象
		List<User> list = (List<User>) hibernateTemplate.find(hql,
				user.getStudentId());
		// 如果size==0表示不存在
		if (list.size() == 0) {

			return false;
		}
		return true;
	}

	// 根据学生的对象查询学生的状态
	public Set<Situation> getSituations(User user) {
		if (user != null) {
			Set<Situation> set = user.getSituations(); // 获取其中的Situation集合
			return set;
		}
		return null; // 如果没有查到，那么返回null
	}

	// 根据学号查询学生的信息
	public User getStudentUser(String studentId) {
		String hql = "from User user where studentId=?"; // hql语句
		List<User> list = (List<User>) hibernateTemplate.find(hql, studentId); // 执行find方法
		// 如果size!=0表示已经查到，因此返回第一个对象即可
		if (list.size() != 0) {
			return list.get(0);
		} else {
			return null;
		}

	}

	@Override
	public void changeStudent(User user) {
		User u = this.getStudentUser(user.getStudentId()); // 根据学号获取数据库中的学生对象
		u.setTelephone(user.getTelephone()); // 设置手机号码
		u.setPassword(user.getPassword()); // 设置密码
		hibernateTemplate.update(u); // 更新信息
	}

	@Override
	public Boolean verificationStudentID(String studentID) {
		String hql = "from User user where user.studentId=?"; // 创建hql语句
		List<User> list = (List<User>) hibernateTemplate.find(hql, studentID);
		// 如果长度为0表示没有查到，那么返回false，表示不存在
		if (list.size() == 0) {
			return false;
		} else {
			return true;
		}

	}

	@Test
	public void addSituation(List<Integer> id, List<Situation> situation) {

		for (int i = 0; i < id.size(); i++) {
			User user = hibernateTemplate.get(User.class, id.get(i));  //获取对象
			Set<Situation> s=user.getSituations();  //获取先前已经存在的集合
			s.add(situation.get(i));
			user.setSituations(s);
			
			hibernateTemplate.update(user);
		}

	}
	
	
	

}
