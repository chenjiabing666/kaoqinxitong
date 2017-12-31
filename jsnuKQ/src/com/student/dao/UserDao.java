package com.student.dao;

import java.util.List;
import java.util.Set;

import org.springframework.orm.hibernate5.HibernateTemplate;

import com.student.entity.Situation;
import com.student.entity.User;

public interface UserDao {
	// 向其中添加数据
	public void add(User user);

	// 验证这个用户是否存在
	public Boolean VerificationPssword(User user);

	// 验证学号是否存在
	public Boolean VerificationID(User user);

	// 根据学生的对象查询学生的状态
	public Set<Situation> getSituations(User user);

	// 根据学生的学号查询学生的信息
	public User getStudentUser(String studentId);

	//根据对象修改学生的信息
	public void changeStudent(User user);
	
	//根据学生的学号验证该用户是否存在
	public Boolean verificationStudentID(String studentID); 
	
	//根据学生的id存储Situation
	public void addSituation(List<Integer> id,List<Situation> situation);

}
