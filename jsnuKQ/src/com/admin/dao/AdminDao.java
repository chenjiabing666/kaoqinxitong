package com.admin.dao;

import java.util.List;

import com.admin.entity.Admin;
import com.student.entity.User;

public interface AdminDao {
	// 添加用户
	public void add(Admin admin);

	// 验证教工号是否存在
	Boolean VerificationID(Admin admin);

	// 验证密码是否正确
	Boolean VerificationPssword(Admin admin);

	// 根据教工号获取对象
	public Admin getAdminObject(String teacherId);

	// 返回学生信息中学院的列表
	public List<String> getcoolege();

	// 返回学生信息中班级的列表
	public List<String> getcls();

	// 根据年级学院班级获取所有学生的信息
	public List<User> getUserList(String grade, String coolege, String cls);

	// 根据id删除学生的信息
	public Boolean delete(int id);
	
	//根据教师的id删除这个教师信息
	public Boolean deleteTeacher(int id);  

	// 根据id，和user对象更改信息
	public Boolean changeUser(int id, User user);

	// 获取所有老师信息中的年级信息
	public List<String> getTeacherGrade();

	// 获取所有老师信息中的学院信息
	public List<String> getTeacherCoolege();

	/*
	 * 根据学院，年级获取所有的老师信息 grade ：年级 coolege:学院
	 */
	public List<Admin> getTeacherList(String grade, String coolege);
	
	//根据学号修改教师的信息
	public Boolean chageTeacher(int id,Admin admin);
	
	//根据teacherId验证这个用于是否存在
	public Boolean verificationTeacherID(String teacherId);
}
